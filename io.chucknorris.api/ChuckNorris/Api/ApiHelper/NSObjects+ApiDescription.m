//
//  ApiJsonCodeGenerator
//

#import "NSObjects+ApiDescription.h"

#import "NSDictionary+Api.h"
#import "NSArray+Api.h"


@implementation NSObject (ApiDescription)

/// @brief faster and prettier version of -description
- (NSString *)api_description {
    return self.description;
}

/// @brief objc literal version of -api_description
- (NSString *)api_descriptionLiteral {
    return [self api_description];
}

@end


@implementation NSArray (ApiDescription)


/// @brief faster and prettier version of -description
- (NSString *)api_description {
    return [NSString stringWithFormat:@"[%@]",[[self api_map:^id(id a) {
        return [a api_description];
    }] componentsJoinedByString:@", "]];
}

/// @brief objc literal version of -api_description
- (NSString *)api_descriptionLiteral {
    return [NSString stringWithFormat:@"@[%@]",[[self api_map:^id(id a) {
        return [a api_descriptionLiteral];
    }] componentsJoinedByString:@", "]];
}

@end


@implementation NSDictionary (ApiDescription)

/// @brief faster and prettier version of -description
- (NSString *)api_description {
    return [NSString stringWithFormat:@"{ %@ }",[[[self api_toArray] api_map:^(NSArray *tuple){
        return [NSString stringWithFormat:@"%@ : %@", [tuple.firstObject api_description], [tuple.lastObject api_description]];
    }] componentsJoinedByString:@", "]];
}

/// @brief objc literal version of -api_description
- (NSString *)api_descriptionLiteral {
    return [NSString stringWithFormat:@"@{ %@ }",[[[self api_toArray] api_map:^(NSArray *tuple){
        return [NSString stringWithFormat:@"%@ : %@", [tuple.firstObject api_descriptionLiteral], [tuple.lastObject api_descriptionLiteral]];
    }] componentsJoinedByString:@", "]];
}

@end


@implementation NSString (ApiDescription)

/// @brief returns a properly quoted and escaped string
- (NSString *)api_description {
    NSMutableString *str = [self mutableCopy];
    NSUInteger len = self.length;
    [str replaceOccurrencesOfString:@"\\" withString:@"\\\\" options:NSLiteralSearch range:NSMakeRange(0, len)];
    [str replaceOccurrencesOfString:@"\a" withString:@"\\a" options:NSLiteralSearch range:NSMakeRange(0, len)];
    [str replaceOccurrencesOfString:@"\b" withString:@"\\b" options:NSLiteralSearch range:NSMakeRange(0, len)];
    [str replaceOccurrencesOfString:@"\f" withString:@"\\f" options:NSLiteralSearch range:NSMakeRange(0, len)];
    [str replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSLiteralSearch range:NSMakeRange(0, len)];
    [str replaceOccurrencesOfString:@"\r" withString:@"\\r" options:NSLiteralSearch range:NSMakeRange(0, len)];
    [str replaceOccurrencesOfString:@"\t" withString:@"\\t" options:NSLiteralSearch range:NSMakeRange(0, len)];
    [str replaceOccurrencesOfString:@"\v" withString:@"\\v" options:NSLiteralSearch range:NSMakeRange(0, len)];
    [str replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSLiteralSearch range:NSMakeRange(0, len)];
    
    return [NSString stringWithFormat:@"\"%@\"",str];
}

/// @brief objc literal version of -api_description
- (NSString *)api_descriptionLiteral {
    return [@"@"  stringByAppendingString:[self api_description]];
}

@end

@implementation NSNumber (ApiDescription)


/// @brief same as -stringValue
- (NSString *)api_description {
    return self.stringValue;
}

/// @brief objc literal version of -api_description
- (NSString *)api_descriptionLiteral {
    return [@"@" stringByAppendingString:self.stringValue];
}

@end

@implementation NSData (ApiDescription)

/// @brief "<base64 of length n>"
- (NSString *)api_description {
    return [NSString stringWithFormat:@"<data of length %zd>", self.length];
}

/// @brief @"aGVsbG8=" <- directly use
- (NSString *)api_descriptionLiteral {
    return [NSString stringWithFormat:@"@\"%@\"", [self base64EncodedStringWithOptions:0]];
}

@end
