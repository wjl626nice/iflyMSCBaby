//
//  ViewController.m
//  baby
//
//  Created by 青云-wjl on 15/11/4.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYFirstViewController.h"
#import "ISRDataHelper.h"
@interface QYFirstViewController ()
{
    NSString *resultStr;
}
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation QYFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    resultStr = @"";
    
    iflyRecognizerView = [[IFlyRecognizerView alloc] initWithCenter:self.view.center];
    iflyRecognizerView.delegate = self;
    
    //[iflyRecognizerView setParameter:@"iat" forKey:[IFlySpeechConstant IFLY_DOMAIN]];

    [iflyRecognizerView setParameter:@"0" forKey:[IFlySpeechConstant ASR_PTT]];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)start:(UIButton *)sender {
    [iflyRecognizerView start];
}

-(void)onResult:(NSArray *)resultArray isLast:(BOOL)isLast
{
    NSMutableString *resultString = [[NSMutableString alloc] init];
    NSDictionary *dic = resultArray[0];
    for (NSString *key in dic) {
        [resultString appendFormat:@"%@",key];
    }
    
    NSString * resultFromJson =  [ISRDataHelper stringFromJson:resultString];
    resultStr = [NSString stringWithFormat:@"%@%@", resultStr,resultFromJson];
    
    
    _label.text = resultStr;
}

-(void)onError:(IFlySpeechError *)error
{
    NSLog(@"%@",error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
