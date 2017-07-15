//
//  ApiJsonCodeGenerator
//

#import <Foundation/Foundation.h>

@class ApiError;

@interface NSData (Api)

/// @brief returns a data using a Base64 encoded String, or nil if the string can not be parsed
+ (NSData *)api_dataWithBase64String:(NSString *)string;

/// @brief returns a data using a Base64 encoded String, InvalidCharacters are removed, so that the parse always succeeds
+ (NSData *)api_dataWithBase64String:(NSString *)string apiError:(ApiError *)apiError context:(NSString *)context;

/// @brief converts a data into a Base64 encoded String
- (NSString *)api_base64String;

/// @brief converts a data into a utf8 encoded string or nil, if the data is not in a valid encoding
- (NSString *)api_utf8String;

@end
