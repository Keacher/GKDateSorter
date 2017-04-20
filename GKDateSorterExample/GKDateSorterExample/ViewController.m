//
//  ViewController.m
//  GKDateSorterExample
//
//  Created by GaoXueKai on 2017/4/13.
//  Copyright © 2017年 GaoXueKai. All rights reserved.
//

#import "ViewController.h"


#import "GKDateSorter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // 设置统一的时间处理格式
    [GKDateSorter setDefultDateformat:@"yyyy-MM-dd HH:mm:ss"];
    
    GKDateSorter *dateSorter = [[GKDateSorter alloc] initWithDateString:@"2017>4<14 12#12#12" dateFormat:@"yyyy>MM<dd HH#mm#ss"];
    
    
    NSString *string = [dateSorter getDateStringWithdateFormat:@"yyyy 'year' MM 'month' dd 'day'"];
    
    NSLog(@"date -> %@", string);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
