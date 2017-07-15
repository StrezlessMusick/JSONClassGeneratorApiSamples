//
//  ApiJsonCodeGenerator
//

#import <Foundation/Foundation.h>

@interface Optional : NSObject <NSSecureCoding> // it is (and can not be) secure if you use it on its own, due to problems in apples NSSecureCoding API. nevertheless it is save to use as part of a generated class, because the class takes care of making decoding secure.

/// @brief value can be nil
+ (instancetype)optionalWithValueOrNil:(id)value;

/// @brief returns optional that isNothing
+ (instancetype)optionalWithNothing;

/// @brief value must not be nil
+ (instancetype)optionalWithValue:(id)value;

/// @brief is the optional a value
@property (readonly) BOOL isValue;

/// @brief is the optional no value
@property (readonly) BOOL isNothing;

/// @brief like map on array - but optional is array that can only hold one value
- (Optional *)fmap:(id(^)(id a))fun;

/// @brief [(Optional *)nothing valueOrDefault:x] == x, [(Optional *)aValue valueOrDefault:x] returns inner value
- (id)valueOrDefault:(id)defaultValue;

/// @brief convenience function for [[optional fmap:fun] valueOrDefault:x]
- (id)fmap:(id(^)(id a))fun valueOrDefault:(id)defaultValue;

/// @brief returns the inner value - don't use. use valueOrDefault instead
@property (readonly) id valueOrNil;

/// @brief returns the inner value if isValue, otherwise throws an exception - check isValue, before using or use valueOrDefault
@property (readonly) id valueOrException;

/// @brief block is executed (and passed the inner value) if isValue
- (void)ifIsValueDo:(void(^)(id a))block;

/// @brief block is executed (and passed the inner value) if isValue, the elseBlock is executed otherwise
- (void)ifIsValueDo:(void(^)(id a))block elseDo:(void(^)())elseBlock;

@end


#ifndef API_DISABLE_UNNECESSARY_CATEGORIES

@interface Optional (ApiMore)

- (Optional *)combineWith:(Optional *)other combinator:(id(^)(id a, id b))combinator;

@end

#endif
