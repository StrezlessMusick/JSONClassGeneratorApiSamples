
// This file was generated. It might get overwritten.
// Try modifying the definition fed to the generator.

#import <Foundation/Foundation.h>

@class ApiError;




// - - - Joke - - -

@interface Joke : NSObject <NSCopying, NSSecureCoding>

@property (nonatomic, copy) NSString *icon_url;
/// @brief [String]
@property (nonatomic, copy) NSArray  *category;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *value;
@property (nonatomic, copy) NSString *id_;

#pragma mark direct initialization

- (instancetype)init;
/// @brief category :: [String]
- (instancetype)initWithIcon_url:(NSString *)icon_url category:(NSArray *)category url:(NSString *)url value:(NSString *)value id:(NSString *)id_ NS_DESIGNATED_INITIALIZER;
/// @brief category :: [String]
+ (instancetype)jokeWithIcon_url:(NSString *)icon_url category:(NSArray *)category url:(NSString *)url value:(NSString *)value id:(NSString *)id_;

#pragma mark json initialization

/// @brief 'dict' must be a dictionary representing a JSON structure
- (instancetype)initWithDict:(NSDictionary *)dict;
/// @brief 'dict' must be a dictionary representing a JSON structure
- (instancetype)initWithDict:(NSDictionary *)dict apiError:(ApiError *)apiError;
/// @brief 'dict' must be a dictionary representing a JSON structure
+ (instancetype)jokeWithDict:(NSDictionary *)dict;
/// @brief 'dict' must be a dictionary representing a JSON structure
+ (instancetype)jokeWithDict:(NSDictionary *)dict apiError:(ApiError *)apiError;
/// @brief returns a dictionary, that can be converted to JSON via api_toJson or using NSJSONSerialization
- (NSDictionary *)toDict;

#pragma mark NSObjectProtocol implementation

/// @brief checks if the object's classes are equal prior to calling -isEqualToMyClassA
- (BOOL)isEqual:(id)other;
/// @brief objects are equal, iff all properties are equal
- (BOOL)isEqualToJoke:(Joke *)other;
/// @brief a reasonable implementation of -hash
- (NSUInteger)hash;

/// @brief returns class name and all properties
- (NSString *)description;
/// @brief like -description, but also returns pointer address for debugging
- (NSString *)debugDescription;
#ifdef DEBUG
/// @brief returns result from -debugDescription, so you can quickLook your variables in XCode
- (id)debugQuickLookObject;
#endif

/// @brief returns a deep copy
- (instancetype)copyWithZone:(NSZone *)zone;

#pragma mark NSSecureCoding <NSCoding> implementation

/// @brief all properties, for which the decoded value is nil, will silently get a most primitive default value assigned, that has the property's type
- (instancetype)initWithCoder:(NSCoder *)coder;
/// @brief complies to NSSecureCoding <NSCoding>. Use NSKeyedArchiver or -archivedData for serialization
- (void)encodeWithCoder:(NSCoder *)coder;
/// @brief securely decodes the previously archivedData forKey:@"root" using an NSKeyedUnarchiver;
+ (instancetype)jokeWithArchivedData:(NSData *)archivedData;
/// @brief [NSKeyedArchiver archivedDataWithRootObject:self]
- (NSData *)archivedData;

@end // Joke

