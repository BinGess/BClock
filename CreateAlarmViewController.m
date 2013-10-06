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
    
    _date = [NSDate date];
    
    [self initTagListView];
    [self initTextInputView];

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
    _textInputView.inputView.delegate = self;//将自定义控件中的UITextFieldView的代理关联到该ViewController
    
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




@end
