//
//  ApiJsonCodeGenerator
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, ApiErrorSeverity) {
    ApiErrorSeverityInfo,
    ApiErrorSeverityWarning,
    ApiErrorSeverityError
};

typedef NS_ENUM(NSInteger, ApiErrorType) {
    ApiErrorTypeClassInitPropertyMissingInDictionary,
    ApiErrorTypeClassInitAdditionalPropertyInDictionary,
    ApiErrorTypeClassInitDeprecatedPropertyMissingInDictionary,
    ApiErrorTypeEnumFromStringKeyNotFoundInDictionary,
    ApiErrorTypeServiceResultUnwrapPropertyMissingInDictionary,
    ApiErrorTypeServiceResultUnwrapObjectForKeyedSubscriptUnsupported,
    ApiErrorTypeAsProtocolObjectOfWrongType,
    ApiErrorTypeInvalidIso8601String,
    ApiErrorTypeInvalidBase64String,
    ApiErrorTypeJsonSerializationError
};


NSArray *api_stringsForUnusedKeysInDict(NSArray *keys, NSDictionary *dict);


@interface ApiErrorDetail : NSObject


#pragma mark mandatory

/// @brief developer friendly message
@property (nonatomic, readonly) NSString *message;

@property (nonatomic, readonly) ApiErrorSeverity severity;

@property (nonatomic, readonly) ApiErrorType errorType;

/// @brief the objective c method name, where it happened
@property (nonatomic, readonly) NSString *methodName;

/// @brief object or nil, that it concerned
@property (nonatomic, readonly) NSArray *objects;


#pragma mark optional

/// @brief class name or nil, where it happened
@property (nonatomic, readonly) NSString *className;

/// @brief property name or nil, where it happened
@property (nonatomic, readonly) NSString *propertyName;

/// @brief numberOfOccurences == objects.count
@property (readonly) NSUInteger numberOfOccurences;

#pragma mark methods

+ (instancetype)apiErrorWithMessage:(NSString *)message
                           severity:(ApiErrorSeverity)severity
                          errorType:(ApiErrorType)errorType
                         methodName:(NSString *)methodName
                          className:(NSString *)className
                       propertyName:(NSString *)propertyName
                             object:(id)object;

+ (instancetype)apiErrorWithMessage:(NSString *)message
                           severity:(ApiErrorSeverity)severity
                          errorType:(ApiErrorType)errorType
                         methodName:(NSString *)methodName
                          className:(NSString *)className
                       propertyName:(NSString *)propertyName
                            objects:(NSArray *)objects;

+ (instancetype)apiErrorWithMessage:(NSString *)message
                           severity:(ApiErrorSeverity)severity
                          errorType:(ApiErrorType)errorType
                         methodName:(NSString *)methodName
                             object:(id)object;

- (instancetype)merge:(ApiErrorDetail *)apiError;

@end
