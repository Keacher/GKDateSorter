# GKDateSorter

GKDateSorter是简单的DateFormatter的封装，可以将NSDate或者指定格式的时间字符串换成任意格式的日期格式。

## Usage
### 为GKDateSorter设定默认要处理的时间字符串的格式
```
// 设置统一的时间处理格式
[GKDateSorter setDefultDateformat:@"yyyy-MM-dd HH:mm:ss"];
```

### 为GKDateSorter设定特定的要处理的时间字符串的格式
```
GKDateSorter *dateSorter = [[GKDateSorter alloc] initWithDateString:@"2017>4<14 12#12#12" dateFormat:@"yyyy>MM<dd HH#mm#ss"];
```

### 获取指定格式的时间字符串
```
GKDateSorter *dateSorter = [[GKDateSorter alloc] initWithDateString:@"2017>4<14 12#12#12" dateFormat:@"yyyy>MM<dd HH#mm#ss"];

// date -> 2017 year 04 month 14 day
[dateSorter getDateStringWithdateFormat:@"yyyy 'year' MM 'month' dd 'day'"];
```
