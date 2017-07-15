//
//  ApiJsonCodeGenerator
//

#import "ApiErrorDetail.h"

#import "NSArray+Api.h"
#import "NSString+Api.h"

@interface ApiErrorDetail ()

// mandatory
@property (nonatomic, readwrite) NSString *message;
@property (nonatomic, readwrite) ApiErrorSeverity severity;
@property (nonatomic, readwrite) ApiErrorType errorType;
@property (nonatomic, readwrite) NSString *methodName;
@property (nonatomic, readwrite) NSArray  *objects;

// optional
@property (nonatomic, readwrite) NSString *className;
@property (nonatomic, readwrite) NSString *propertyName;

@end


@implementation ApiErrorDetail

- (NSUInteger)numberOfOccurences {
    return self.objects.count;
}

- (instancetype)initWithMessage:(NSString *)message
                       severity:(ApiErrorSeverity)severity
                      errorType:(ApiErrorType)errorType
                     methodName:(NSString *)methodName
                      className:(NSString *)className
                   propertyName:(NSString *)propertyName
                        objects:(NSArray *)objects
{
    if ((self = [super init])) {
        _message = message;
        _severity = severity;
        _errorType = errorType;
        _methodName = methodName;
        _className = className;
        _propertyName = propertyName;
        _objects = objects;
    }
    return self;
}

+ (instancetype)apiErrorWithMessage:(NSString *)message
                           severity:(ApiErrorSeverity)severity
                          errorType:(ApiErrorType)errorType
                         methodName:(NSString *)methodName
                          className:(NSString *)className
                       propertyName:(NSString *)propertyName
                             object:(id)object
{
    return [[[self class] alloc] initWithMessage:message
                                        severity:severity
                                       errorType:errorType
                                      methodName:methodName
                                       className:className
                                    propertyName:propertyName
                                         objects:@[object]];
}

+ (instancetype)apiErrorWithMessage:(NSString *)message
                           severity:(ApiErrorSeverity)severity
                          errorType:(ApiErrorType)errorType
                         methodName:(NSString *)methodName
                          className:(NSString *)className
                       propertyName:(NSString *)propertyName
                            objects:(NSArray *)objects
{
    return [[[self class] alloc] initWithMessage:message
                                        severity:severity
                                       errorType:errorType
                                      methodName:methodName
                                       className:className
                                    propertyName:propertyName
                                         objects:objects];
}

+ (instancetype)apiErrorWithMessage:(NSString *)message
                           severity:(ApiErrorSeverity)severity
                          errorType:(ApiErrorType)errorType
                         methodName:(NSString *)methodName
                             object:(id)object
{
    return [[[self class] alloc] initWithMessage:message
                                        severity:severity
                                       errorType:errorType
                                      methodName:methodName
                                       className:nil
                                    propertyName:nil
                                         objects:@[object]];
}

- (instancetype)merge:(ApiErrorDetail *)apiError
{
    if ([apiError isEqual:self]) {
        return [ApiErrorDetail apiErrorWithMessage:self.message
                                          severity:self.severity
                                         errorType:self.errorType
                                        methodName:self.methodName
                                         className:self.className
                                      propertyName:self.propertyName
                                           objects:[self.objects arrayByAddingObjectsFromArray:apiError.objects]];
    } else {
        return self;
    }
}

- (NSString *)description
{
    if (self.errorType == ApiErrorTypeAsProtocolObjectOfWrongType) {
        return [NSString stringWithFormat:@"%@ { message = %@, numberOfOccurences = %zd, firstObject = %@ }", super.description, self.message, self.numberOfOccurences, [self.objects.firstObject description]];
    } else {
        return [NSString stringWithFormat:@"%@ { message = %@, numberOfOccurences = %zd }", super.description, self.message, self.numberOfOccurences];
    }
}

- (BOOL)isEqual:(id)other
{
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;
    
    return [self isEqualToDetail:other];
}

- (BOOL)isEqualToDetail:(ApiErrorDetail *)detail
{
    if (self == detail)
        return YES;
    if (detail == nil)
        return NO;
    if (self.message != detail.message && ![self.message isEqualToString:detail.message])
        return NO;
    if (self.severity != detail.severity)
        return NO;
    if (self.errorType != detail.errorType)
        return NO;
    if (self.methodName != detail.methodName && ![self.methodName isEqualToString:detail.methodName])
        return NO;
    if (self.className != detail.className && ![self.className isEqualToString:detail.className])
        return NO;
    if (self.propertyName != detail.propertyName && ![self.propertyName isEqualToString:detail.propertyName])
        return NO;
    return YES;
}

- (NSUInteger)hash
{
    NSUInteger hash = self.message.hash;
    hash = hash * 31u + (NSUInteger) self.severity;
    hash = hash * 31u + (NSUInteger) self.errorType;
    hash = hash * 31u + self.methodName.hash;
    hash = hash * 31u + self.className.hash;
    hash = hash * 31u + self.propertyName.hash;
    return hash;
}

@end
