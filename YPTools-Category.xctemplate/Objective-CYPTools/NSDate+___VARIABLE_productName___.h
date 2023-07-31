//
//  NSObject+HAHA.h
//  YPPrompts
//
//  Created by Hansen on 2023/5/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (___VARIABLE_productName___)

/// 当前时间NSDateComponents （year、month、day...）
- (NSDateComponents *)___VARIABLE_productName____DateComponents;

/// 当前日前往前一天的时间
- (NSDate *)___VARIABLE_productName____Yesterday;

/// 当前日前往后一天的时间
- (NSDate *)___VARIABLE_productName____Tomorrow;

/// 当前时刻与指定的时刻是否在同一天
/// @param date 指定的时刻
- (BOOL)___VARIABLE_productName____IsSameDayWithDate:(NSDate *)date;

/// 返回(dateFormat)日期字符串
/// @param dateFormat 日期的显示格式，如YYYY-MM-dd HH:mm:ss
- (NSString *)___VARIABLE_productName____StringWithDateFormat:(NSString *)dateFormat;

/// 根据字符串中实例出日期
/// @param dateString 字符串，如1999-9-10
/// @param dateFormat 日期字符串的格式
+ (NSDate *)___VARIABLE_productName____DateWithString:(NSString *)dateString dateFormat:(NSString *)dateFormat;

@end

NS_ASSUME_NONNULL_END
