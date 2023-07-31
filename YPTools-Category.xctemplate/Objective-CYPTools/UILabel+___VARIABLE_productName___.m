//
//  NSObject+HAHA.m
//  YPPrompts
//
//  Created by Hansen on 2023/5/9.
//

#import "UILabel+___VARIABLE_productName___.h"

@implementation UILabel (___VARIABLE_productName___)

/// 快速初始化
/// @param font font
/// @param textColor color
+ (instancetype)___VARIABLE_productName____labelWithFont:(UIFont *)font textColor:(UIColor *)textColor {
    UILabel *label = [[UILabel alloc] init];
    if (font) {
        label.font = font;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    return label;
}

@end
