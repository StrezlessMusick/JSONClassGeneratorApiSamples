//
//  ApiJsonCodeGenerator
//

#pragma once

@protocol ApiServiceResponseProtocol;

@protocol ApiServiceRequestProtocol <NSObject>

- (id<ApiServiceResponseProtocol>)sendRequest:(NSString *)messageName
                                       consts:(NSDictionary *)consts
                                       params:(NSDictionary *)params
                                      success:(void (^)(id jsonObject))success
                                      failure:(void (^)(id jsonObject))failure;

@end


@protocol ApiServiceResponseProtocol <NSObject>

- (void)cancel;

@optional
- (void)setUploadProgressBlock:(void (^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))block;
- (void)setDownloadProgressBlock:(void (^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))block;

@end


@protocol ApiServiceKeyedSubscriptProtocol <NSObject>

- (id)objectForKeyedSubscript:(NSString *)subscript;

@end
