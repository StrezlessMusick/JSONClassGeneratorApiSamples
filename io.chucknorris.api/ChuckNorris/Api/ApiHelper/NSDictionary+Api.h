//
//  ApiJsonCodeGenerator
//

#import <Foundation/Foundation.h>

#ifndef API_DISABLE_UNNECESSARY_CATEGORIES
@class ApiError;
#endif

@interface NSDictionary (Api)

/// @brief converts the dictionary to json data. The conversion will fail, if any of the contained types is not a json object: NSNull, NSNumber, NSString, NSArray, NSDictionary. Then an '{}' is returned.
- (NSData *)api_toJson;

/// @brief converts the dictionary to json data. The conversion will fail, if any of the contained types is not a json object: NSNull, NSNumber, NSString, NSArray, NSDictionary. Then an '{}' is returned. Errors are logged.
- (NSData *)api_toJsonApiError:(ApiError *)apiError;

/// @brief creates a new dictionary by applying to block to all key value pairs
- (NSDictionary *)api_map:(NSArray *(^)(NSArray *tuple))block;

/// @brief creates an array containing tuples with key value encoded as 2-element arrays
- (NSArray *)api_toArray;

@end


#ifndef API_DISABLE_UNNECESSARY_CATEGORIES

@interface NSDictionary (ApiMore)

/// @brief creates a dictionary with json data. The top level object in the json must be a dictionary. If it is not there or there is some serialization problem, an empty NSDictionary is returned without further warnings
+ (NSDictionary *)api_dictionaryWithJson:(NSData *)json;

/// @brief creates a dictionary with json data. The top level object in the json must be a dictionary. If it is not there or there is some serialization problem, an empty NSDictionary logging all possible problems ins the passed ApiError instance
+ (NSDictionary *)api_dictionaryWithJson:(NSData *)json apiError:(ApiError *)apiError;

/// @brief returns a filtered dictionary. the tuple contains two objects: key, value
- (NSDictionary *)api_filter:(BOOL(^)(NSArray *tuple))predicate;

/// @brief returns a dictionary with the respective key/value removed
- (NSDictionary *)api_dictionaryByRemovingObjectForKey:(id)key;

/// @brief returns a dictionary by combining multiple dictionaries into one. for duplicate keys: the last one wins
+ (NSDictionary *)api_dictionaryWithArrayOfDictionaries:(NSArray *)dicts;

/// @brief returns a valid json description
- (NSString *)api_jsonDescription;

/// @brief returns a tuple of NSDictionaries. The first value contains the key/values that passed the predicate, the last one contains the rest
- (NSArray *)api_partition:(BOOL(^)(id key, id val))pred;

/// @brief returns a new dictionary, that contains the combined key/values. for duplicate keys: the keys of the added "dictionary" win
- (NSDictionary *)api_dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary;

@end

#endif
