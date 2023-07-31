//
//  NSObject+HAHA.m
//  YPPrompts
//
//  Created by Hansen on 2023/5/9.
//

#import "UIView+___VARIABLE_productName___.h"

@implementation UIView (___VARIABLE_productName___)

/// 获取view垂直位置最底部的subview
- (UIView *)___VARIABLE_productName____horizontalBottomView {
    UIView *view = nil;
    for (UIView *subview in self.subviews) {
        if (CGRectGetMaxY(subview.frame) > CGRectGetMaxY(view.frame)) {
            view = subview;
        };
    }
    return view;
}

/// 获取view水平位置最右部的subview
- (UIView *)___VARIABLE_productName____verticalRightView {
    UIView *view = nil;
    for (UIView *subview in self.subviews) {
        if (CGRectGetMaxX(subview.frame) > CGRectGetMaxX(view.frame)) {
            view = subview;
        };
    }
    return view;
}

/// 找出当前视图subviews中所有是 class（UIView）类
/// @param aClass 类
- (NSArray <UIView *>*)___VARIABLE_productName____searchAllSubviewsForClass:(Class)aClass {
    NSMutableArray *views = [[NSMutableArray alloc] init];
    for (UIView *v in self.subviews) {
        if ([v isKindOfClass:aClass]) {
            [views addObject:v];
        }
        [views addObjectsFromArray:[v ___VARIABLE_productName____searchAllSubviewsForClass:aClass]];
    }
    return views.count>0?views:nil;
}

/// 返回视图的截屏图片
/// @param scale 比例
- (UIImage *)___VARIABLE_productName____screenshotsImageWithScale:(CGFloat)scale {
    CGRect bounds = self.bounds;
    UIGraphicsBeginImageContextWithOptions(bounds.size, NO, scale);
    //    UIGraphicsBeginImageContext(bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)___VARIABLE_productName____screenshotsImage {
    UIImage *image = [self ___VARIABLE_productName____screenshotsImageWithScale:0.0];
    return image;
}

@end

@implementation UIView (___VARIABLE_productName____CornerRadius)

/// 快速绘制圆角
/// @param corners 例如顶部圆角=UIRectCornerTopLeft  | UIRectCornerTopRight 顶部圆角
/// @param radius 大小
- (void)___VARIABLE_productName____viewRoundingCorners:(UIRectCorner)corners radius:(CGFloat)radius {
    [self layoutIfNeeded];
    CGSize cornerSize = CGSizeMake(radius, radius);
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:cornerSize];
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.frame = self.bounds;
    borderLayer.path = maskPath.CGPath;
    self.layer.mask = borderLayer;
}

@end
