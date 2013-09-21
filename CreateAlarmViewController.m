//
//  CreateAlarmViewController.m
//  XiaoMIAlarm
//
//  Created by 帅牛 on 13-6-11.
//  Copyright (c) 2013年 郑 杰. All rights reserved.
//

#import "CreateAlarmViewController.h"
#import "CenterClockViewController.h"
#import "AlarmDataController.h"
#import "LeftViewController.h"
#import "RightViewController.h"


static const NSInteger SectionAccount = 1;
static const NSInteger SectionRepeat = 0;
static const NSInteger SectionBell = 1;
static const NSInteger sectionLabel = 2;

@interface CreateAlarmViewController ()

@end

@implementation CreateAlarmViewController
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark initView

- (void)initTextInputView
{


}

- (void)initTagListView
{



}


#pragma mark


- (IBAction)datePickerChanged:(id)sender
{
    _date = [(UIDatePicker *)sender date];
}

- (MMDrawerController *)getMMDrawerController
{
    LeftViewController * leftDrawer = [[LeftViewController alloc] init];
    leftDrawer.view.backgroundColor = [UIColor blackColor];
    
    CenterClockViewController * center = [[CenterClockViewController alloc] init];
    
    UIViewController * rightDrawer = [[RightViewController alloc] init];
    rightDrawer.view.backgroundColor = [UIColor greenColor];
    
    MMDrawerController * _mmDrawerController = [[MMDrawerController alloc]
                                                initWithCenterViewController:center
                                                leftDrawerViewController:leftDrawer
                                                rightDrawerViewController:rightDrawer];
    
    [_mmDrawerController setMaximumRightDrawerWidth:250];
    [_mmDrawerController setMaximumLeftDrawerWidth:250];
    
    [_mmDrawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [_mmDrawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];

    return _mmDrawerController;

}

- (IBAction)backButton:(id)sender
{
    
    //AlarmDataController * alarmController = [AlarmDataController sharedInstanceMethod];

   [self presentViewController: [self getMMDrawerController] animated:YES completion:nil];
    
}

- (IBAction)addButton:(id)sender
{
    _alarmDataController = [AlarmDataController sharedInstanceMethod];
    [_alarmDataController addAlarmWithInfo:@"alarm" Date:[NSDate date]];
    //[_delegate addAlarmWithInfo:@"Alarm" Date:_date];
    
    
    [self presentViewController:[self getMMDrawerController] animated:YES completion:nil];



}




@end
