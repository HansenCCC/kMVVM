//
//  NSObject+HAHA.h
//  YPPrompts
//
//  Created by Hansen on 2023/5/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (___VARIABLE_productName___)

/// 获取当前对象所有的属性
+ (NSArray *)___VARIABLE_productName____allClassProperties;

/// 获取当前对象所有的属性（只包括当前类的，不包括父类的）
+ (NSArray *)___VARIABLE_productName____currentClassProperties;

/// 获取当前类所有的属性（root = 到哪里为止；例如 A>B>C，A是B和C的子类，B是C的子类，A调用此方法，root传B，将会返回A到B之间的属性，不会返回C的）
/// - Parameter root: class
+ (NSArray *)___VARIABLE_productName____fetchClassProperties:(Class)root;

/// 获取当前对象所有的属性和值
- (NSDictionary *)___VARIABLE_productName____allClassPropertiesAndValues;

/// 获取当前对象所有的属性和值（只包括当前类的，不包括父类的）
- (NSDictionary *)___VARIABLE_productName____currentClassPropertiesAndValues;

/// 获取当前类所有的属性和值（root = 到哪里为止；例如 A>B>C，A是B和C的子类，B是C的子类，A调用此方法，root传B，将会返回A到B之间的属性，不会返回C的）
/// - Parameter root: class
- (NSDictionary *)___VARIABLE_productName____fetchClassPropertiesAndValues:(Class)root;

/// 对象转 JSON 字符
- (NSString *)___VARIABLE_productName____objectToJsonString;

/// 对象转 JSON 字符（无空格和回车）
- (NSString *)___VARIABLE_productName____objectToJsonStringNoSpace;

/// 对象转 字典
- (NSDictionary *)___VARIABLE_productName____objectToDictionary;

@end

@interface NSObject (___VARIABLE_productName___Hook)

/// Hook 替换实例方法
/// - Parameters:
///   - method1: method1 description
///   - method2: method2 description
+ (void)___VARIABLE_productName____exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2;

/// Hook 替换类方法
/// - Parameters:
///   - method1: method1 description
///   - method2: method2 description
+ (void)___VARIABLE_productName____exchangeClassMethod1:(SEL)method1 method2:(SEL)method2;

@end

NS_ASSUME_NONNULL_END
