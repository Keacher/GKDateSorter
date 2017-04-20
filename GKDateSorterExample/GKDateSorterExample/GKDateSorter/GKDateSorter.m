//
//  GKDateSorter.m
//  GKDateDemo
//
//  Created by Apple on 16/3/23.
//  Copyright © 2016年 zhishuit. All rights reserved.
//

#import "GKDateSorter.h"

@interface GKDateSorter ()

@property (nonatomic) NSDateFormatter *dateFormatter;

@property (nonatomic) NSDate *currentDate;
@property (nonatomic, copy) NSString *currentDateString;
@end

static NSString *DefultDataFormat = @"yyyy/MM/dd HH:mm:ss";

@implementation GKDateSorter

+ (Class)appearance {
    return [self class];
}
+ (void)setDefultDateformat:(NSString *)dateformat {
    //以后这里要写正则验证是否是正确的日期格式
    DefultDataFormat = dateformat;
}

#pragma mark 构造方法
- (instancetype)initWithDateString:(NSString *)dateString {
    self = [super init];
    if (self) {
        _currentDateString = dateString;
        
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setLocale:[NSLocale systemLocale]];
        
        _currentDate = [self dateFromDateString:dateString];
    }
    return self;
}

- (instancetype)initWithDateString:(NSString *)dateString dateFormat:(NSString *)dateFormat
{
    self = [super init];
    if (self) {
        
        _currentDateString = dateString;
        
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setLocale:[NSLocale systemLocale]];
        
        _currentDate = [self dateFromDateString:dateString dateFormat:dateFormat];
    }
    return self;
}

- (instancetype)initWithDate:(NSDate *)date {
    self = [super init];
    if (self) {
        _currentDate = date;
        
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setLocale:[NSLocale systemLocale]];
        
        _currentDateString = [self dateStringFromDate:date];
    }
    return self;
}

- (instancetype)initWithDate:(NSDate *)date dateFormat:(NSString *)dateFormat {
    self = [super init];
    if (self) {
        _currentDate = date;
        
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setLocale:[NSLocale systemLocale]];
        
        _currentDateString = [self dateStringFromDate:date dateFormat:dateFormat];
    }
    return self;
}

- (instancetype)initWithSecendTimestampForm1970:(NSTimeInterval)timeinterval {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeinterval];
    return [[[self class] alloc] initWithDate:date];
}

#pragma mark 对象方法
- (NSDate *)getDate {
    return self.currentDate;
}
- (NSString *)getyyyyMMddDateString {
    return [self stringFormDateWithDateFormat:@"yyyy/MM/dd"];
}
- (NSString *)getDateStringWithdateFormat:(NSString *)dateFormat {
    return [self stringFormDateWithDateFormat:dateFormat];
}

- (BOOL)isTheSameDayWithDateSorter:(GKDateSorter *)dateSorter {
    if ([[self getDay] isEqualToString:[dateSorter getDay]]) {
        if ([[self getMonth] isEqualToString:[dateSorter getMonth]]) {
            if ([[self getYear] isEqualToString:[dateSorter getYear]] ) {
                return YES;
            }
        }
    }
    return NO;
}

- (NSString *)getWeekDayWithPrefix:(NSString *)prefix {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    now = self.currentDate;
    comps = [calendar components:unitFlags fromDate:now];
    NSInteger weekday = [comps weekday];
    NSString *weekdayString = @"";
    switch (weekday) {
        case 1:
            //            weekdayString = @"星期天";
            weekdayString = [NSString stringWithFormat:@"%@日",prefix];
            break;
        case 2:
            //            weekdayString = @"星期一";
            weekdayString = [NSString stringWithFormat:@"%@一",prefix];
            break;
        case 3:
            //            weekdayString = @"星期二";
            weekdayString = [NSString stringWithFormat:@"%@二",prefix];
            break;
        case 4:
            //            weekdayString = @"星期三";
            weekdayString = [NSString stringWithFormat:@"%@三",prefix];
            break;
        case 5:
            //            weekdayString = @"星期四";
            weekdayString = [NSString stringWithFormat:@"%@四",prefix];
            break;
        case 6:
            //            weekdayString = @"星期五";
            weekdayString = [NSString stringWithFormat:@"%@五",prefix];
            break;
        case 7:
            //            weekdayString = @"星期六";
            weekdayString = [NSString stringWithFormat:@"%@六",prefix];
            break;
        default:
            
            break;
    }
    return weekdayString;
}
- (NSString *)getWeekDay_XingQi {
    return [self getWeekDayWithPrefix:@"星期"];
}
- (NSString *)getWeekDay_Zhou {
    return [self getWeekDayWithPrefix:@"周"];
}

- (NSString *)getYear {
    return [self stringFormDateWithDateFormat:@"yyyy"];
}

- (NSString *)getMonth {
    return [self stringFormDateWithDateFormat:@"MM"];
}

- (NSString *)getDay {
    return [self stringFormDateWithDateFormat:@"dd"];
}

- (NSString *)getHour {
    return [self stringFormDateWithDateFormat:@"HH"];
}

- (NSString *)getMinute {
    return [self stringFormDateWithDateFormat:@"mm"];
}
- (NSString *)getSecond {
    return [self stringFormDateWithDateFormat:@"ss"];
}

+ (NSString *)monthlyStringWithMonth:(NSString *)month {
    NSInteger monthValue = [month integerValue];
    NSString *monthlyString = @"";
    switch (monthValue) {
        case 1:
            monthlyString = @"一月";
            break;
        case 2:
            monthlyString = @"二月";
            break;
        case 3:
            monthlyString = @"三月";
            break;
        case 4:
            monthlyString = @"四月";
            break;
        case 5:
            monthlyString = @"五月";
            break;
        case 6:
            monthlyString = @"六月";
            break;
        case 7:
            monthlyString = @"七月";
            break;
        case 8:
            monthlyString = @"八月";
            break;
        case 9:
            monthlyString = @"九月";
            break;
        case 10:
            monthlyString = @"十月";
            break;
        case 11:
            monthlyString = @"十一月";
            break;
        case 12:
            monthlyString = @"十二月";
            break;
        default:
            break;
    }
    
    return monthlyString;
}
#pragma mark - helper method

- (NSDate *)dateFromDateString:(NSString *)dateString {

    return [self dateFromDateString:dateString dateFormat:DefultDataFormat];
}

- (NSString *)dateStringFromDate:(NSDate *)date {

    return [self dateStringFromDate:date dateFormat:DefultDataFormat];
}

- (NSDate *)dateFromDateString:(NSString *)dateString dateFormat:(NSString *)dateFormat {
    
    [self.dateFormatter setDateFormat:dateFormat];
    NSDate *date = [self.dateFormatter dateFromString:dateString];
    return date;
}

- (NSString *)dateStringFromDate:(NSDate *)date dateFormat:(NSString *)dateFormat {
    
    [self.dateFormatter setDateFormat:dateFormat];
    NSString *dateString = [self.dateFormatter stringFromDate:date];
    return dateString;
}

- (NSString *)stringFormDateWithDateFormat:(NSString *)dateFormat {
    
    if (!self.currentDate) {
        return @"";
    }
    [self.dateFormatter setDateFormat:dateFormat];
    NSString *resultString = [self.dateFormatter stringFromDate:self.currentDate];
    return resultString;
}

@end

// 使用longlong防止32位机器上溢出
// 缓存本地时间与服务器时间的时间差，以便校准时间
static long long timeIntevalDifference = 0;

@implementation GKDateSorter (ServerTime)

- (void)updateServerTime:(long long)timestamp {
    NSTimeInterval timeInteval = timestamp / 1000.0 - [[NSDate date] timeIntervalSince1970];
    timeIntevalDifference = timeInteval;
}


+ (NSDate*)currentTime {
    NSDate* serverDate = [NSDate dateWithTimeIntervalSinceNow:timeIntevalDifference];
    return serverDate;
}

// 以毫秒为单位
+ (long long)currentTimeStamp {
    NSTimeInterval localTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval timeDifference = timeIntevalDifference;
    
    return (long long)((localTime + timeDifference) * 1000);
}

@end




