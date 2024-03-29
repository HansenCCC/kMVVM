//
//  NSObject+HAHA.m
//  YPPrompts
//
//  Created by Hansen on 2023/5/9.
//

#import "UIViewController+___VARIABLE_productName___.h"

@implementation UIViewController (___VARIABLE_productName___)

/// 当前显示的控制器
+ (UIViewController *)___VARIABLE_productName____topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}


@end
