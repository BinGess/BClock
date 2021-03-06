//
//  CenterClockViewController.h
//  BClock
//
//  Created by 白 斌 on 13-8-31.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClockView.h"
#import "AlarmDataController.h"
#import "Alarm.h"
#import "MMDrawerVisualState.h"

#import "MMDrawerController.h"

#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"




#import <QuartzCore/QuartzCore.h>

@interface CenterClockViewController : UIViewController
{
    AlarmDataController * _alrmDataController;
    NSDateComponents *component;


}

@property (nonatomic, retain) ClockView *clockView;

@property (strong, nonatomic) IBOutlet UILabel *hourLabel;
@property (strong, nonatomic) IBOutlet UILabel *minLabel;


@end
