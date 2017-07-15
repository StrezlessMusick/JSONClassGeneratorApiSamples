//
//  ApiJsonCodeGenerator
//

#import "NSArray+Api.h"
#import "NSDictionary+Api.h"

#ifndef API_DISABLE_UNNECESSARY_CATEGORIES
#import "Optional.h"
#endif

@implementation NSArray (Api)

/// @brief api_map (*2) [1,2,3] == [2,4,6]
- (NSArray *)api_map:(id(^)(id a))fun
{
    NSMutableArray *acc = [NSMutableArray array];
    for (id obj in self) {
        [acc addObject: fun(obj)?:[NSNull null]];
    }
    return [NSArray arrayWithArray:acc];
}

/// @brief api_filter (>3) [1,2,3,4,5,4,3,2,1] == [4,5,4]
- (NSArray *)api_filter:(BOOL(^)(id a))pred
{
    NSMutableArray *acc = [NSMutableArray array];
    for (id obj in self) {
        if (pred(obj)) {
            [acc addObject:obj];
        }
    }
    return [NSArray arrayWithArray:acc];
}

/// @brief api_zipWith (*) [1,2,3] [3,4,5] == [3,8,15]
- (NSArray *)api_zipWith:(id(^)(id a, id b))fun array:(NSArray *)array {
    NSMutableArray *result = [NSMutableArray array];
    NSUInteger len = MAX(self.count, array.count);
    for (NSUInteger i = 0; i < len; ++i) {
        id obj = fun(self[i], array[i]);
        [result addObject:obj ?: [NSNull null]];
    }
    return [NSArray arrayWithArray:result];
}

/// @brief api_arrayByReplicating @"echo" 3 == @[@"echo", @"echo", @"echo"]
+ (NSArray *)api_arrayByReplicating:(id)object cnt:(NSInteger)times {
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < times; ++i) {
        [array addObject:object];
    }
    return [NSArray arrayWithArray:array];
}

/// @brief drop 3 [1,2,4,8,16] == [8,16]
- (NSArray *)api_drop:(NSInteger)cnt { // [self null] is important, because the ranges would be wrong otherwise
    if (cnt <= 0) {
        return self;
    }
    return self.count ? [self subarrayWithRange:NSMakeRange(MIN((NSUInteger)cnt, self.count-1), self.count-(MIN((NSUInteger)cnt, self.count)))] : self;
}

@end


#ifndef API_DISABLE_UNNECESSARY_CATEGORIES

@implementation NSArray (ApiMore)

/// @brief catOptionals = filter (\optional -> optional.hasValue)
- (NSArray *)api_catOptionals {
    NSMutableArray *array = [NSMutableArray array];
    for (Optional *opt in self) {
        if (opt.isValue) {
            [array addObject:opt.valueOrException];
        }
    }
    return [NSArray arrayWithArray:array];
}

/// @brief removes all objects, that equal by -isEqual:
- (NSArray *)api_arrayByRemovingObject:(id)b {
    return [self api_filter:^BOOL(id a) {
        return ![a isEqual:b];
    }];
}

/// @brief [[a,b],[],[c]] -> [a,b,c]
- (NSArray *)api_concat {
    NSMutableArray *array = [NSMutableArray array];
    for (NSArray *innerArray in self) {
        [array addObjectsFromArray:innerArray];
    }
    return [NSArray arrayWithArray:array];
}

/// @brief [a mapAndConcat:f] == [[a map:f] concat]
- (NSArray *)api_mapAndConcat:(NSArray *(^)(id a))fun {
    return [[self api_map:fun] api_concat];
}

/// @brief take 3 [1,2,4,8,16] == [1,2,4]
- (NSArray *)api_take:(NSInteger)cnt {
    if (cnt <= 0) {
        return @[];
    }
    return [self subarrayWithRange:NSMakeRange(0, MIN(self.count,(NSUInteger)cnt))];
}


/// @brief takeWhile (<3) [1,2,3,4,5] == [1,2]
- (NSArray *)api_takeWhile:(BOOL(^)(id))pred {
    NSMutableArray *array = [NSMutableArray array];
    for (id obj in self) {
        if (pred(obj)) {
            [array addObject:obj];
            continue;
        }
        break;
    }
    return [NSArray arrayWithArray:array];
}

/// @brief dropWhile (<3) [1,2,3,4,5] == [3,4,5]
- (NSArray *)api_dropWhile:(BOOL(^)(id))pred {
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    for (id obj in self) { // don't enumerate 'array'
        if (pred(obj)) {
            [array removeObjectAtIndex:0];
            continue;
        }
        break;
    }
    return [NSArray arrayWithArray:array];
}

/// @brief partition (<3) $ [1,2,3,4,5,5,4,3,2,1] == ([1,2,2,1],[3,4,5,5,4,3]) (filter p,filter (!p))
- (NSArray *)api_partition:(BOOL(^)(id a))pred {
    NSMutableArray *trues  = [NSMutableArray array];
    NSMutableArray *falses = [NSMutableArray array];
    for (id obj in self) {
        [pred(obj) ? trues : falses addObject:obj];
    }
    return @[ [trues copy], [falses copy] ];
}

/// @brief span (<3) $ [1,2,3,4,5,5,4,3,2,1] == ([1,2],[3,4,5,5,4,3,2,1]) (takeWhile,dropWhile)
- (NSArray *)api_span:(BOOL(^)(id a))pred {
    NSMutableArray *firsts = [NSMutableArray array];
    __block NSArray *lasts = @[];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (pred(obj)) {
            [firsts addObject:obj];
        } else {
            lasts = [self subarrayWithRange:NSMakeRange(idx, self.count-idx)];
            *stop = YES;
        }
    }];
    return @[ [firsts copy], lasts ];
}

/// @brief group [1,2,2,3,2] == [[1],[2,2],[3],[2]]
- (NSArray *)api_group {
    return [self api_groupBy:^(id a, id b){ return [a isEqual:b]; }];
}

/// @brief groupBy ((==) `on`length) ["a","bc","de","fgh","ij"] == [["a"],["bc","de"],["fgh"],["ij"]], "isEqual" must be transitive
- (NSArray *)api_groupBy:(BOOL(^)(id a, id b))isEqual {
    if (!self.count) {
        return @[];
    }
    id x = self.firstObject;
    NSArray *xs = [self api_drop:1];
    NSArray *ysZs = [xs api_span:^(id a){ return isEqual(a,x); }];
    NSArray *ys = ysZs.firstObject;
    NSArray *zs = ysZs.lastObject;
    return [@[[@[x] arrayByAddingObjectsFromArray:ys]] arrayByAddingObjectsFromArray:[zs api_groupBy:isEqual]];
}

/// @brief groupSectionsBy ((==)`on`length) ["a","bc","de","fgh","ij"] == [[1,["a"]],[2,["bc","de"]],[3,["fgh"]],[2,["ij"]]], "isEqual" must be transitive
- (NSArray *)api_groupSectionsByIsEqualOn:(NSObject *(^)(id a))getter {
    return [[self api_groupBy:^(id a, id b){ return [getter(a) isEqual:getter(b)]; }]
            api_map:^(NSArray *group){ return @[getter(group.firstObject),group]; }];
}

- (NSDictionary *)api_groupByComparing:(id<NSCopying> (^)(id a))getter {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (id obj in self) {
        id<NSCopying> key = getter(obj);
        if (!key) {
            key = [NSNull null];
        }
        NSMutableArray *array = dict[key];
        if (!array) {
            array = [NSMutableArray array];
            dict[key] = array;
        }
        [array addObject:obj];
    }
    return [dict api_map:^(NSArray *tuple){ return @[tuple.firstObject,[tuple.lastObject copy]]; }];
}

- (NSData *)api_toJson {
    NSError *error;
    NSData *json = nil;
    @try {
        json = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    }
    @catch (NSException *exception) {
        
    }
    
    if (!json || error) {
        return [@"[]" dataUsingEncoding:NSUTF8StringEncoding];
    }
    return json;
}

- (NSArray *)api_reverse {
    NSMutableArray *array = [NSMutableArray array];
    [self enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [array addObject:obj];
    }];
    return [NSArray arrayWithArray:array];
}

/// @brief [ @[True,False] AND] == False
- (BOOL)api_AND {
    for (NSNumber *num in self) {
        if (num.boolValue == NO) {
            return NO;
        }
    }
    return YES;
}

/// @brief [ @[True,False] OR] == True
- (BOOL)api_OR {
    for (NSNumber *num in self) {
        if (num.boolValue) {
            return YES;
        }
    }
    return NO;
}

/// @brief [ [1,2,3] any:^(x){ x > 2 }] == YES
- (BOOL)api_any:(BOOL(^)(id a))pred {
    for (id a in self) {
        if (pred(a)) {
            return YES;
        }
    }
    return NO;
}

/// @brief [ [1,2,3] all:^(x){ x > 2 }] == NO
- (BOOL)api_all:(BOOL(^)(id a))pred {
    for (id a in self) {
        if (!pred(a)) {
            return NO;
        }
    }
    return YES;
}

/// @brief find (>1) [1,2,3] == 2
- (Optional *)api_find:(BOOL(^)(id a))pred {
    for (id obj in self) {
        if (pred(obj)) {
            return [Optional optionalWithValue:obj];
        }
    }
    return [Optional optionalWithNothing];
}

/// @brief [ [1,2,3] toOptional] == Just 1, [ [] toOptional] == Nothing
- (Optional *)api_toOptional {
    return [Optional optionalWithValueOrNil:self.firstObject];
}

- (NSNumber *)api_sumInteger {
    NSInteger acc = 0;
    for (NSNumber *num in self) {
        acc += num.integerValue;
    }
    return @(acc);
}

/// @brief api_minimumInteger [3,1,2] == 1
- (NSNumber *)api_minimumInteger {
    if (!self.count) {
        [[NSException exceptionWithName:@"" reason:@"trying to get minimumInteger from empty array" userInfo:@{}] raise];
        return nil;
    }
    NSInteger min = NSIntegerMax;
    for (NSNumber *num in self) {
        NSInteger i = num.integerValue;
        if (i < min) {
            min = i;
        }
    }
    return @(min);
}

/// @brief api_maximumInteger [1,3,2] == 3
- (NSNumber *)api_maximumInteger {
    if (!self.count) {
        [[NSException exceptionWithName:@"EmptyArrayException" reason:@"trying to get maximumInteger from empty array" userInfo:@{}] raise];
        return nil;
    }
    NSInteger max = NSIntegerMin;
    for (NSNumber *num in self) {
        NSInteger i = num.integerValue;
        if (i > max) {
            max = i;
        }
    }
    return @(max);
}

/// @brief zip [1,2,3] [a,b] == [[1,a],[2,b]]
- (NSArray *)api_zip:(NSArray *)other {
    return [self api_zipWith:^(id a, id b){ return @[a,b]; } array:other];
}

/// @brief isEmpty [] == YES
- (BOOL)api_isEmpty {
    return !self.count;
}

/// @brief head [1,2,3] == 1, head [] == Exception
- (id)api_head {
    return self[0];
}

/// @brief tail [1,2,3,4] == [2,3,4]
- (NSArray *)api_tail {
    return [self subarrayWithRange:NSMakeRange(1,self.count-1)];
}

/// @brief init [1,2,3,4] == [1,2,3]
- (NSArray *)api_init {
    return [self subarrayWithRange:NSMakeRange(0,self.count-1)];
}

/// @brief last [1,2,3] == 3, last [] == Exception
- (id)api_last {
    return self[self.count-1];
}

/// @brief like componentsJoinedByString:@"\n", but also puts \n at end if there is none
- (NSString *)api_unlines {
    return [[self api_map:^NSString *(NSString *str){ return [str stringByAppendingString:@"\n"]; }] componentsJoinedByString:@""];
}

@end

#endif
