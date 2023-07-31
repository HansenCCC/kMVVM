//
//  NSObject+HAHA.h
//  YPPrompts
//
//  Created by Hansen on 2023/5/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (___VARIABLE_productName___)

/// 十六进制转化为color对象 例如: #FFFFFF
/// @param hexString 十六进制字符
+ (UIColor *)___VARIABLE_productName____colorWithHexString:(NSString *)hexString;

/// 十六进制转化为color对象 例如: #FFFFFF
/// @param hexString 十六进制字符
/// @param alpha alpha
+ (UIColor *)___VARIABLE_productName____colorWithHexString:(NSString *)hexString withAlpha:(CGFloat)alpha;

/// 通过把color对象颜色转化为十六进制
/// @param color uicollor
+ (NSString *)___VARIABLE_productName____hexStringFromColor:(UIColor *)color;

+ (UIColor *)___VARIABLE_productName____randomColor;
+ (UIColor *)___VARIABLE_productName____blackColor;
+ (UIColor *)___VARIABLE_productName____darkColor;
+ (UIColor *)___VARIABLE_productName____grayColor;
+ (UIColor *)___VARIABLE_productName____gray2Color;
+ (UIColor *)___VARIABLE_productName____gray3Color;
+ (UIColor *)___VARIABLE_productName____gray4Color;
+ (UIColor *)___VARIABLE_productName____gray5Color;
+ (UIColor *)___VARIABLE_productName____gray6Color;
+ (UIColor *)___VARIABLE_productName____redColor;
+ (UIColor *)___VARIABLE_productName____orangeColor;
+ (UIColor *)___VARIABLE_productName____yellowColor;
+ (UIColor *)___VARIABLE_productName____blueColor;
+ (UIColor *)___VARIABLE_productName____pinkColor;
+ (UIColor *)___VARIABLE_productName____linkColor;
+ (UIColor *)___VARIABLE_productName____whiteColor;
+ (NSArray *)___VARIABLE_productName____allColors;

/// 设置颜色透明度
/// @param alpha alpha
- (UIColor *)___VARIABLE_productName____alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
