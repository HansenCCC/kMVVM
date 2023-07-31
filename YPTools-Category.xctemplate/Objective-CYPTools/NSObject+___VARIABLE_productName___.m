//
//  NSObject+HAHA.m
//  YPPrompts
//
//  Created by Hansen on 2023/5/9.
//

#import "NSObject+___VARIABLE_productName___.h"
#import <objc/runtime.h>
#import "NSDictionary+___VARIABLE_productName___.h"


@implementation NSObject (___VARIABLE_productName___)

+ (NSArray *)___VARIABLE_productName____allClassProperties {
    Class class;
    NSArray *names = [self ___VARIABLE_productName____fetchClassProperties:class];
    return names;
}

+ (NSArray *)___VARIABLE_productName____currentClassProperties {
    NSArray *names = [self ___VARIABLE_productName____fetchClassProperties:self];
    return names;
}

+ (NSArray *)___VARIABLE_productName____fetchClassProperties:(Class)root {
    Class cls = [self class];
    unsigned int count;
    if (root) {
        root = class_getSuperclass(root);
    }
    NSMutableArray *propertyNames = [[NSMutableArray alloc] init];
    while (cls != root) {
        objc_property_t *properties = class_copyPropertyList(cls, &count);
        for (int i = 0; i<count; i++) {
            objc_property_t property = properties[i];
            NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            if (![propertyNames containsObject:propertyName]) {
                [propertyNames addObject:propertyName];
            }
        }
        if (properties){
            free(properties);
        }
        cls = class_getSuperclass(cls);
    }
    return propertyNames;
}

- (NSDictionary *)___VARIABLE_productName____allClassPropertiesAndValues {
    Class class;
    NSDictionary *para = [self ___VARIABLE_productName____fetchClassPropertiesAndValues:class];
    return para;
}


- (NSDictionary *)___VARIABLE_productName____currentClassPropertiesAndValues {
    NSDictionary *para = [self ___VARIABLE_productName____fetchClassPropertiesAndValues:self.class];
    return para;
}

- (NSDictionary *)___VARIABLE_productName____fetchClassPropertiesAndValues:(Class)root {
    NSArray *propertyNames = [self.class ___VARIABLE_productName____fetchClassProperties:root];
    NSMutableDictionary *para = [[NSMutableDictionary alloc] initWithCapacity:propertyNames.count];
    for (NSString *propertyName in propertyNames) {
        id object = [self valueForKey:propertyName];
        if (object) {
            [para setObject:object forKey:propertyName];
        }
    }
    return para;
}

- (NSString *)___VARIABLE_productName____objectToJsonString {
    NSDictionary *dic = [self ___VARIABLE_productName____currentClassPropertiesAndValues];
    return dic.___VARIABLE_productName____dictionaryToJsonString;
}

- (NSString *)___VARIABLE_productName____objectToJsonStringNoSpace {
    NSDictionary *dic = [self ___VARIABLE_productName____currentClassPropertiesAndValues];
    return dic.___VARIABLE_productName____dictionaryToJsonStringNoSpace;
}

- (NSDictionary *)___VARIABLE_productName____objectToDictionary {
    NSDictionary *dic = [self ___VARIABLE_productName____currentClassPropertiesAndValues];
    return dic;
}

@end


@implementation NSObject (___VARIABLE_productName____Hook)

+ (void)___VARIABLE_productName____exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2 {
    method_exchangeImplementations(class_getInstanceMethod(self, method1), class_getInstanceMethod(self, method2));
}

+ (void)___VARIABLE_productName____exchangeClassMethod1:(SEL)method1 method2:(SEL)method2 {
    method_exchangeImplementations(class_getClassMethod(self, method1), class_getClassMethod(self, method2));
}

@end
