//
//  ViewController.h
//  baby
//
//  Created by 青云-wjl on 15/11/4.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iflyMSC/IFlySpeechConstant.h"
#import "iflyMSC/IFlyRecognizerViewDelegate.h"
#import "iflyMSC/IFlyRecognizerView.h"
@interface QYFirstViewController : UIViewController<IFlyRecognizerViewDelegate>
{
    IFlyRecognizerView *iflyRecognizerView;
}


@end

