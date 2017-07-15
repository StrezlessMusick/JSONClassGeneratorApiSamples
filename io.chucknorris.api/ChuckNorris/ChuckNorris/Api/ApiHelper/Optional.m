//
//  ApiJsonCodeGenerator
//

#import "Optional.h"

@interface Optional ()
@property (nonatomic) id val;
@end

@implementation Optional

/// @brief value can be nil
+ (instancetype)optionalWithValueOrNil:(id)value {
    Optional *optional = [[Optional alloc] init];
    optional.val = value;
    return optional;
}

/// @brief returns optional that isNothing
+ (instancetype)optionalWithNothing {
    static dispatch_once_t onceToken;
    static Optional *nothing;
    dispatch_once(&onceToken, ^{
        nothing = [[Optional alloc] init];
    });
    return nothing;
}

/// @brief value must not be nil
+ (instancetype)optionalWithValue:(id)value {
    if (!value) {
        [[NSException exceptionWithName:@"NilValueException" reason:@"Provided value must not be nil. If you expect the value to be non-nil: find the bug. If the value is expected to be nil: use +optionalWithValueOrNil: instead." userInfo:@{}] raise];
    }
    return [self optionalWithValueOrNil:value];
}

/// @brief is the optional a value
- (BOOL)isValue {
    return _val != nil;
}

/// @brief is the optional no value
- (BOOL)isNothing {
    return _val == nil;
}

/// @brief like map on array - but optional is array that can only hold one value
- (Optional *)fmap:(id(^)(id a))fun {
    return _val ? [Optional optionalWithValue:fun(_val)] : self;
}

/// @brief [(Optional *)nothing valueOrDefault:x] == x, [(Optional *)aValue valueOrDefault:x] returns inner value
- (id)valueOrDefault:(id)defaultValue {
    return _val ?: defaultValue;
}

/// @brief convenience function for [[optional fmap:fun] valueOrDefault:x]
- (id)fmap:(id(^)(id a))fun valueOrDefault:(id)defaultValue {
    return _val ? fun(_val) : defaultValue;
}

/// @brief returns the inner value - don't use. use valueOrDefault instead
- (id)valueOrNil {
    return _val;
}

/// @brief returns the inner value if isValue, otherwise throws an exception - check isValue, before using or use valueOrDefault
- (id)valueOrException {
    if (!_val) {
        [[NSException exceptionWithName:@"NoValueException" reason:@"Don't force the inner value, if you are not sure, that it exists" userInfo:@{}] raise];
    }
    return _val;
}

/// @brief block is executed (and passed the inner value) if isValue
- (void)ifIsValueDo:(void(^)(id a))block {
    if (_val) {
        block(_val);
    }
}

/// @brief block is executed (and passed the inner value) if isValue, the elseBlock is executed otherwise
- (void)ifIsValueDo:(void(^)(id a))block elseDo:(void(^)())elseBlock {
    if (_val) {
        block(_val);
    } else {
        elseBlock();
    }
}


- (BOOL)isEqual:(Optional *)object {
    if (!object) {
        return NO;
    }

    if (self == object) {
        return YES;
    }

    if (![object isKindOfClass:[Optional class]]) {
        return NO;
    }

    if (object.isValue && self.isValue) {
        return [self.val isEqual:object.val];
    }
    else if (object.isNothing && self.isNothing) {
        return YES;
    }
    else {
        return NO;
    }
}

- (NSUInteger)hash {
    return _val ? 38161 : 38347 + [_val hash];
}

- (NSString *)description {
    return [self fmap:^id(id a) {
        return [NSString stringWithFormat:@"Value (%@)", a];
    } valueOrDefault:@"Nothing"];
}

#ifdef DEBUG
- (id)debugQuickLookObject {
    return self.description;
}
#endif

- (instancetype)copy {
    return [self copyWithZone:nil];
}

- (instancetype)copyWithZone:(NSZone *)zone {
    Optional *copy = [[[self class] allocWithZone:zone] init];
    copy.val = [self.val copy];
    return copy;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:_val forKey:@"val"];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    _val = [coder decodeObjectOfClass:[NSObject class] forKey:@"val"];
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end


#ifndef API_DISABLE_UNNECESSARY_CATEGORIES

@implementation Optional (ApiMore)

- (Optional *)combineWith:(Optional *)other combinator:(id(^)(id a, id b))combinator {
    if (self.isNothing) {
        return other;
    }
    if (other.isNothing) {
        return self;
    }
    // both have value
    return [Optional optionalWithValue:combinator(self, other)];
}

@end

#endif
