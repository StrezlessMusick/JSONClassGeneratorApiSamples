//
//  ApiJsonCodeGenerator
//

#import <Foundation/Foundation.h>


@interface NSObject (ApiDescription)

/// @brief faster and prettier version of -description
- (NSString *)api_description;

/// @brief objc literal version of -api_description
- (NSString *)api_descriptionLiteral;

@end

@interface NSArray (ApiDescription)

/// @brief faster and prettier version of -description
- (NSString *)api_description;

/// @brief objc literal version of -api_description
- (NSString *)api_descriptionLiteral;

@end

@interface NSDictionary (ApiDescription)

/// @brief faster and prettier version of -description
- (NSString *)api_description;

/// @brief objc literal version of -api_description
- (NSString *)api_descriptionLiteral;

@end

@interface NSString (ApiDescription)

/// @brief returns a properly quoted and escaped string
- (NSString *)api_description;

/// @brief objc literal version of -api_description
- (NSString *)api_descriptionLiteral;

@end

@interface NSNumber (ApiDescription)

/// @brief same as -stringValue
- (NSString *)api_description;

/// @brief objc literal version of -api_description
- (NSString *)api_descriptionLiteral;

@end

@interface NSData (ApiDescription)

/// @brief "<base64 of length n>"
- (NSString *)api_description;

/// @brief @"aGVsbG8=" <- directly use
- (NSString *)api_descriptionLiteral;

@end
