//
//  NSObject+HAHA.m
//  YPPrompts
//
//  Created by Hansen on 2023/5/9.
//

#import "NSDate+___VARIABLE_productName___.h"

@implementation NSDate (___VARIABLE_productName___)

/// 当前时间NSDateComponents （year、month、day...）
- (NSDateComponents *)___VARIABLE_productName____DateComponents {
    NSDate *currentDate = [self copy];
    NSCalendar *calendar = [NSCalendar currentCalendar];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
//    NSCalendarUnitEra                = kCFCalendarUnitEra,
//    NSCalendarUnitYear               = kCFCalendarUnitYear,
//    NSCalendarUnitMonth              = kCFCalendarUnitMonth,
//    NSCalendarUnitDay                = kCFCalendarUnitDay,
//    NSCalendarUnitHour               = kCFCalendarUnitHour,
//    NSCalendarUnitMinute             = kCFCalendarUnitMinute,
//    NSCalendarUnitSecond             = kCFCalendarUnitSecond,
//    NSCalendarUnitWeekday            = kCFCalendarUnitWeekday,
//    NSCalendarUnitWeekdayOrdinal     = kCFCalendarUnitWeekdayOrdinal,
    NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:currentDate]; // Get necessary date components
#pragma clang diagnostic pop
    return components;
}

/// 当前日前往前一天的时间
- (NSDate *)___VARIABLE_productName____Yesterday {
    NSTimeInterval time = [self timeIntervalSinceReferenceDate];
    NSTimeInterval oneDayTime = 3600 * 24;
    time -= oneDayTime;
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:time];
    return date;
}

/// 当前日前往后一天的时间
- (NSDate *)___VARIABLE_productName____Tomorrow {
    NSTimeInterval time = [self timeIntervalSinceReferenceDate];
    NSTimeInterval oneDayTime = 3600 * 24;
    time += oneDayTime;
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:time];
    return date;
}

/// 当前时刻与指定的时刻是否在同一天
/// @param date 指定的时刻
- (BOOL)___VARIABLE_productName____IsSameDayWithDate:(NSDate *)date {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? NSCalendarIdentifierGregorian : NSGregorianCalendar)];
#pragma clang diagnostic pop
    NSDateComponents *comps1 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    NSDateComponents *comps2 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    BOOL is = comps1.year == comps2.year && comps1.month == comps2.month && comps1.day == comps2.day;
    return is;
}

/// 返回(dateFormat)日期字符串
/// @param dateFormat 日期的显示格式，如YYYY-MM-dd HH:mm:ss
- (NSString *)___VARIABLE_productName____StringWithDateFormat:(NSString *)dateFormat {
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = dateFormat;
    NSString *string = [f stringFromDate:self];
    return string;
}

/// 根据字符串中实例出日期
/// @param dateString 字符串，如1999-9-10
/// @param dateFormat 日期字符串的格式
+ (NSDate *)___VARIABLE_productName____DateWithString:(NSString *)dateString dateFormat:(NSString *)dateFormat {
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = dateFormat;
    NSDate *date = [f dateFromString:dateString];
    return date;
}


@end
