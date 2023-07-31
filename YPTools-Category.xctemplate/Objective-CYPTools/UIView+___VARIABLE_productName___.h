//
//  NSObject+HAHA.h
//  YPPrompts
//
//  Created by Hansen on 2023/5/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (___VARIABLE_productName___)

/// 获取view垂直位置最底部的subview
- (UIView *)___VARIABLE_productName____horizontalBottomView;

/// 获取view水平位置最右部的subview
- (UIView *)___VARIABLE_productName____verticalRightView;

/// 找出当前视图subviews中所有是 class（UIView）类
/// @param aClass 类
- (NSArray <UIView *>*)___VARIABLE_productName____searchAllSubviewsForClass:(Class)aClass;

/// 返回视图的截屏图片
/// @param scale 比例
- (UIImage *)___VARIABLE_productName____screenshotsImageWithScale:(CGFloat)scale;
- (UIImage *)___VARIABLE_productName____screenshotsImage;

@end

@interface UIView (___VARIABLE_productName____CornerRadius)

/// 快速绘制圆角
/// @param corners 例如顶部圆角=UIRectCornerTopLeft  | UIRectCornerTopRight 顶部圆角
/// @param radius 大小
- (void)___VARIABLE_productName____viewRoundingCorners:(UIRectCorner)corners radius:(CGFloat)radius;

@end


NS_ASSUME_NONNULL_END
