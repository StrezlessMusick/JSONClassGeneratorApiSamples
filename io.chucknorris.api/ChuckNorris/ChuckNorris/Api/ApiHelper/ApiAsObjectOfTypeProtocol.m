//
//  ApiJsonCodeGenerator
//

#import "ApiAsObjectOfTypeProtocol.h"


#pragma mark Protocol Implementations Standard Classes

@implementation NSObject (ApiAsObjectOfTypeProtocol)

- (id)api_asObjectOfType:(NSString *)typeConstant {
    if (typeConstant == kApiTypeNSObject) {
        return self;
    }
    return nil;
}

@end

@implementation NSString (ApiAsObjectOfTypeProtocol)

- (id)api_asObjectOfType:(NSString *)typeConstant {
    if (typeConstant == kApiTypeNSString) {
        return self;
    }
    return nil;
}

@end

@implementation NSData (ApiAsObjectOfTypeProtocol)

- (id)api_asObjectOfType:(NSString *)typeConstant {
    if (typeConstant == kApiTypeNSData) {
        return self;
    }
    return nil;
}

@end

@implementation NSDate (ApiAsObjectOfTypeProtocol)

- (id)api_asObjectOfType:(NSString *)typeConstant {
    if (typeConstant == kApiTypeNSDate) {
        return self;
    }
    return nil;
}

@end

@implementation NSArray (ApiAsObjectOfTypeProtocol)

- (id)api_asObjectOfType:(NSString *)typeConstant {
    if (typeConstant == kApiTypeNSArray) {
        return self;
    }
    return nil;
}

@end

@implementation NSDictionary (ApiAsObjectOfTypeProtocol)

- (id)api_asObjectOfType:(NSString *)typeConstant {
    if (typeConstant == kApiTypeNSDictionary) {
        return self;
    }
    return nil;
}

@end

@implementation Optional (ApiAsObjectOfTypeProtocol)

- (id)api_asObjectOfType:(NSString *)typeConstant {
    if (typeConstant == kApiTypeOptional) {
        return self;
    }
    return nil;
}

@end


#pragma mark Protocol Implementation Custom Classes

@implementation NSNumber (ApiAsObjectOfTypeProtocol)

- (id)api_asObjectOfType:(NSString *)typeConstant {
    if (typeConstant == kApiTypeNSNumber) {
        return self;
    }
    return nil;
}

@end

@implementation Joke (ApiAsObjectOfTypeProtocol)

- (id)api_asObjectOfType:(NSString *)typeConstant {
    if (typeConstant == kApiTypeJoke) {
        return self;
    }
    return nil;
}

@end

