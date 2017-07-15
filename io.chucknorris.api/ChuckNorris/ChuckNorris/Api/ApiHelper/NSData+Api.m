//
//  ApiJsonCodeGenerator
//

#import "NSData+Api.h"

#import "NSString+Api.h"
#import "NSObjects+ApiDescription.h"
#import "ApiError.h"
#import "ApiErrorDetail.h"

@implementation NSData (Api)

/// @brief returns a data using a Base64 encoded String, or nil if the string can not be parsed
+ (NSData *)api_dataWithBase64String:(NSString *)str {
    return [[NSData alloc] initWithBase64EncodedString:str options:0];
}

/// @brief returns a data using a Base64 encoded String, InvalidCharacters are removed, so that the parse always succeeds
+ (NSData *)api_dataWithBase64String:(NSString *)str apiError:(ApiError *)apiError context:(NSString *)context {
    NSData *result = [self api_dataWithBase64String:str];
    if (result) {
        return result;
    }
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"api_dataWithBase64String: string (take 10) %@ is not a valid Base64 encoded string (fallback: strip invalid character)", [[str api_take:10] api_description]] severity:ApiErrorSeverityError errorType:ApiErrorTypeInvalidBase64String methodName:@(__PRETTY_FUNCTION__) object:[NSNull null]]];
    return [[NSData alloc] initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
}

/// @brief converts a data into a Base64 encoded String
- (NSString *)api_base64String {
    return [self base64EncodedStringWithOptions:0];
}

/// @brief converts a data into a utf8 encoded string or nil, if the data is not in a valid encoding
- (NSString *)api_utf8String {
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

@end
