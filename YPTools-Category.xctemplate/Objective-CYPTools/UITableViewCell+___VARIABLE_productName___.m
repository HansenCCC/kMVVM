//
//  NSObject+HAHA.m
//  YPPrompts
//
//  Created by Hansen on 2023/5/9.
//

#import "UITableViewCell+___VARIABLE_productName___.h"

@implementation UITableViewCell (___VARIABLE_productName___)

/// 刷新当前试图
- (void)___VARIABLE_productName____reloadCurrentTableViewCell {
    UITableView *tableView = (UITableView *)self.superview;
    if ([tableView isKindOfClass:[UITableView class]]) {
        NSIndexPath *indexPath = [tableView indexPathForCell:self];
        if (indexPath) {
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }
    }
}

@end
