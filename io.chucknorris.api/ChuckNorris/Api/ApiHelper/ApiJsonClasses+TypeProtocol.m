//
//  ApiJsonCodeGenerator
//

#import "ApiJsonClasses+TypeProtocol.h"

#import "NSString+Api.h"
#import "NSObjects+ApiDescription.h"

@implementation NSNull (ApiTypeProtocol)

- (NSString *)api_jsonType {
    return @"{ \"type\": \"Optional\", \"subtype\": \"<unknown>\" }";
}

@end


@implementation NSNumber (ApiTypeProtocol)

- (NSString *)api_jsonType {
    switch (*self.objCType) {
        case 'c': {
            return [@"Bool" api_description];
        } break;
        case 'q':
        case 'i': {
            return [@"Int or DateUnix" api_description];
        } break;
        case 'd': {
            return [@"Float or DateUnix" api_description];
        } break;
        default: {
            return [@"Int or Bool or Float or DateUnix" api_description];
        } break;
    }
}

@end


@implementation NSString (ApiTypeProtocol)

- (NSString *)api_jsonType {
    return [@"String or DateIso or Enum" api_description];
}
    
//    if ([NSDate api_dateWithIso8601String:valAsStr]) {
//        typeName = @"Date";
//    } else {
//        BOOL hasValidCharsForEnum = [[valAsStr api_charsElementOf:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_"] isEqual:valAsStr];
//        BOOL isNull = valAsStr.length == 0;
//        if (hasValidCharsForEnum && (isNull || !('0' < [valAsStr characterAtIndex:0] && [valAsStr characterAtIndex:0] < '9') ) ) {
//            typeName = @"String or Enum";
//        } else {
//            typeName = @"String";
//        }
//    }


@end


@implementation NSArray (ApiTypeProtocol)

- (NSString *)api_jsonType {
    return [NSString stringWithFormat:@"{ \"type\": \"Array\", \"subtype\": \"%@\"}",self.count ? [self.firstObject api_jsonType] : @"<unknown>"];
}

@end


@implementation NSDictionary (ApiTypeProtocol)

- (NSString *)api_jsonType {
    return @"{ \"type\": \"Class\", \"subtype\": \"<unknown>\"}";
}

@end
