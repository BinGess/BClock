//
//  CreateAlarmViewController.h
//  BAlarm
//
//  Created by Blake on 13-6-11.
//  Copyright (c) 2013年 Blake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utility.h"
#import "AlarmDataController.h"
#import "TextInputView.h"
#import "DWTagList.h"


@protocol createAlarmDelegate;

@interface CreateAlarmViewController : UIViewController
{

    NSDate * _date;
    Utility * _utility;
    AlarmDataController * _alarmDataController;
    
    TextInputView * _textInputView;
    DWTagList * _dwtaglist;
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