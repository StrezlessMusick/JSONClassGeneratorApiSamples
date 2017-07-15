//
//  ApiJsonCodeGenerator
//

#import <Foundation/Foundation.h>

@class ApiErrorDetail;

@interface ApiError : NSObject

/// @brief { String : String } giving arbitrary but useful information about the context where the error happened
@property (nonatomic, readonly) NSDictionary *context;

/// @brief [ApiError] specific errors that happened
@property (nonatomic, readonly) NSArray *details;

- (void)addApiErrorDetail:(ApiErrorDetail *)apiErrorDetail;
- (void)addApiErrorDetails:(NSArray *)apiErrorDetails;

+ (instancetype)apiErrorWithContext:(NSDictionary *)context details:(NSArray *)details;
+ (instancetype)apiErrorWithContext:(NSDictionary *)context;

- (NSError *)toNSErrorOrNil;

@end
