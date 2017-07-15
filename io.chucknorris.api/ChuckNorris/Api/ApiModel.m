
// This file was generated. It might get overwritten.
// Try modifying the definition fed to the generator.

#import "ApiModel.h"

#import "ApiError.h"
#import "ApiErrorDetail.h"
#import "ApiAsObjectOfTypeProtocol.h"
#import "ApiAsJsonOfTypeProtocol.h"
#import "ApiJsonClasses+TypeProtocol.h"
#import "Optional.h"
#import "NSArray+Api.h"
#import "NSString+Api.h"
#import "NSData+Api.h"
#import "NSDate+Api.h"
#import "NSDictionary+Api.h"
#import "NSObjects+ApiDescription.h"



@implementation Joke

#pragma mark direct initialization

- (instancetype)init {
    return [self initWithIcon_url:@""
                         category:@[]
                              url:@""
                            value:@""
                               id:@""];
}

- (instancetype)initWithIcon_url:(NSString *)icon_url category:(NSArray *)category url:(NSString *)url value:(NSString *)value id:(NSString *)id_ {
    if ((self = [super init])) {
        _icon_url = icon_url;
        _category = category;
        _url      = url;
        _value    = value;
        _id_      = id_;
    }
    return self;
}

+ (instancetype)jokeWithIcon_url:(NSString *)icon_url category:(NSArray *)category url:(NSString *)url value:(NSString *)value id:(NSString *)id_ {
    return [(Joke *)[self alloc] initWithIcon_url:icon_url category:category url:url value:value id:id_];
}

#pragma mark json initialization

/// @brief 'dict' must be a dictionary representing a JSON structure
- (instancetype)initWithDict:(NSDictionary *)dict {
    return [self initWithDict:dict apiError:nil];
}

- (instancetype)initWithDict:(NSDictionary *)dict apiError:(ApiError *)apiError {
    id icon_urlJson = dict[@"icon_url"];
    id categoryJson = dict[@"category"];
    id urlJson      = dict[@"url"];
    id valueJson    = dict[@"value"];
    id idJson       = dict[@"id"];
    
    if (apiError) {
#ifdef DEBUG
        NSInteger extractedValuesCount = !!icon_urlJson + !!categoryJson + !!urlJson + !!valueJson + !!idJson;
        if ((NSInteger)dict.count > extractedValuesCount) {
            NSArray *unusedKeys = [dict.allKeys api_filter:^(NSString *key){ return (BOOL)![@[ @"icon_url", @"category", @"url", @"value", @"id" ] containsObject:key]; }];
            for (NSString *unusedKey in unusedKeys) {
                ApiErrorDetail *apiErrorDetail = [ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"-[Joke initWithDict:apiError:]: unused property { %@ :: %@ } in dictionary", [unusedKey api_description], [dict[unusedKey] api_jsonType]] severity:ApiErrorSeverityInfo errorType:ApiErrorTypeClassInitAdditionalPropertyInDictionary methodName:@"-[Joke initWithDict:apiError:]" className:@"Joke" propertyName:unusedKey object:self];
                [apiError addApiErrorDetail:apiErrorDetail];
            }
        }
#endif
        if (!icon_urlJson) { [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:@"-[Joke initWithDict:apiError:]: property 'icon_url'" @" is missing in dictionary" severity:ApiErrorSeverityInfo errorType:ApiErrorTypeClassInitPropertyMissingInDictionary methodName:@"-[Joke initWithDict:apiError:]" className:@"Joke" propertyName:@"icon_url" object:self]]; }
        if (!categoryJson) { [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:@"-[Joke initWithDict:apiError:]: property 'category'" @" is missing in dictionary" severity:ApiErrorSeverityInfo errorType:ApiErrorTypeClassInitPropertyMissingInDictionary methodName:@"-[Joke initWithDict:apiError:]" className:@"Joke" propertyName:@"category" object:self]]; }
        if (!urlJson)      { [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:@"-[Joke initWithDict:apiError:]: property 'url'"      @" is missing in dictionary" severity:ApiErrorSeverityInfo errorType:ApiErrorTypeClassInitPropertyMissingInDictionary methodName:@"-[Joke initWithDict:apiError:]" className:@"Joke" propertyName:@"url"      object:self]]; }
        if (!valueJson)    { [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:@"-[Joke initWithDict:apiError:]: property 'value'"    @" is missing in dictionary" severity:ApiErrorSeverityInfo errorType:ApiErrorTypeClassInitPropertyMissingInDictionary methodName:@"-[Joke initWithDict:apiError:]" className:@"Joke" propertyName:@"value"    object:self]]; }
        if (!idJson)       { [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:@"-[Joke initWithDict:apiError:]: property 'id'"       @" is missing in dictionary" severity:ApiErrorSeverityInfo errorType:ApiErrorTypeClassInitPropertyMissingInDictionary methodName:@"-[Joke initWithDict:apiError:]" className:@"Joke" propertyName:@"id"       object:self]]; }
    }
    return [self initWithIcon_url:icon_urlJson ? [icon_urlJson api_asStringApiError:apiError context:@"Joke > icon_url"] : @""
                         category:categoryJson ? [[categoryJson api_asArrayApiError:apiError context:@"Joke > category"] api_map:^(NSString *str){ return [str api_asStringApiError:apiError context:@"Joke > category > Array"]; }] : @[]
                              url:urlJson      ? [urlJson api_asStringApiError:apiError context:@"Joke > url"] : @""
                            value:valueJson    ? [valueJson api_asStringApiError:apiError context:@"Joke > value"] : @""
                               id:idJson       ? [idJson api_asStringApiError:apiError context:@"Joke > id"] : @""];
}

+ (instancetype)jokeWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

+ (instancetype)jokeWithDict:(NSDictionary *)dict apiError:(ApiError *)apiError {
    return [[self alloc] initWithDict:dict apiError:apiError];
}

- (NSDictionary *)toDict {
    if (!self.icon_url) { [[NSException exceptionWithName:@"ApiGeneratedClassNilPropertyException" reason:@"Joke toDict: property 'icon_url'" @" is nil" userInfo:@{}] raise]; }
    if (!self.category) { [[NSException exceptionWithName:@"ApiGeneratedClassNilPropertyException" reason:@"Joke toDict: property 'category'" @" is nil" userInfo:@{}] raise]; }
    if (!self.url     ) { [[NSException exceptionWithName:@"ApiGeneratedClassNilPropertyException" reason:@"Joke toDict: property 'url'"      @" is nil" userInfo:@{}] raise]; }
    if (!self.value   ) { [[NSException exceptionWithName:@"ApiGeneratedClassNilPropertyException" reason:@"Joke toDict: property 'value'"    @" is nil" userInfo:@{}] raise]; }
    if (!self.id_     ) { [[NSException exceptionWithName:@"ApiGeneratedClassNilPropertyException" reason:@"Joke toDict: property 'id_'"      @" is nil" userInfo:@{}] raise]; }
    return @{ @"icon_url" : self.icon_url
            , @"category" : [((NSArray *)self.category) api_map:^(NSString *str){ return str; }]
            , @"url"      : self.url
            , @"value"    : self.value
            , @"id"       : self.id_
            };
}

#pragma mark NSObjectProtocol implementation

- (BOOL)isEqual:(id)other {
    BOOL isEqual;
    if (self == other) {
        isEqual = YES;
    } else {
        isEqual = other != nil
               && [[self class] isEqual:[other class]]
               && [self isEqualToJoke:other];
    }
    return isEqual;
}

- (BOOL)isEqualToJoke:(Joke *)other {
    BOOL isEqualToJoke;
    if (self == other) {
        isEqualToJoke = YES;
    } else {
        isEqualToJoke =
            ( (!self.icon_url && !other.icon_url) || (self.icon_url != nil && other.icon_url!= nil && [self.icon_url isEqual:other.icon_url]) ) &&
            ( (!self.category && !other.category) || (self.category != nil && other.category!= nil && [self.category isEqual:other.category]) ) &&
            ( (!self.url      && !other.url     ) || (self.url      != nil && other.url     != nil && [self.url      isEqual:other.url     ]) ) &&
            ( (!self.value    && !other.value   ) || (self.value    != nil && other.value   != nil && [self.value    isEqual:other.value   ]) ) &&
            ( (!self.id_      && !other.id_     ) || (self.id_      != nil && other.id_     != nil && [self.id_      isEqual:other.id_     ]) );
    }
    return isEqualToJoke;
}

- (NSUInteger)hash {
    NSUInteger hash = 1u;
    hash = 31u * hash + self.icon_url.hash;
    hash = 31u * hash + self.category.hash;
    hash = 31u * hash + self.url.hash;
    hash = 31u * hash + self.value.hash;
    hash = 31u * hash + self.id_.hash;
    return hash;
}

- (NSString *)propertiesDescription_ {
    NSString *propertiesDescription = [ @[ [NSString stringWithFormat:@"icon_url = %@"  , [self.icon_url api_description]],
                                           [NSString stringWithFormat:@"category = [%@]", [[self.category api_map:^(NSString *str){ return [NSString stringWithFormat:@"%@", [str api_description]]; } ] componentsJoinedByString:@", "]],
                                           [NSString stringWithFormat:@"url = %@"       , [self.url api_description]],
                                           [NSString stringWithFormat:@"value = %@"     , [self.value api_description]],
                                           [NSString stringWithFormat:@"id_ = %@"       , [self.id_ api_description]]
                                           ] componentsJoinedByString:@", "
                                       ];
    return propertiesDescription;
}

- (NSString *)description {
    NSString *propertiesDescription = [self propertiesDescription_];
    return [NSString stringWithFormat:@"%@ { %@ }", NSStringFromClass([self class]), propertiesDescription];
}

- (NSString *)debugDescription {
    NSString *propertiesDescription = [self propertiesDescription_];
    return [NSString stringWithFormat:@"%@ { %@ }", super.description, propertiesDescription];
}

#ifdef DEBUG
- (id)debugQuickLookObject {
    return [self debugDescription];
}
#endif

- (instancetype)copyWithZone:(NSZone *)zone {
    Joke *jokeCopy = [[[self class] allocWithZone:zone] init];
    jokeCopy.icon_url = [self.icon_url copy];
    jokeCopy.category = [self.category api_map:^(NSString *str){ return [str copy]; }];
    jokeCopy.url      = [self.url copy];
    jokeCopy.value    = [self.value copy];
    jokeCopy.id_      = [self.id_ copy];
    return jokeCopy;
}

#pragma mark NSSecureCoding <NSCoding> implementation

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    return [self initWithIcon_url:(NSString *)[coder decodeObjectOfClass:[NSString class] forKey:@"icon_url"] ?: @""
                         category:[(NSArray *)[[coder decodeObjectOfClasses:[NSSet setWithObjects:[NSArray class], [NSString class], nil] forKey:@"category"] ?: @[] api_asObjectOfType:kApiTypeNSArray] ?: @[] api_map:^NSString *(id str){ return (NSString *)[str api_asObjectOfType:kApiTypeNSString] ?: @""; }]
                              url:(NSString *)[coder decodeObjectOfClass:[NSString class] forKey:@"url"] ?: @""
                            value:(NSString *)[coder decodeObjectOfClass:[NSString class] forKey:@"value"] ?: @""
                               id:(NSString *)[coder decodeObjectOfClass:[NSString class] forKey:@"id"] ?: @""];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:_icon_url forKey:@"icon_url"];
    [coder encodeObject:_category forKey:@"category"];
    [coder encodeObject:_url      forKey:@"url"];
    [coder encodeObject:_value    forKey:@"value"];
    [coder encodeObject:_id_      forKey:@"id"];
}

+ (instancetype)jokeWithArchivedData:(NSData *)archivedData {
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:archivedData];
    unarchiver.requiresSecureCoding = YES;
    Joke *joke = [unarchiver decodeObjectOfClass:[Joke class] forKey:@"root"];
    return joke;
}

- (NSData *)archivedData {
    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:self];
    return archivedData;
}

@end // Joke

