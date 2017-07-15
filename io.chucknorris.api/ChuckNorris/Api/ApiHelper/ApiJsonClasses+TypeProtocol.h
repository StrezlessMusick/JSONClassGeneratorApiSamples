//
//  ApiJsonCodeGenerator
//

#import <Foundation/Foundation.h>

@protocol ApiTypeProtocol <NSObject>

- (NSString *)api_jsonType;

@end

@interface NSNull (ApiTypeProtocol)
@end

@interface NSNumber (ApiTypeProtocol)
@end

@interface NSString (ApiTypeProtocol)
@end

@interface NSArray (ApiTypeProtocol)
@end

@interface NSDictionary (ApiTypeProtocol)
@end
