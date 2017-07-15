//
//  ApiJsonCodeGenerator
//

#import <Foundation/Foundation.h>

@interface NSString (Api)

/// @brief string by removing all chars that are not element of allowedChars
- (NSString *)api_charsElementOf:(NSString *)allowedChars;

/// @brief take 3 "hallo" == "hal"
- (NSString *)api_take:(NSInteger)numberOfChars;

/// @brief api_stringByReplicating @"Roger!" 2 == @"Roger!Roger!"
+ (NSString *)api_stringByReplicating:(NSString *)str count:(NSInteger)cnt;

@end


#ifndef API_DISABLE_UNNECESSARY_CATEGORIES

@interface NSString (ApiMore)

/// @brief reverse "abc" == "cba"
- (NSString *)api_reverse;

/// @brief drop 1 "hallo" == "allo"
- (NSString *)api_drop:(NSInteger)numberOfChars;

/// @brief dropWhile (!='5') "123456789" == "56789"
- (NSString *)api_dropWhile:(BOOL(^)(unichar c))pred;

/// @brief takeWhile (!='5') "123456789" == "1234"
- (NSString *)api_takeWhile:(BOOL(^)(unichar c))pred;

/// @brief partition (<3) $ "1234554321" == ("1221","345543") (filter p,filter (!p))
- (NSArray *)api_partition:(BOOL(^)(unichar c))pred;

/// @brief span (<3) $ "1234554321" == ("12","34554321") (takeWhile,dropWhile)
- (NSArray *)api_span:(BOOL(^)(unichar c))pred;

/// @brief like componentsSeparatedByString:@"\n", but does not create an empty component at end
- (NSArray *)api_lines;

@end

#endif
