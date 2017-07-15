//
//  ApiJsonCodeGenerator
//

#import <Foundation/Foundation.h>

@class Optional;
@class ApiError;

@protocol ApiAsJsonOfTypeProtocol <NSObject>

- (NSNumber *)api_asBoolApiError:(ApiError *)apiError context:(NSString *)context;
- (NSNumber *)api_asIntApiError:(ApiError *)apiError context:(NSString *)context;
- (NSNumber *)api_asFloatApiError:(ApiError *)apiError context:(NSString *)context;
- (NSString *)api_asStringApiError:(ApiError *)apiError context:(NSString *)context;
- (NSString *)api_asEnumApiError:(ApiError *)apiError context:(NSString *)context; // same as "api_asStringApiError:"
- (NSString *)api_asDateIsoApiError:(ApiError *)apiError context:(NSString *)context;
- (NSNumber *)api_asDateUnixApiError:(ApiError *)apiError context:(NSString *)context;
- (NSString *)api_asBase64ApiError:(ApiError *)apiError context:(NSString *)context;
- (NSArray *)api_asArrayApiError:(ApiError *)apiError context:(NSString *)context;
// todo: optional should not do anything. use [Optional optionalWithValueOrNil instead in wrapping]
- (Optional *)api_asOptionalApiError:(ApiError *)apiError context:(NSString *)context;
- (NSDictionary *)api_asStrMapApiError:(ApiError *)apiError context:(NSString *)context;
- (NSDictionary *)api_asIntMapApiError:(ApiError *)apiError context:(NSString *)context;
- (NSDictionary *)api_asDictApiError:(ApiError *)apiError context:(NSString *)context;
- (NSArray *)api_asTupleWithCnt:(NSInteger)cnt apiError:(ApiError *)apiError context:(NSString *)context;
//- (id)api_asJsonApiError:(ApiError *)apiError context:(NSString *)context; not needed, because it will always return self
- (NSDictionary *)api_asClassApiError:(ApiError *)apiError context:(NSString *)context;

@end

@interface NSNull (ApiAsJsonOfTypeProtocol) <ApiAsJsonOfTypeProtocol>
@end

@interface NSNumber (ApiAsJsonOfTypeProtocol) <ApiAsJsonOfTypeProtocol>
@end

@interface NSString (ApiAsJsonOfTypeProtocol) <ApiAsJsonOfTypeProtocol>
@end

@interface NSArray (ApiAsJsonOfTypeProtocol) <ApiAsJsonOfTypeProtocol>
@end

@interface NSDictionary (ApiAsJsonOfTypeProtocol) <ApiAsJsonOfTypeProtocol>
@end
