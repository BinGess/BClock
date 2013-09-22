//
//  CreateAlarmViewController.m
//  XiaoMIAlarm
//
//  Created by Blake on 13-6-11.
//  Copyright (c) 2013年 Blak. All rights reserved.
//

#import "CreateAlarmViewController.h"
#import "CenterClockViewController.h"
#import "AlarmDataController.h"
#import "LeftViewController.h"
#import "RightViewController.h"


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
    [self initTagListView];
    [self initTextInputView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}


- (void)selectedTag:(NSString *)tagName{
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
//                                                    message:[NSString stringWithFormat:@"You tapped tag %@", tagName]
//                                                   delegate:nil
//                                          cancelButtonTitle:@"Ok"
//                                          otherButtonTitles:nil];
//    [alert show];
    _textInputView.inputView.text = tagName;
    
    
}


#pragma mark initView

- (void)initTextInputView
{
    
    CGRect inputViewRect;
    {
        inputViewRect.origin.x = 35.0f;
        inputViewRect.origin.y = 60.0f;
        inputViewRect.size.width = 250.0f;
        inputViewRect.size.height = 50.0f;
    }
    
    NSArray *_nib=[[NSBundle mainBundle] loadNibNamed:@"TextInputView"
                                                owner:self
                                              options:nil];
    _textInputView = [_nib objectAtIndex:0];
    _textInputView.frame = inputViewRect;
    
    [self.view addSubview:_textInputView];
  
}

- (void)initTagListView
{
    CGRect tagListViewRect;
    {
        tagListViewRect.origin.x = 35.0f;
        tagListViewRect.origin.y = 120.0f;
        tagListViewRect.size.width = 250.0f;
        tagListViewRect.size.height = 60.0f;
    }
    _dwtaglist = [[DWTagList alloc] initWithFrame:tagListViewRect];
    

   [_dwtaglist setAutomaticResize:YES];
    NSArray *array = [[NSArray alloc] initWithObjects:@"Foo", @"Tag Label 1", @"Tag Label 2", @"Tag Label 3", @"Tag Label 4", @"Long long long long long long Tag", nil];
    [_dwtaglist setTags:array];
    [_dwtaglist setTagDelegate:self];
    [self.view addSubview:_dwtaglist];

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
