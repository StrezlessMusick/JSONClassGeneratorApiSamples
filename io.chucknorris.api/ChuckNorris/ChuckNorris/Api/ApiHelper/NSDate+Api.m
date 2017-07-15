//
//  ApiJsonCodeGenerator
//

#import "NSDate+Api.h"

#import "ApiISO8601DateFormatter.h"
#import "ApiError.h"
#import "ApiErrorDetail.h"
#import "NSObjects+ApiDescription.h"

@implementation NSDate (Api)

+ (ApiISO8601DateFormatter *)api_dateFormatter {
    static dispatch_once_t onceToken;
    static ApiISO8601DateFormatter *dateFormatter;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[ApiISO8601DateFormatter alloc] init];
        dateFormatter.includeTime = YES;
    });
    return dateFormatter;
}

/// @brief creates a date using an ISO8601 String
+ (NSDate *)api_dateWithIso8601String:(NSString *)str {
    return [[self api_dateFormatter] dateFromString:str];
}

/// @brief returns a date using an ISO8601 String, or [NSDate date] if the string can not be parsed
+ (NSDate *)api_dateWithIso8601String:(NSString *)str apiError:(ApiError *)apiError context:(NSString *)context {
    NSDate *result = [self api_dateWithIso8601String:str];
    if (result) {
        return result;
    }
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"api_dateWithIso8601String: string %@ is not a valid Iso8601 string (fallback: <now>)", [str api_description]] severity:ApiErrorSeverityError errorType:ApiErrorTypeInvalidIso8601String methodName:@(__PRETTY_FUNCTION__) object:[NSNull null]]];
    return [NSDate date];
}

/// @brief converts a date into an ISO8601 String
- (NSString *)api_iso8601String {
    NSString *value = [[[self class] api_dateFormatter] stringFromDate:self timeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    if([value hasSuffix:@"Z"]) {
        value = [value stringByReplacingCharactersInRange:NSMakeRange(value.length - 1, 1) withString:@"+00:00"];
    }
    return value;
}

@end
