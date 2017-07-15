//
//  ApiJsonCodeGenerator
//

#import <Foundation/Foundation.h>

#import "Optional.h"
#import "ApiModel.h"


#pragma mark Constants Standard Classes

static NSString *const kApiTypeNSObject     = @"NSObject";
static NSString *const kApiTypeNSString     = @"NSString";
static NSString *const kApiTypeNSData       = @"NSData";
static NSString *const kApiTypeNSDate       = @"NSDate";
static NSString *const kApiTypeNSArray      = @"NSArray";
static NSString *const kApiTypeNSDictionary = @"NSDictionary";

static NSString *const kApiTypeOptional = @"Optional";


#pragma mark Constants Custom Classes

/// @brief used for numbers and enums
static NSString *const kApiTypeNSNumber = @"NSNumber";

static NSString *const kApiTypeJoke = @"Joke";


#pragma mark Protocol

@protocol ApiAsObjectOfTypeProtocol <NSObject>

/// @brief return nil, if the object is not of the desired type. Otherwise returns self
- (id)api_asObjectOfType:(NSString *)typeConstant;

@end


#pragma mark Protocol Adoptions Standard Classes

@interface NSObject     (ApiAsObjectOfTypeProtocol) <ApiAsObjectOfTypeProtocol>
@end

@interface NSString     (ApiAsObjectOfTypeProtocol) <ApiAsObjectOfTypeProtocol>
@end

@interface NSData       (ApiAsObjectOfTypeProtocol) <ApiAsObjectOfTypeProtocol>
@end

@interface NSDate       (ApiAsObjectOfTypeProtocol) <ApiAsObjectOfTypeProtocol>
@end

@interface NSArray      (ApiAsObjectOfTypeProtocol) <ApiAsObjectOfTypeProtocol>
@end

@interface NSDictionary (ApiAsObjectOfTypeProtocol) <ApiAsObjectOfTypeProtocol>
@end

@interface Optional     (ApiAsObjectOfTypeProtocol) <ApiAsObjectOfTypeProtocol>
@end


#pragma mark Protocol Adoptions Custom Classes

@interface NSNumber (ApiAsObjectOfTypeProtocol) <ApiAsObjectOfTypeProtocol>
@end

@interface Joke     (ApiAsObjectOfTypeProtocol) <ApiAsObjectOfTypeProtocol>
@end

