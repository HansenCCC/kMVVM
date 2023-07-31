//
//  NSObject+HAHA.h
//  YPPrompts
//
//  Created by Hansen on 2023/5/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (___VARIABLE_productName___)

/// 是否是有效手机号
- (BOOL)___VARIABLE_productName____isValidPhone;

/// 是否是有效URL
- (BOOL)___VARIABLE_productName____isValidURL;

/// 拼接字符串
/// @param string 拼接字符
- (NSString *)___VARIABLE_productName____addString:(NSString *)string;

/// 通过字符字体获取现在试图的宽度
/// @param font font大小
/// @param maxSize 允许最大尺寸
- (CGSize)___VARIABLE_productName____sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/// 提取两字符之间的值
/// @param startString 头字符
/// @param endString 尾字符
- (NSArray <NSString *>*)___VARIABLE_productName____substringWithStart:(NSString *)startString end:(NSString *)endString;

/// 返回url
- (NSURL *)___VARIABLE_productName____toURL;

/// 国际化
- (NSString *)___VARIABLE_productName____localizedString;

/// json字符转字典
- (NSDictionary *)___VARIABLE_productName____jsonStringToDictionary;

@end


@interface NSString (___VARIABLE_productName____MD5)

/// 返回string类型md5
- (NSString *)___VARIABLE_productName____md5;

// 返回data类型md5
- (NSData *)___VARIABLE_productName____md5Bytes;

@end

NS_ASSUME_NONNULL_END
