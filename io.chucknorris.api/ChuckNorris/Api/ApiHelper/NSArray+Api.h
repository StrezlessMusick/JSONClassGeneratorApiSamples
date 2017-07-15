//
//  ApiJsonCodeGenerator
//

#import <Foundation/Foundation.h>

#ifndef API_DISABLE_UNNECESSARY_CATEGORIES
@class Optional;
#endif

@interface NSArray (Api)

/// @brief api_map (*2) [1,2,3] == [2,4,6]
- (NSArray *)api_map:(id(^)(id a))fun;

/// @brief api_filter (>3) [1,2,3,4,5,4,3,2,1] == [4,5,4]
- (NSArray *)api_filter:(BOOL(^)(id a))pred;

/// @brief api_zipWith (*) [1,2,3] [3,4,5] == [3,8,15]
- (NSArray *)api_zipWith:(id(^)(id a, id b))fun array:(NSArray *)array;

/// @brief api_arrayByReplicating @"echo" 3 == @[@"echo", @"echo", @"echo"]
+ (NSArray *)api_arrayByReplicating:(id)object cnt:(NSInteger)times;

/// @brief drop 3 [1,2,4,8,16] == [8,16]
- (NSArray *)api_drop:(NSInteger)cnt;

@end


#ifndef API_DISABLE_UNNECESSARY_CATEGORIES

@interface NSArray (ApiMore)

/// @brief catOptionals = filter (\optional -> optional.hasValue)
- (NSArray *)api_catOptionals;

/// @brief removes all objects, that equal by -isEqual:
- (NSArray *)api_arrayByRemovingObject:(id)anObject;

/// @brief [[a,b],[],[c]] -> [a,b,c]
- (NSArray *)api_concat;

/// @brief [a mapAndConcat:f] == [[a map:f] concat]
- (NSArray *)api_mapAndConcat:(NSArray *(^)(id a))fun;

/// @brief take 3 [1,2,4,8,16] == [1,2,4]
- (NSArray *)api_take:(NSInteger)cnt;

/// @brief takeWhile (<3) [1,2,3,4,5] == [1,2]
- (NSArray *)api_takeWhile:(BOOL(^)(id a))pred;

/// @brief dropWhile (<3) [1,2,3,4,5] == [3,4,5]
- (NSArray *)api_dropWhile:(BOOL(^)(id a))pred;

/// @brief partition (<3) $ [1,2,3,4,5,5,4,3,2,1] == ([1,2,2,1],[3,4,5,5,4,3]) (filter p,filter (!p))
- (NSArray *)api_partition:(BOOL(^)(id a))pred;

/// @brief span (<3) $ [1,2,3,4,5,5,4,3,2,1] == ([1,2],[3,4,5,5,4,3,2,1]) (takeWhile,dropWhile)
- (NSArray *)api_span:(BOOL(^)(id a))pred;

/// @brief group [1,2,2,3,2] == [[1],[2,2],[3],[2]]
- (NSArray *)api_group;

/// @brief groupBy ((==) `on`length) ["a","bc","de","fgh","ij"] == [["a"],["bc","de"],["fgh"],["ij"]], "isEqual" must be transitive
- (NSArray *)api_groupBy:(BOOL(^)(id a, id b))isEqual;

/// @brief groupSectionsBy ((==)`on`length) ["a","bc","de","fgh","ij"] == [[1,["a"]],[2,["bc","de"]],[3,["fgh"]],[2,["ij"]]], "isEqual" must be transitive
- (NSArray *)api_groupSectionsByIsEqualOn:(NSObject *(^)(id a))getter;

/// @brief (kept for compatibility) groupByComparing length ["asdf","123","qwer"] == @{ 4 : ["asdf","qwer"], 3 : ["123"] }
- (NSDictionary *)api_groupByComparing:(id<NSCopying> (^)(id a))getter;

- (NSData *)api_toJson;

/// @brief [ [1,2,3] reverse] == [3,2,1]
- (NSArray *)api_reverse;

/// @brief [ @[True,False] AND] == False
- (BOOL)api_AND;

/// @brief [ @[True,False] OR] == True
- (BOOL)api_OR;

/// @brief [ [1,2,3] any:^(x){ x > 2 }] == YES
- (BOOL)api_any:(BOOL(^)(id a))pred;

/// @brief [ [1,2,3] all:^(x){ x > 2 }] == NO
- (BOOL)api_all:(BOOL(^)(id a))pred;

/// @brief find (>1) [1,2,3] == 2
- (Optional *)api_find:(BOOL(^)(id a))pred;

/// @brief [ [1,2,3] toOptional] == Just 1, [ [] toOptional] == Nothing
- (Optional *)api_toOptional;

/// @brief sum [1,2,3] == 6
- (NSNumber *)api_sumInteger;

/// @brief api_minimumInteger [3,1,2] == 1
- (NSNumber *)api_minimumInteger;

/// @brief api_maximumInteger [1,3,2] == 3
- (NSNumber *)api_maximumInteger;

/// @brief zip [1,2,3] [a,b] == [[1,a],[2,b]]
- (NSArray *)api_zip:(NSArray *)other;

/// @brief isEmpty [] == YES
- (BOOL)api_isEmpty;

/// @brief head [1,2,3] == 1, head [] == Exception
- (id)api_head;

/// @brief tail [1,2,3,4] == [2,3,4], tail [] == Exception
- (NSArray *)api_tail;

/// @brief init [1,2,3,4] == [1,2,3]
- (NSArray *)api_init;

/// @brief last [1,2,3] == 3, last [] == Exception
- (id)api_last;

/// @brief like componentsJoinedByString:@"\n", but also puts \n at end if there is none
- (NSString *)api_unlines;

@end

#endif
