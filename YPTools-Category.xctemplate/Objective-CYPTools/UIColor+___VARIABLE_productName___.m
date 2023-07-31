//
//  NSObject+HAHA.m
//  YPPrompts
//
//  Created by Hansen on 2023/5/9.
//

#import "UIColor+___VARIABLE_productName___.h"

@implementation UIColor (___VARIABLE_productName___)

/// 十六进制转化为图片 例如: #FFFFFF
/// @param hexString 十六进制字符
+ (UIColor *)___VARIABLE_productName____colorWithHexString:(NSString *)hexString {
    return [self ___VARIABLE_productName____colorWithHexString:hexString withAlpha:1.0f];
}

+ (UIColor *)___VARIABLE_productName____colorWithHexString:(NSString *)hexString withAlpha:(CGFloat)alpha {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#"withString:@""] uppercaseString];
    CGFloat red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = alpha;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = 16 - [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = alpha;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            return [UIColor clearColor];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

/// 随机颜色
+ (UIColor *)___VARIABLE_productName____randomColor {
    UIColor *color = [UIColor colorWithRed:rand()%255/255.0 green:rand()%255/255.0 blue:rand()%255/255.0 alpha:1];
    return color;
}

/// 通过把color对象颜色转化为十六进制
/// @param color uicollor
+ (NSString *)___VARIABLE_productName____hexStringFromColor:(UIColor *)color {
    //http://blog.sina.com.cn/s/blog_a5b73bad0102x01x.html
    if (color == nil) {
        return nil;
    }
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"#FFFFFF"];
    }
    NSString *r,*g,*b;
    (int)((CGColorGetComponents(color.CGColor))[0]*255.0) == 0?(r = [NSString stringWithFormat:@"0%x",(int)((CGColorGetComponents(color.CGColor))[0]*255.0)]):(r = [NSString stringWithFormat:@"%x",(int)((CGColorGetComponents(color.CGColor))[0]*255.0)]);
    (int)((CGColorGetComponents(color.CGColor))[1]*255.0) == 0?(g = [NSString stringWithFormat:@"0%x",(int)((CGColorGetComponents(color.CGColor))[1]*255.0)]):(g = [NSString stringWithFormat:@"%x",(int)((CGColorGetComponents(color.CGColor))[1]*255.0)]);
    (int)((CGColorGetComponents(color.CGColor))[2]*255.0) == 0?(b = [NSString stringWithFormat:@"0%x",(int)((CGColorGetComponents(color.CGColor))[2]*255.0)]):(b = [NSString stringWithFormat:@"%x",(int)((CGColorGetComponents(color.CGColor))[2]*255.0)]);
    return [NSString stringWithFormat:@"#%@%@%@",r,g,b];
}

+ (CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length {
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt:&hexComponent];
    return hexComponent / 255.0;
}

+ (UIColor *)___VARIABLE_productName____blackColor {
    static UIColor *color;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        color = [UIColor ___VARIABLE_productName____colorWithHexString:@"#000000"];
    });
    return color;
}

+ (UIColor *)___VARIABLE_productName____darkColor {
    static UIColor *color;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        color = [UIColor ___VARIABLE_productName____colorWithHexString:@"#262a30"];
    });
    return color;
}

+ (UIColor *)___VARIABLE_productName____grayColor {
    static UIColor *color;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        color = [UIColor ___VARIABLE_productName____colorWithHexString:@"#8e8e93"];
    });
    return color;
}

+ (UIColor *)___VARIABLE_productName____gray2Color {
    static UIColor *color;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        color = [UIColor ___VARIABLE_productName____colorWithHexString:@"#aeaeb2"];
    });
    return color;
}

+ (UIColor *)___VARIABLE_productName____gray3Color {
    static UIColor *color;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        color = [UIColor ___VARIABLE_productName____colorWithHexString:@"#c7c7cc"];
    });
    return color;
}

+ (UIColor *)___VARIABLE_productName____gray4Color {
    static UIColor *color;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        color = [UIColor ___VARIABLE_productName____colorWithHexString:@"#d1d1d6"];
    });
    return color;
}

+ (UIColor *)___VARIABLE_productName____gray5Color {
    static UIColor *color;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        color = [UIColor ___VARIABLE_productName____colorWithHexString:@"#e5e5ea"];
    });
    return color;
}

+ (UIColor *)___VARIABLE_productName____gray6Color {
    static UIColor *color;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        color = [UIColor ___VARIABLE_productName____colorWithHexString:@"#f2f2f7"];
    });
    return color;
}

+ (UIColor *)___VARIABLE_productName____redColor {
    static UIColor *color;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        color = [UIColor ___VARIABLE_productName____colorWithHexString:@"#ff3b30"];
    });
    return color;
}

+ (UIColor *)___VARIABLE_productName____orangeColor {
    static UIColor *color;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        color = [UIColor ___VARIABLE_productName____colorWithHexString:@"#ff9500"];
    });
    return color;
}

+ (UIColor *)___VARIABLE_productName____yellowColor {
    static UIColor *color;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        color = [UIColor ___VARIABLE_productName____colorWithHexString:@"#ffcc00"];
    });
    return color;
}

+ (UIColor *)___VARIABLE_productName____blueColor {
    static UIColor *color;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        color = [UIColor ___VARIABLE_productName____colorWithHexString:@"#007aff"];
    });
    return color;
}

+ (UIColor *)___VARIABLE_productName____pinkColor {
    static UIColor *color;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        color = [UIColor ___VARIABLE_productName____colorWithHexString:@"#ff2d55"];
    });
    return color;
}

+ (UIColor *)___VARIABLE_productName____linkColor {
    static UIColor *color;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        color = [UIColor ___VARIABLE_productName____colorWithHexString:@"#007aff"];
    });
    return color;
}

+ (UIColor *)___VARIABLE_productName____whiteColor {
    static UIColor *color;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        color = [UIColor ___VARIABLE_productName____colorWithHexString:@"#ffffff"];
    });
    return color;
}

+ (NSArray <NSString *>*)___VARIABLE_productName____allColors {
    static NSArray *colors;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        colors = @[
            [UIColor ___VARIABLE_productName____hexStringFromColor:[UIColor blackColor]],
            [UIColor ___VARIABLE_productName____hexStringFromColor:[UIColor darkGrayColor]],
            [UIColor ___VARIABLE_productName____hexStringFromColor:[UIColor lightGrayColor]],
            [UIColor ___VARIABLE_productName____hexStringFromColor:[UIColor whiteColor]],
            [UIColor ___VARIABLE_productName____hexStringFromColor:[UIColor grayColor]],
            [UIColor ___VARIABLE_productName____hexStringFromColor:[UIColor redColor]],
            [UIColor ___VARIABLE_productName____hexStringFromColor:[UIColor greenColor]],
            [UIColor ___VARIABLE_productName____hexStringFromColor:[UIColor blueColor]],
            [UIColor ___VARIABLE_productName____hexStringFromColor:[UIColor cyanColor]],
            [UIColor ___VARIABLE_productName____hexStringFromColor:[UIColor yellowColor]],
            [UIColor ___VARIABLE_productName____hexStringFromColor:[UIColor magentaColor]],
            [UIColor ___VARIABLE_productName____hexStringFromColor:[UIColor orangeColor]],
            [UIColor ___VARIABLE_productName____hexStringFromColor:[UIColor purpleColor]],
            [UIColor ___VARIABLE_productName____hexStringFromColor:[UIColor brownColor]],
            [UIColor ___VARIABLE_productName____hexStringFromColor:[UIColor purpleColor]],
        ];
    });
    return colors;
}


- (UIColor *)___VARIABLE_productName____alpha:(CGFloat)alpha {
    UIColor *color = [self copy];
    NSString *hexStr = [UIColor ___VARIABLE_productName____hexStringFromColor:color];
    return [UIColor ___VARIABLE_productName____colorWithHexString:hexStr withAlpha:alpha];
}

@end
