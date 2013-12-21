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

@interface CreateAlarmViewController : UIViewController<DWTagListDelegate,UITextFieldDelegate>
{

    
    Utility * _utility;
    AlarmDataController * _alarmDataController;
    TextInputView * _textInputView;
    DWTagList * _dwtaglist;
    UIDatePicker * datePicker;
    
}

@property (strong, nonatomic) id<createAlarmDelegate> delegate;
@property (strong, nonatomic) Alarm * alarm;
@property (strong, nonatomic) NSDate * date;
@property (strong, nonatomic) NSString * labelString;
@property (nonatomic) NSInteger deleteLabel;
@property (nonatomic) NSInteger cellIndex;


- (IBAction)backButton:(id)sender;
- (IBAction)addButton:(id)sender;

@end


@protocol createAlarmDelegate <NSObject>

@required

- (void)addAlarmWithInfo:(NSString *) info Date:(NSDate *)date;

- (void)removeAlarm:(NSInteger) index;

@end