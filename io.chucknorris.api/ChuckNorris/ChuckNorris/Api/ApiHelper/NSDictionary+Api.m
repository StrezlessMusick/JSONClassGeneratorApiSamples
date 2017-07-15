//
//  ApiJsonCodeGenerator
//

#import "NSDictionary+Api.h"

#ifndef API_DISABLE_UNNECESSARY_CATEGORIES
#import "ApiError.h"
#import "ApiErrorDetail.h"
#endif

@implementation NSDictionary (Api)

/// @brief converts the dictionary to json data. The conversion will fail, if any of the contained types is not a json object: NSNull, NSNumber, NSString, NSArray, NSDictionary. Then an '{}' is returned.
- (NSData *)api_toJson {
    return [self api_toJsonApiError:nil];
}

/// @brief converts the dictionary to json data. The conversion will fail, if any of the contained types is not a json object: NSNull, NSNumber, NSString, NSArray, NSDictionary. Then an '{}' is returned. Errors are logged.
- (NSData *)api_toJsonApiError:(ApiError *)apiError {
    NSError *error;
    NSData *json = nil;
    @try {
        json = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    }
    @catch (NSException *exception) {
        if (apiError) {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: serialization failed for dict", __PRETTY_FUNCTION__] severity:ApiErrorSeverityError errorType:ApiErrorTypeJsonSerializationError methodName:@(__PRETTY_FUNCTION__) object:self]];
        }
        return [@"{}" dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    if (!json || error) {
        [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"%s: serialization failed for dict with error %@", __PRETTY_FUNCTION__, error.description] severity:ApiErrorSeverityError errorType:ApiErrorTypeJsonSerializationError methodName:@(__PRETTY_FUNCTION__) object:self]];
        return [@"{}" dataUsingEncoding:NSUTF8StringEncoding];
    }
    return json;
}

/// @brief creates a new dictionary by applying to block to all key value pairs
- (NSDictionary *)api_map:(NSArray *(^)(NSArray *tuple))block {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (id key in self.allKeys) {
        NSArray *tuple = block(@[key,self[key]]);
        [dict setValue:tuple[1] forKey:tuple[0]];
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}

/// @brief creates an array containing tuples with key value encoded as 2-element arrays
- (NSArray *)api_toArray {
    NSMutableArray *array = [NSMutableArray array];
    for (id key in self.allKeys) {
        [array addObject:@[key,self[key]] ];
    }
    return [NSArray arrayWithArray:array];
}

@end


#ifndef API_DISABLE_UNNECESSARY_CATEGORIES

@implementation NSDictionary (ApiMore)

/// @brief creates a dictionary with json data. The top level object in the json must be a dictionary. If it is not there or there is some serialization problem, an empty NSDictionary is returned without further warnings
+ (NSDictionary *)api_dictionaryWithJson:(NSData *)json {
    return [self api_dictionaryWithJson:json apiError:nil];
}

/// @brief creates a dictionary with json data. The top level object in the json must be a dictionary. If it is not there or there is some serialization problem, an empty NSDictionary logging all possible problems ins the passed ApiError instance
+ (NSDictionary *)api_dictionaryWithJson:(NSData *)json apiError:(ApiError *)apiError {
    if (!json) {
        if (apiError) {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:@"json is nil" severity:ApiErrorSeverityWarning errorType:ApiErrorTypeJsonSerializationError methodName:@(__PRETTY_FUNCTION__) object:[self class]]];
        }
        return @{};
    }
    NSError *error;
    NSDictionary *dict = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:json options:0 error:&error];
    if (!dict) {
        if (apiError) {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"parsing json returned error: %@, string: %@, json %@", error.description, [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding], json] severity:ApiErrorSeverityWarning errorType:ApiErrorTypeJsonSerializationError methodName:@(__PRETTY_FUNCTION__) object:json]];
        }
        return @{};
    }
    if (error) {
        if (apiError) {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"parsing json returned error: %@, string: %@, json %@", error.description, [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding], json] severity:ApiErrorSeverityWarning errorType:ApiErrorTypeJsonSerializationError methodName:@(__PRETTY_FUNCTION__) object:json]];
        }
        return @{};
    }
    if (![dict isKindOfClass:[NSDictionary class]]) {
        if (apiError) {
            [apiError addApiErrorDetail:[ApiErrorDetail apiErrorWithMessage:[NSString stringWithFormat:@"expected kind of NSDictionary, but got %@", [dict class]] severity:ApiErrorSeverityWarning errorType:ApiErrorTypeJsonSerializationError methodName:@(__PRETTY_FUNCTION__) object:json]];
        }
        return @{};
    }
    return dict;
}

/// @brief returns a filtered dictionary. the tuple contains two objects: key, value
- (NSDictionary *)api_filter:(BOOL(^)(NSArray *tuple))predicate {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (id key in self.allKeys) {
        NSArray *tuple = @[key, self[key]];
        if (predicate(tuple)) {
            [dict setValue:tuple[1] forKey:tuple[0]];
        }
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}

/// @brief returns a dictionary with the respective key/value removed
- (NSDictionary *)api_dictionaryByRemovingObjectForKey:(id)key {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self];
    [dict removeObjectForKey:key];
    return [NSDictionary dictionaryWithDictionary:dict];
}

/// @brief returns a dictionary by combining multiple dictionaries into one. for duplicate keys: the last one wins
+ (NSDictionary *)api_dictionaryWithArrayOfDictionaries:(NSArray *)dicts {
    NSMutableDictionary *accumulator = [NSMutableDictionary dictionary];
    for (NSDictionary *dict in dicts) {
        [accumulator addEntriesFromDictionary:dict];
    }
    return [NSDictionary dictionaryWithDictionary:accumulator];
}

/// @brief returns a valid json description
- (NSString *)api_jsonDescription {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

/// @brief returns a tuple of NSDictionaries. The first value contains the key/values that passed the predicate, the last one contains the rest
- (NSArray *)api_partition:(BOOL(^)(id key, id val))pred {
    NSMutableDictionary *trues  = [NSMutableDictionary dictionary];
    NSMutableDictionary *falses = [NSMutableDictionary dictionary];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id val, BOOL *stop) {
        if (pred(key, val)) {
            trues[key] = val;
        } else {
            falses[key] = val;
        }
    }];
    return @[ [trues copy], [falses copy] ];
}

/// @brief returns a new dictionary, that contains the combined key/values. for duplicate keys: the keys of the added "dictionary" win
- (NSDictionary *)api_dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary {
    NSMutableDictionary *dict = [self mutableCopy];
    [dict addEntriesFromDictionary:dictionary];
    return [dict copy];
}

@end

#endif
