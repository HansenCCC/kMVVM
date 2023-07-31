//
//  NSObject+HAHA.m
//  YPPrompts
//
//  Created by Hansen on 2023/5/9.
//

#import "NSDictionary+___VARIABLE_productName___.h"

@implementation NSDictionary (___VARIABLE_productName___)

- (NSString *)___VARIABLE_productName____dictionaryToJsonString {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[self copy] options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

- (NSString *)___VARIABLE_productName____dictionaryToJsonStringNoSpace {
    NSString *jsonString = [self ___VARIABLE_productName____dictionaryToJsonString];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@" " withString:@""];
    return jsonString;
}

@end
