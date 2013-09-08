//
//  CreateAlarmViewController.h
//  XiaoMIAlarm
//
//  Created by 帅牛 on 13-6-11.
//  Copyright (c) 2013年 郑 杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utility.h"


@protocol createAlarmDelegate;

@interface CreateAlarmViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{

    NSDate * _date;
    Utility * _utility;
}

@property (strong, nonatomic) id<createAlarmDelegate> delegate;

- (IBAction)datePickerChanged:(id)sender;
- (IBAction)backButton:(id)sender;
- (IBAction)addButton:(id)sender;

@end


@protocol createAlarmDelegate <NSObject>

@required

- (void)addAlarmWithInfo:(NSString *) info Date:(NSDate *)date;

@end