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

@property (weak, nonatomic) IBOutlet UIButton *generButton;

@property (weak, nonatomic) IBOutlet UITextField *inputFormatTextField;

@property (weak, nonatomic) IBOutlet UITextField *inputDataTextField;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

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

- (IBAction)generate:(UIButton *)sender {
    
    NSDate *current = [NSDate date];
    
    GKDateSorter *dateSorter = [[GKDateSorter alloc] initWithDate:current];
    
    NSString *result = [dateSorter getDateStringWithdateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
//    self.resultLabel.text = result;
    [self showResult:result];
}


- (IBAction)update:(UIButton *)sender {
    
    if ([self checkStringNull:self.inputFormatTextField.text]) {
        [self alertNote:@"请输入要解析的日期格式"];
    }
    
    if ([self checkStringNull:self.inputDataTextField.text]) {
        [self alertNote:@"请输入要解析的数据"];
    }
    
    NSString *inputFormat = self.inputFormatTextField.text;
    NSString *inputData = self.inputDataTextField.text;
    
    GKDateSorter *dateSorter = [[GKDateSorter alloc] initWithDateString:inputData dateFormat:inputFormat];
    
    NSString *result = [dateSorter getDateStringWithdateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    [self showResult:result];
}

- (void)showResult:(NSString *)result {
    self.resultLabel.text = result;
}

- (BOOL)checkStringNull:(NSString *)string {
    if ([string isEqualToString:@""] || string == nil) {
        return YES;
    }
    return NO;
}

- (void)alertNote:(NSString *)note {
    NSString *noteString = note;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:noteString preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
