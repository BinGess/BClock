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
@synthesize date = _date;
@synthesize labelString = _labelString;
@synthesize deleteLabel = _deleteLabel;
@synthesize alarm = _alarm;
@synthesize cellIndex = _cellIndex;


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
    
    _date = [NSDate date];
    
    [self initTagListView];
    [self initTextInputView];
    [self initDatePicker];
    
    if(_deleteLabel == 1)
    {
    
    [self initDeleteButton];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    _labelString = textField.text;
    [_textInputView.inputView resignFirstResponder];
    return YES;
}


- (void)selectedTag:(NSString *)tagName
{
    _textInputView.inputView.text = tagName;
    _labelString = tagName;
}


#pragma mark

- (MMDrawerController *)getMMDrawerController
{
    LeftViewController * leftDrawer = [[LeftViewController alloc] init];
    leftDrawer.view.backgroundColor = [UIColor blackColor];
    
    CenterClockViewController * center = [[CenterClockViewController alloc] init];
    
    RightViewController * rightDrawer = [[RightViewController alloc] init];
    rightDrawer.view.backgroundColor = [UIColor greenColor];
    
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:center];
    

    
    [navigationController setRestorationIdentifier:@"MMExampleCenterNavigationControllerRestorationKey"];
    
    
    MMDrawerController * _mmDrawerController = [[MMDrawerController alloc]
                                                initWithCenterViewController:navigationController
                                                leftDrawerViewController:leftDrawer
                                                rightDrawerViewController:rightDrawer];
    
    [_mmDrawerController setRestorationIdentifier:@"MMDrawer"];
    
    [_mmDrawerController setMaximumRightDrawerWidth:250];
    [_mmDrawerController setMaximumLeftDrawerWidth:250];
    
    [_mmDrawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [_mmDrawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];

    return _mmDrawerController;

}

- (IBAction)backButton:(id)sender
{
   [self presentViewController: [self getMMDrawerController] animated:YES completion:nil];
}

- (IBAction)addButton:(id)sender
{
    _alarmDataController = [AlarmDataController sharedInstanceMethod];
   [_alarmDataController addAlarmWithInfo:_labelString Date:_date];
   [self presentViewController:[self getMMDrawerController] animated:YES completion:nil];
}


- (void)datePickerChanged
{
    _date = datePicker.date;
    
}

- (void)deleteAlarm
{
     _alarmDataController = [AlarmDataController sharedInstanceMethod];
    [_alarmDataController deleteAlarmWith:_alarm];
    [self presentViewController:[self getMMDrawerController] animated:YES completion:nil];
    
    [_delegate removeAlarm:_cellIndex];
}




#pragma mark initView

- (void)initData
{
    
    
}

- (void)initDatePicker
{
    CGRect datePickerRect;
    {
        datePickerRect.origin.x = 0;
        datePickerRect.origin.y = 300;
        datePickerRect.size.width = 320;
        datePickerRect.size.height = 162;
    }
    
    datePicker = [[UIDatePicker alloc] init];
    datePicker.frame = datePickerRect;
   [datePicker addTarget:self action:@selector(datePickerChanged) forControlEvents:UIControlEventValueChanged];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
   [self.view addSubview:datePicker];
    
}

- (void)initDeleteButton
{
    CGRect deleteButtonRect;
    {
        deleteButtonRect.origin.x = 35;
        deleteButtonRect.origin.y = 472;
        deleteButtonRect.size.width = 250;
        deleteButtonRect.size.height = 50;
    }
    
    UIButton * deleteButton = [[UIButton alloc] init];
    deleteButton.frame = deleteButtonRect;
    deleteButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:deleteButton];
    
    
    [deleteButton addTarget:self action:@selector(deleteAlarm) forControlEvents:UIControlEventTouchUpInside];

}



- (void)initTextInputView
{
    CGRect inputViewRect;
    {
        inputViewRect.origin.x = 35.0f;
        inputViewRect.origin.y = 90.0f;
        inputViewRect.size.width = 250.0f;
        inputViewRect.size.height = 50.0f;
    }
    
    NSArray *_nib=[[NSBundle mainBundle] loadNibNamed:@"TextInputView"
                                                owner:self
                                              options:nil];
    _textInputView = [_nib objectAtIndex:0];
    _textInputView.frame = inputViewRect;
    _textInputView.inputView.delegate = self;//将自定义控件中的UITextFieldView的代理关联到该ViewController
    
    [self.view addSubview:_textInputView];
    
}

- (void)initTagListView
{
    CGRect tagListViewRect;
    {
        tagListViewRect.origin.x = 35.0f;
        tagListViewRect.origin.y = 160.0f;
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





@end
