//
//  ApiJsonCodeGenerator
//

#import <Foundation/Foundation.h>

@class ApiError;

@interface NSDate (Api)

/// @brief returns a date using an ISO8601 String, or nil if the string can not be parsed
+ (NSDate *)api_dateWithIso8601String:(NSString *)string;

/// @brief returns a date using an ISO8601 String, or [NSDate date] if the string can not be parsed
+ (NSDate *)api_dateWithIso8601String:(NSString *)string apiError:(ApiError *)apiError context:(NSString *)context;

/// @brief converts a date into an ISO8601 String
- (NSString *)api_iso8601String;

@end
