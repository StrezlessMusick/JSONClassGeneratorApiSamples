//
//  ApiJsonCodeGenerator
//

#import "ApiAsJsonOfTypeProtocol.h"

#import "ApiError.h"
#import "ApiErrorDetail.h"
#import "Optional.h"
#import "NSDate+Api.h"
#import "NSArray+Api.h"


@implementation NSNull (ApiAsJsonOfTypeProtocol)

- (NSNumber *)api_asBoolApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNull -> Bool (fallback: NO) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @NO;
}

- (NSNumber *)api_asIntApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNull -> Int (fallback: 0) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @0;
}

- (NSNumber *)api_asFloatApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNull -> Float (fallback: 0.f) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @(0.f);
}

- (NSString *)api_asStringApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNull -> String (fallback: "") at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @"";
}

- (NSString *)api_asEnumApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNull -> Enum (fallback: enum value "" or first enum value) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @"";
}

- (NSString *)api_asDateIsoApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNull -> DateIso (fallback: <now>) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return [[NSDate date] api_iso8601String];
}

- (NSNumber *)api_asDateUnixApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNull -> DateUnix (fallback: <now>) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    // keeping the sub-second information
    return @([NSDate date].timeIntervalSince1970);
}

- (NSString *)api_asBase64ApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNull -> Base64 (fallback: "") at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @"";
}

- (NSArray *)api_asArrayApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNull -> Array (fallback: []) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @[];
}

- (Optional *)api_asOptionalApiError:(ApiError *)apiError context:(NSString *)context {
    return [Optional optionalWithNothing];
}

- (NSDictionary *)api_asStrMapApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNull -> StrMap (fallback: {}) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

- (NSDictionary *)api_asIntMapApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNull -> IntMap (fallback: {}) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

- (NSDictionary *)api_asDictApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNull -> Dict (fallback: {}) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

- (NSArray *)api_asTupleWithCnt:(NSInteger)cnt apiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNull -> Tuple (fallback: [] => Tuple of default values) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return [NSArray api_arrayByReplicating:[NSNull null] cnt:cnt];
}

- (NSDictionary *)api_asClassApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNull -> Class (fallback: {} => Class of default values) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

@end

@implementation NSNumber (ApiAsJsonOfTypeProtocol)

- (NSNumber *)api_asBoolApiError:(ApiError *)apiError context:(NSString *)context {
    switch (*self.objCType) {
        case 'c': {
            // ok
        } break;
        case 'q':
        case 'i': {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber<int> -> Bool (converting) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
        } break;
        case 'd': {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber<double> -> Bool (converting) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
        } break;
        case 'f': {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber<float> -> Bool (converting) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
        } break;
        default: {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber<Unknown '%c'- fix me> -> Bool at %@", __PRETTY_FUNCTION__, *self.objCType, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
        } break;
    }
    return self;
}

- (NSNumber *)api_asIntApiError:(ApiError *)apiError context:(NSString *)context {
    switch (*self.objCType) {
        case 'c': {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber<BOOL> -> Int (converting) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
        } break;
        case 'q':
        case 'i': {
            // ok
        } break;
        case 'd': {
            // there are two common causes, if you end up here
            // 1. the server delivers a double/float value, but you try to read it as integer
            //    solution: server needs to send always integers or you need to parse the value as double/float instead
            //    for currencies it might be better to send them as Int in Cents to avoid rounding errors
            // 2. the number received exeeds the maximum number that can represented by the Integer type that your JSON parser uses
            //    especially this happens on iOS if you use NSJSONSerialization on 32bit architecture, when you receive a 64bit Int - on iOS 64bit architecture this problem does not occur
            //    and this happens also on Mac OS X for 64bit architecture, where NSJSONSerialization returns 32bit integers - even though the hardware/system/applicaton natively support 64bit
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber<double> -> Int (converting) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
        } break;
        case 'f': {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber<float> -> Int (converting) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
        } break;
        default: {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber<Unknown '%c'- fix me> -> Int at %@", __PRETTY_FUNCTION__, *self.objCType, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
        } break;
    }
    return self;
}

- (NSNumber *)api_asFloatApiError:(ApiError *)apiError context:(NSString *)context {
    switch (*self.objCType) {
        case 'c': {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber<BOOL> -> Float (converting) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
        } break;
        case 'q':
        case 'i': {
            // ok, because no information is lost and a number in json is just a number
        } break;
        case 'd':
        case 'f': {
            // ok
        } break;
        default: {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber<Unknown '%c'- fix me> -> Float at %@", __PRETTY_FUNCTION__, *self.objCType, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
        } break;
    }
    return self;
}

- (NSString *)api_asStringApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber -> String (converting) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return self.stringValue;
}

- (NSString *)api_asEnumApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber -> Enum (fallback: "" => enum value "" or first enum value at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    // converting the number to string makes no sense, because number based enums should have been used
    // treating the number as the index of the enum is dangerous: if a new value on the server is added
    // and the representing numbers are not fixed, the resulting value of num->enumVal will differ.
    return @"";
}

- (NSString *)api_asDateIsoApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber -> DateIso (converting: assuming number represents unix timestamp) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return [[NSDate dateWithTimeIntervalSince1970:self.doubleValue] api_iso8601String];
}

- (NSNumber *)api_asDateUnixApiError:(ApiError *)apiError context:(NSString *)context {
    switch (*self.objCType) {
        case 'c': {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber<BOOL> -> DateUnix (fallback: <now>) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
            return @([NSDate date].timeIntervalSince1970);
        } break;
        case 'q':
        case 'i': {
            // ok
        } break;
        case 'd':
        case 'f': {
            // ok, allowing even more precise date
        } break;
        default: {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber<Unknown '%c'- fix me> -> DateUnix at %@", __PRETTY_FUNCTION__, *self.objCType, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
        } break;
    }
    return self;
}

- (NSString *)api_asBase64ApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber -> Base64 (fallback: "") at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @"";
}

- (NSArray *)api_asArrayApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber -> Array (fallback: 0) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @[];
}

- (Optional *)api_asOptionalApiError:(ApiError *)apiError context:(NSString *)context {
    return [Optional optionalWithValue:self];
}

- (NSDictionary *)api_asStrMapApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber -> StrMap (fallback: {}) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

- (NSDictionary *)api_asIntMapApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber -> IntMap (fallback: {}) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

- (NSDictionary *)api_asDictApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber -> Dict (fallback: {}) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

- (NSArray *)api_asTupleWithCnt:(NSInteger)cnt apiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber -> Tuple (fallback: [] => Tuple of default values) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return [NSArray api_arrayByReplicating:[NSNull null] cnt:cnt];
}

- (NSDictionary *)api_asClassApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSNumber -> Class (fallback: {} => Class of default values) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

@end

@implementation NSString (ApiAsJsonOfTypeProtocol)

- (NSNumber *)api_asBoolApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSString -> Bool (trying to convert: NO if it fails) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    NSString *lowerCase = self.lowercaseString;
    return @([lowerCase hasPrefix:@"y"] || [lowerCase hasPrefix:@"t"] || self.integerValue > 0);
}

- (NSNumber *)api_asIntApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSString -> Int (converting) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @(self.integerValue);
}

- (NSNumber *)api_asFloatApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSString -> Float (converting) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @(self.doubleValue);
}

- (NSString *)api_asStringApiError:(ApiError *)apiError context:(NSString *)context {
    return self;
}

- (NSString *)api_asEnumApiError:(ApiError *)apiError context:(NSString *)context {
    return self;
}

- (NSString *)api_asDateIsoApiError:(ApiError *)apiError context:(NSString *)context {
    // if the string can not be parsed, the unwrapper takes care of providing a <now> date
    return self;
}

- (NSNumber *)api_asDateUnixApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSString -> DateUnix (converting: assuming string represents a ISO8601 date, <now> if it fails) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    // keeping the sub-second information
    return @(([NSDate api_dateWithIso8601String:self] ?: [NSDate date]).timeIntervalSince1970);
}

- (NSString *)api_asBase64ApiError:(ApiError *)apiError context:(NSString *)context {
    return self;
}

- (NSArray *)api_asArrayApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSString -> Array (fallback: []) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @[];
}

- (Optional *)api_asOptionalApiError:(ApiError *)apiError context:(NSString *)context {
    return [Optional optionalWithValue:self];
}

- (NSDictionary *)api_asStrMapApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSString -> StrMap (fallback: {}) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

- (NSDictionary *)api_asIntMapApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSString -> IntMap (fallback: {}) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

- (NSDictionary *)api_asDictApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSString -> Dict (fallback: {}) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

- (NSArray *)api_asTupleWithCnt:(NSInteger)cnt apiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSString -> Tuple (fallback: [] => Tuple of default values) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return [NSArray api_arrayByReplicating:[NSNull null] cnt:cnt];
}

- (NSDictionary *)api_asClassApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSString -> Class (fallback: {} => Class of default values) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

@end

@implementation NSArray (ApiAsJsonOfTypeProtocol)

- (NSNumber *)api_asBoolApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSArray -> Bool (fallback: NO) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @NO;
}

- (NSNumber *)api_asIntApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSArray -> Int (fallback: 0) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @0;
}

- (NSNumber *)api_asFloatApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSArray -> Float (fallback: 0.f) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @(0.f);
}

- (NSString *)api_asStringApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSArray -> String (fallback: "") at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @"";
}

- (NSString *)api_asEnumApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSArray -> Enum (fallback: "" => enum value "" or first enum value) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @"";
}

- (NSString *)api_asDateIsoApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSArray -> DateIso (fallback: <now>) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return [[NSDate date] api_iso8601String];
}

- (NSNumber *)api_asDateUnixApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSArray -> DateUnix (fallback: <now>) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @([NSDate date].timeIntervalSince1970);
}

- (NSString *)api_asBase64ApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSArray -> Base64 (fallback: "") at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @"";
}

- (NSArray *)api_asArrayApiError:(ApiError *)apiError context:(NSString *)context {
    return self;
}

- (Optional *)api_asOptionalApiError:(ApiError *)apiError context:(NSString *)context {
    return [Optional optionalWithValue:self];
}

- (NSDictionary *)api_asStrMapApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSArray -> StrMap (fallback: {}) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

- (NSDictionary *)api_asIntMapApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSArray -> IntMap (fallback: {}) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

- (NSDictionary *)api_asDictApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSArray -> Dict (fallback: {}) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

- (NSArray *)api_asTupleWithCnt:(NSInteger)cnt apiError:(ApiError *)apiError context:(NSString *)context {
    if ((NSInteger)self.count == cnt) {
        return self;
    }
    
    if ((NSInteger)self.count < cnt) {
        [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: incoming Tuple at %@ has only %zd fields, but outgoing tuple requires %zd fields.", __PRETTY_FUNCTION__, context, self.count, cnt] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
        return [self arrayByAddingObjectsFromArray:[NSArray api_arrayByReplicating:[NSNull null] cnt:cnt-(NSInteger)self.count]];
    } else { // cnt < self.count
        [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: outgoing Tuple at %@ requires only %zd fields, but incoming Tuple %zd fields: %@.", __PRETTY_FUNCTION__, context, cnt, self.count, [self api_drop:cnt]] severity:ApiErrorSeverityInfo errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
        return [self api_take:cnt];
    }
}

- (NSDictionary *)api_asClassApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSArray -> Class (fallback: {} => Class of default values) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @{};
}

@end

@implementation NSDictionary (ApiAsJsonOfTypeProtocol)

- (NSNumber *)api_asBoolApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSDictionary -> Bool (fallback: NO) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @NO;
}

- (NSNumber *)api_asIntApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSDictionary -> Int (fallback: 0) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @0;
}

- (NSNumber *)api_asFloatApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSDictionary -> Float (fallback: 0.f) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @(0.f);
}

- (NSString *)api_asStringApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSDictionary -> String (fallback: "") at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @"";
}

- (NSString *)api_asEnumApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSDictionary -> Enum (fallback: "" => enum value "" or first enum value) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @"";
}

- (NSString *)api_asDateIsoApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSDictionary -> DateIso (fallback: <now>) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return [[NSDate date] api_iso8601String];
}

- (NSNumber *)api_asDateUnixApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSDictionary -> DateUnix (fallback: <now>) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @([NSDate date].timeIntervalSince1970);
}

- (NSString *)api_asBase64ApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSDictionary -> Base64 (fallback: "") at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @"";
}

- (NSArray *)api_asArrayApiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSDictionary -> Array (fallback: []) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return @[];
}

- (Optional *)api_asOptionalApiError:(ApiError *)apiError context:(NSString *)context {
    return [Optional optionalWithValue:self];
}

- (NSDictionary *)api_asStrMapApiError:(ApiError *)apiError context:(NSString *)context {
    return self;
}

- (NSDictionary *)api_asIntMapApiError:(ApiError *)apiError context:(NSString *)context {
    return self;
}

- (NSDictionary *)api_asDictApiError:(ApiError *)apiError context:(NSString *)context {
    return self;
}

- (NSArray *)api_asTupleWithCnt:(NSInteger)cnt apiError:(ApiError *)apiError context:(NSString *)context {
    [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: implicit cast NSDictionary -> Tuple (fallback: [] => Tuple of default values) at %@", __PRETTY_FUNCTION__, context] severity:ApiErrorSeverityError errorType:ApiErrorTypeAsProtocolObjectOfWrongType methodName:@(__PRETTY_FUNCTION__) className:[[self class] description] propertyName:context object:self]];
    return [NSArray api_arrayByReplicating:[NSNull null] cnt:cnt];
}

- (NSDictionary *)api_asClassApiError:(ApiError *)apiError context:(NSString *)context {
    return self;
}

@end
