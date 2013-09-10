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


static const NSInteger SectionAccount = 3;
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

# pragma mark -- UITableViewDelegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return SectionAccount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = nil;
    
    if(indexPath.row == SectionRepeat )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
       [cell.textLabel setText:@"Repeat"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }else if(indexPath.row == SectionBell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
       [cell.textLabel setText:@"Bell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    }else if(indexPath.row == sectionLabel)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
       [cell.textLabel setText:@"Label"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;

}

# pragma mark --



- (IBAction)datePickerChanged:(id)sender
{
    _date = [(UIDatePicker *)sender date];
}

- (IBAction)backButton:(id)sender
{
    
    AlarmDataController * alarmController = [AlarmDataController sharedInstanceMethod];

   [self presentViewController: alarmController.mmDrawerController animated:YES completion:nil];
    
}

- (IBAction)addButton:(id)sender
{
    [_delegate addAlarmWithInfo:@"Alarm" Date:_date];
    [self presentViewController:[AlarmDataController sharedInstanceMethod].mmDrawerController animated:YES completion:nil];



}




@end
