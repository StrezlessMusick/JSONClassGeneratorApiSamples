//
//  ApiJsonCodeGenerator
//

#import "ApiError.h"
#import "NSArray+Api.h"
#import "ApiErrorDetail.h"

@interface ApiError ()

@property (nonatomic, readwrite) NSDictionary *context;
@property (nonatomic, readwrite) NSArray *details;

@end


@implementation ApiError

- (instancetype)initWithContext:(NSDictionary *)context details:(NSArray *)details {
    if ((self = [super init])) {
        _context = context ?: @{};
        _details = details ?: @[];
    }
    return self;
}

- (instancetype)init {
    return [self initWithContext:@{} details:[NSMutableArray array]];
}

+ (instancetype)apiErrorWithContext:(NSDictionary *)context details:(NSArray *)details {
    return [[[self class] alloc] initWithContext:context details:[details mutableCopy]];
}

+ (instancetype)apiErrorWithContext:(NSDictionary *)context {
    return [[[self class] alloc] initWithContext:context details:[NSMutableArray array]];
}

- (void)addApiErrorDetail:(ApiErrorDetail *)apiErrorDetail {
    self.details = [self.details containsObject:apiErrorDetail] ? [self.details api_map:^id(ApiErrorDetail* errorDetail) { return [errorDetail merge:apiErrorDetail]; }]
                                                                : [self.details arrayByAddingObject:apiErrorDetail];
}

- (void)addApiErrorDetails:(NSArray *)apiErrorDetails {
    for (ApiErrorDetail *apiErrorDetail in apiErrorDetails) {
        [self addApiErrorDetail:apiErrorDetail];
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ { context = %@, details = %@ }", super.description, self.context, self.details];
}

- (NSError *)toNSErrorOrNil {
    return !self.details.count ? nil : [NSError errorWithDomain:@"ApiJsonCodeGenerator"
                                                           code:0
                                                       userInfo:@{ @"context" : self.context,
                                                                   @"details" : self.details }];
}

@end
