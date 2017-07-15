//
//  ApiJsonCodeGenerator
//

#import "NSString+Api.h"

@implementation NSString (Api)

/// @brief string by removing all chars that are not element of allowedChars
- (NSString *)api_charsElementOf:(NSString *)allowedChars {
    NSCharacterSet *forbiddenCharsSet = [NSCharacterSet characterSetWithCharactersInString:allowedChars].invertedSet;
    return [[self componentsSeparatedByCharactersInSet:forbiddenCharsSet] componentsJoinedByString:@""];
}

/// @brief take 3 "hallo" == "hal"
- (NSString *)api_take:(NSInteger)numberOfChars {
    if (numberOfChars <= 0) {
        return @"";
    }
    return [self substringToIndex:MIN((NSUInteger)numberOfChars,self.length)];
}

/// @brief api_stringByReplicating @"Roger!" 2 == @"Roger!Roger!"
+ (NSString *)api_stringByReplicating:(NSString *)str count:(NSInteger)cnt {
    NSMutableString *result = [NSMutableString string];
    for (NSInteger i=0; i<cnt; ++i) {
        [result appendString:str];
    }
    return [NSString stringWithString:result];
}

@end


#ifndef API_DISABLE_UNNECESSARY_CATEGORIES

@implementation NSString (ApiMore)

/// @brief reverse "abc" == "cba"
- (NSString *)api_reverse {
    NSMutableString *str = [NSMutableString string];
    for (NSInteger i = (NSInteger)self.length - 1; i >= 0 ; --i) {
        unichar c = [self characterAtIndex:(NSUInteger)i];
        [str appendFormat:@"%c",c];
    }
    return [str copy];
}

/// @brief drop 1 "hallo" == "allo"
- (NSString *)api_drop:(NSInteger)numberOfChars {
    if (numberOfChars <= 0) {
        return self;
    } else if (numberOfChars >= (NSInteger)self.length) {
        return @"";
    } else {
        return [self substringFromIndex:(NSUInteger)numberOfChars];
    }
}

/// @brief dropWhile (!='5') "123456789" == "56789"
- (NSString *)api_dropWhile:(BOOL(^)(unichar c))pred {
    NSMutableString *result = [self mutableCopy];
    while (result.length != 0u && pred([result characterAtIndex:0])) {
        [result replaceCharactersInRange:NSMakeRange(0, 1) withString:@""];
    }
    return [result copy];
}


/// @brief takeWhile (!='5') "123456789" == "1234"
- (NSString *)api_takeWhile:(BOOL(^)(unichar c))pred {
    NSMutableString *acc = [NSMutableString string];
    NSUInteger len = self.length;
    for (NSUInteger i=0; i<len; ++i) {
        unichar c = [self characterAtIndex:i];
        if (pred(c)) {
            [acc appendFormat:@"%c", c];
        } else {
            break;
        }
    }
    return [acc copy];
}

/// @brief partition (<3) $ "1234554321" == ("1221","345543") (filter p,filter (!p))
- (NSArray *)api_partition:(BOOL(^)(unichar c))pred {
    NSMutableString *trues  = [NSMutableString string];
    NSMutableString *falses = [NSMutableString string];
    NSUInteger len = self.length;
    for (NSUInteger i=0; i<len; ++i) {
        unichar c = [self characterAtIndex:i];
        [(pred(c) ? trues : falses) appendFormat:@"%c",c];
    }
    return @[ [trues copy], [falses copy] ];
}

/// @brief span (<3) $ "1234554321" == ("12","34554321") (takeWhile,dropWhile)
- (NSArray *)api_span:(BOOL(^)(unichar c))pred {
    NSMutableString *firsts = [NSMutableString string];
    NSUInteger len = self.length;
    NSUInteger i;
    for (i=0; i<len; ++i) {
        unichar c = [self characterAtIndex:i];
        if (pred(c)) {
            [firsts appendFormat:@"%c", c];
        } else {
            break;
        }
    }
    NSString *lasts = [self substringFromIndex:i];
    return @[ [firsts copy], lasts ];
}

/// @brief like componentsSeparatedByString:@"\n", but does not create an empty component at end
- (NSArray *)api_lines {
    if (!self.length) {
        return @[];
    } else if ([self characterAtIndex:self.length-1] == '\n') {
        return [[self substringToIndex:self.length-1] componentsSeparatedByString:@"\n"];
    } else {
        return [self componentsSeparatedByString:@"\n"];
    }
}

@end

#endif
