//
//  UINavigationBar+YPExtension.m
//  YPLaboratory
//
//  Created by Hansen on 2023/6/6.
//

#import "UINavigationBar+___VARIABLE_productName___.h"
#import <objc/runtime.h>

static char k___VARIABLE_productName____enableScrollEdgeAppearanceKey;
static char k___VARIABLE_productName____translucentKey;
static char k___VARIABLE_productName____transparentKey;
static char k___VARIABLE_productName____hideBottomLineKey;
static char k___VARIABLE_productName____titleFontKey;
static char k___VARIABLE_productName____titleColorKey;
static char k___VARIABLE_productName____backgroundColorKey;
static char k___VARIABLE_productName____tintColorKey;

@implementation UINavigationBar (___VARIABLE_productName___)

// 重置导航栏
- (void)___VARIABLE_productName____resetConfiguration {
    self.___VARIABLE_productName____enableScrollEdgeAppearance = YES;// default YES
    self.___VARIABLE_productName____translucent = YES;// default YES
    self.___VARIABLE_productName____transparent = NO;// default NO
    self.___VARIABLE_productName____hideBottomLine = NO;// default NO
    self.___VARIABLE_productName____titleFont = [UIFont boldSystemFontOfSize:18.f];
    self.___VARIABLE_productName____titleColor = [UIColor blackColor];
    self.___VARIABLE_productName____backgroundColor = nil;
    self.___VARIABLE_productName____tintColor = [UIColor blueColor];
    
    [self ___VARIABLE_productName____configuration];
}

- (void)___VARIABLE_productName____configuration {
    NSMutableDictionary *titleTextAttributes = [[NSMutableDictionary alloc] init];
    if (self.___VARIABLE_productName____titleFont) {
        [titleTextAttributes setObject:self.___VARIABLE_productName____titleFont forKey:NSFontAttributeName];
    }
    if (self.___VARIABLE_productName____titleColor) {
        [titleTextAttributes setObject:self.___VARIABLE_productName____titleColor forKey:NSForegroundColorAttributeName];
    }
    BOOL translucent = self.___VARIABLE_productName____translucent;
    self.translucent = translucent;
    self.barTintColor = self.___VARIABLE_productName____backgroundColor;
    self.titleTextAttributes = titleTextAttributes;
    
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        if (self.___VARIABLE_productName____transparent) {
            [appearance configureWithTransparentBackground];
        } else {
            [appearance configureWithDefaultBackground];
        }
        appearance.backgroundColor = self.___VARIABLE_productName____backgroundColor;
        appearance.titleTextAttributes = titleTextAttributes;
        if (self.___VARIABLE_productName____hideBottomLine) {
            appearance.shadowImage = [UIImage new];
            appearance.shadowColor = [UIColor clearColor];
        }
        self.standardAppearance = appearance;
        if (self.___VARIABLE_productName____enableScrollEdgeAppearance) {
            self.scrollEdgeAppearance = appearance;
        } else {
            self.scrollEdgeAppearance = nil;
        }
    } else {
        // iOS 13以下的适配代码
        if (self.___VARIABLE_productName____transparent) {
            [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
            [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsCompact];
            [self setShadowImage:[UIImage new]];
        } else {
            // 恢复默认背景图像和阴影图像
            [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
            [self setBackgroundImage:nil forBarMetrics:UIBarMetricsCompact];
            [self setShadowImage:nil];
        }
        self.barTintColor = self.___VARIABLE_productName____backgroundColor;
        self.titleTextAttributes = titleTextAttributes;
    }
}

#pragma mark - getters | setters

- (void)set___VARIABLE_productName____enableScrollEdgeAppearance:(BOOL)___VARIABLE_productName____enableScrollEdgeAppearance {
    NSNumber *value = @(___VARIABLE_productName____enableScrollEdgeAppearance);
    objc_setAssociatedObject(self, &k___VARIABLE_productName____enableScrollEdgeAppearanceKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)___VARIABLE_productName____enableScrollEdgeAppearance {
    NSNumber *value = objc_getAssociatedObject(self, &k___VARIABLE_productName____enableScrollEdgeAppearanceKey);
    return [value boolValue];
}

- (void)set___VARIABLE_productName____translucent:(BOOL)___VARIABLE_productName____translucent {
    NSNumber *value = @(___VARIABLE_productName____translucent);
    objc_setAssociatedObject(self, &k___VARIABLE_productName____translucentKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)___VARIABLE_productName____translucent {
    NSNumber *value = objc_getAssociatedObject(self, &k___VARIABLE_productName____translucentKey);
    return [value boolValue];
}

- (void)set___VARIABLE_productName____transparent:(BOOL)___VARIABLE_productName____transparent {
    NSNumber *value = @(___VARIABLE_productName____transparent);
    objc_setAssociatedObject(self, &k___VARIABLE_productName____transparentKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)___VARIABLE_productName____transparent {
    NSNumber *value = objc_getAssociatedObject(self, &k___VARIABLE_productName____transparentKey);
    return [value boolValue];
}

- (void)set___VARIABLE_productName____hideBottomLine:(BOOL)___VARIABLE_productName____hideBottomLine {
    NSNumber *value = @(___VARIABLE_productName____hideBottomLine);
    objc_setAssociatedObject(self, &k___VARIABLE_productName____hideBottomLineKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)___VARIABLE_productName____hideBottomLine {
    NSNumber *value = objc_getAssociatedObject(self, &k___VARIABLE_productName____hideBottomLineKey);
    return [value boolValue];
}

- (void)set___VARIABLE_productName____titleFont:(UIFont *)___VARIABLE_productName____titleFont {
    objc_setAssociatedObject(self, &k___VARIABLE_productName____titleFontKey, ___VARIABLE_productName____titleFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIFont *)___VARIABLE_productName____titleFont {
    return objc_getAssociatedObject(self, &k___VARIABLE_productName____titleFontKey);
}

- (void)set___VARIABLE_productName____titleColor:(UIColor *)___VARIABLE_productName____titleColor {
    objc_setAssociatedObject(self, &k___VARIABLE_productName____titleColorKey, ___VARIABLE_productName____titleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)___VARIABLE_productName____titleColor {
    return objc_getAssociatedObject(self, &k___VARIABLE_productName____titleColorKey);
}

- (void)set___VARIABLE_productName____backgroundColor:(UIColor *)___VARIABLE_productName____backgroundColor {
    objc_setAssociatedObject(self, &k___VARIABLE_productName____backgroundColorKey, ___VARIABLE_productName____backgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)___VARIABLE_productName____backgroundColor {
    return objc_getAssociatedObject(self, &k___VARIABLE_productName____backgroundColorKey);
}

- (void)set___VARIABLE_productName____tintColor:(UIColor *)___VARIABLE_productName____tintColor {
    objc_setAssociatedObject(self, &k___VARIABLE_productName____tintColorKey, ___VARIABLE_productName____tintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)___VARIABLE_productName____tintColor {
    return objc_getAssociatedObject(self, &k___VARIABLE_productName____tintColorKey);
}

@end
