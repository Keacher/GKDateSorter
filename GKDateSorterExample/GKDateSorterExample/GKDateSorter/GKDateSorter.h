//
//  GKDateSorter.h
//  GKDateDemo
//
//  Created by Apple on 16/3/23.
//  Copyright © 2016年 zhishuit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKDateSorter : NSObject

+ (Class)appearance;

/**
 设置默认的NSDateFormatter所用的格式

 @param dateformat yyyy MM dd HH:mm:ss
 */
+ (void)setDefultDateformat:(NSString *)dateformat;


/**
 参数为需要处理的日期字符串，形如 2016/3/23 (默认格式)
 
 @param dateString 日期格式默认为@"yyyy/MM/dd HH:mm:ss"
 @return GKDateSorter Instence
 */
- (instancetype)initWithDateString:(NSString *)dateString;
- (instancetype)initWithDateString:(NSString *)dateString dateFormat:(NSString *)dateFormat;

/**
 *  参数为需要处理的NSDate
 *
 *  @param date NSDate类型
 *
 *  @return GKDateSorter Instence
 */
- (instancetype)initWithDate:(NSDate *)date;
- (instancetype)initWithDate:(NSDate *)date dateFormat:(NSString *)dateFormat;

- (instancetype)initWithSecendTimestampForm1970:(NSTimeInterval)timeinterval;

- (NSDate *)getDate;

- (NSString *)getyyyyMMddDateString;
- (NSString *)getDateStringWithdateFormat:(NSString *)dateFormat;

- (NSString *)getYear;
- (NSString *)getMonth;
- (NSString *)getDay;
- (NSString *)getHour;
- (NSString *)getMinute;
- (NSString *)getSecond;

/**
 获取周几的数据
 
 @param prefix 星期数据前面的前缀，举例：填“星期”，返回的就是“星期一”，“星期二”等等
 @return 周几的数据
 */
- (NSString *)getWeekDayWithPrefix:(NSString *)prefix;

/**
 获取“星期一”格式的周数据
 
 @return “星期一”格式的周数据
 */
- (NSString *)getWeekDay_XingQi;

/**
 获取“周一”格式的周数据
 
 @return “周一”格式的周数据
 */
- (NSString *)getWeekDay_Zhou;

+ (NSString *)monthlyStringWithMonth:(NSString *)month;

- (NSDate *)dateFromDateString:(NSString *)dateString;
- (NSString *)dateStringFromDate:(NSDate *)date;

- (BOOL)isTheSameDayWithDateSorter:(GKDateSorter *)dateSorter;
@end


@interface GKDateSorter (ServerTime)


@end

