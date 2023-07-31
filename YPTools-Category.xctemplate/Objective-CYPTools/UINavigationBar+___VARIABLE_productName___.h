//
//  UINavigationBar+YPExtension.h
//  YPLaboratory
//
//  Created by Hansen on 2023/6/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (___VARIABLE_productName___)

@property (nonatomic, assign) BOOL ___VARIABLE_productName____enableScrollEdgeAppearance;// 导航外观是否根据滚动边缘变化 default YES
@property (nonatomic, assign) BOOL ___VARIABLE_productName____translucent;// 是否半透明 default YES
@property (nonatomic, assign) BOOL ___VARIABLE_productName____transparent;// 是否全透明
@property (nonatomic, assign) BOOL ___VARIABLE_productName____hideBottomLine;// 是否隐藏底部线条
@property (nonatomic, strong) UIFont *___VARIABLE_productName____titleFont;// 设置标题字体大小
@property (nonatomic, strong) UIColor *___VARIABLE_productName____titleColor;// 设置标题字体颜色
@property (nonatomic, strong) UIColor *___VARIABLE_productName____backgroundColor;// 导航栏背景颜色
@property (nonatomic, strong) UIColor *___VARIABLE_productName____tintColor;// 导航栏主题色

/// 重置导航栏
- (void)___VARIABLE_productName____resetConfiguration;

/// 修改配置之后需要调用次方法才会修改
- (void)___VARIABLE_productName____configuration;

@end

NS_ASSUME_NONNULL_END

