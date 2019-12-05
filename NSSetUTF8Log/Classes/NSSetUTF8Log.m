//
//  NSSetUTF8Log.m
//
//  Created by Aiwei on 2019/11/27.
//  Copyright © 2019 Aiwei. All rights reserved.
//

#import "NSSetUTF8Log.h"

static void exchangeInstanceMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else
    {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

static NSString * convertUnicode(NSString *string)
{
    NSRegularExpression *rx = [[NSRegularExpression alloc]initWithPattern:@"\\\\?\\\\[uU]\\w{4}" options:0 error:nil];
    
    NSMutableString* result = [string mutableCopy];
    NSArray* matches = [rx matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    for (int i=(int)matches.count-1; i>=0; i--) {
        NSTextCheckingResult* match = matches[i];
        NSString* matchStr = [string substringWithRange:match.range];
        
        NSString* replacement = [NSString stringWithCString:[matchStr cStringUsingEncoding:NSUTF8StringEncoding]
        encoding:NSNonLossyASCIIStringEncoding];
        replacement = replacement?:matchStr;
        [result replaceCharactersInRange:match.range withString:replacement];
    }
    
    return result;
}

@implementation NSSet (UTF8Log)
#ifdef DEBUG

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        exchangeInstanceMethod([self class], @selector(description), @selector(utf8_description));
    });
}

- (NSString *)utf8_description
{
    return convertUnicode([self utf8_description]);
}

#endif
@end

@implementation NSDictionary (UTF8Log)
#ifdef DEBUG

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        exchangeInstanceMethod([self class], @selector(description), @selector(utf8_description));
    });
}

- (NSString *)utf8_description
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
        options:NSJSONWritingPrettyPrinted
          error:&error];
        if (!error) {
            NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            return [jsonString stringByReplacingOccurrencesOfString:@"\\/" withString:@"/"];
        }
        
    }
    return convertUnicode([self utf8_description]);
}

#endif
@end

@implementation NSArray (UTF8Log)
#ifdef DEBUG

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        exchangeInstanceMethod([self class], @selector(description), @selector(utf8_description));
    });
}

- (NSString *)utf8_description
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
        options:NSJSONWritingPrettyPrinted
          error:&error];
        if (!error) {
            NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            return [jsonString stringByReplacingOccurrencesOfString:@"\\/" withString:@"/"];
        }
        
    }
    return convertUnicode([self utf8_description]);
}

#endif
@end
