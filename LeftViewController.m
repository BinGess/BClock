//
//  LeftViewController.m
//  BClock
//
//  Created by 白 斌 on 13-8-31.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftViewCellView.h"
#import "Utility.h"
#import "LTitleBarView.h"

@interface LeftViewController ()<createAlarmDelegate,actionLeftViewCellDelegate>


@end

@implementation LeftViewController
@synthesize alarmDataController = _alarmDataController;

- (void)actionLeftViewCellCheckButton:sender
{
    // 拿到这个Alarm的行号以后，将更改这个闹钟的状态，已经更改此时的状态图片
    int i = [_tableView indexPathForCell:(UITableViewCell *)[[sender superview] superview]].row;
    
    Alarm * alarm = [_alarmDataController.alarmList objectAtIndex:i];
    
    if (alarm.availability) {
        
        [[_alarmDataController.alarmList objectAtIndex:i] setAvailability:NO];
        [Utility removeNotification:alarm.notification];
    }
    else
    {
        alarm.availability = YES;
       [Utility setNotificationWith:alarm.date];
    }
    
    [_tableView reloadData];
}

- (void)addAlarmWithInfo:(NSString *)info Date:(NSDate *)date
{
    [_alarmDataController addAlarmWithInfo:info Date:date];
    [_tableView reloadData];
}


# pragma mark --UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_alarmDataController.alarmList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Alarm";
    LeftViewCellView *cell = (LeftViewCellView *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        
        NSArray *_nib=[[NSBundle mainBundle] loadNibNamed:@"LeftViewCellView"
                                                    owner:self
                                                  options:nil];
        
        cell = [_nib objectAtIndex:0];
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    Alarm * alarm = [_alarmDataController.alarmList objectAtIndex:indexPath.row];
    
    if(alarm.availability == YES)
    {
        [cell.statusButton setBackgroundImage: [UIImage imageNamed:@"ButtonStatusTrue.png" ] forState:UIControlStateNormal];
    }else if(alarm.availability == NO)
    {
    
        [cell.statusButton setBackgroundImage: [UIImage imageNamed:@"buttonStatusFalse.png" ] forState:UIControlStateNormal];
    }
    
    [cell.contentView setBackgroundColor:[UIColor colorWithRed:0.12 green:0.16 blue:0.21 alpha:1.0]];
    
    cell.timeText.text = [_utility changeDateFormat:alarm.date];
    cell.nameLabel.text = alarm.info;

    return cell;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if(editingStyle == UITableViewCellEditingStyleDelete)
//    {
//        Alarm * alarm = [_alarmDataController.alarmList objectAtIndex:indexPath.row];
//       [_alarmDataController deleteAlarmWith:alarm];
//        
//       [_alarmDataController.alarmList removeObjectAtIndex:indexPath.row];
//       [_tableView reloadData];
//    }
//
//}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    return YES;
//}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    CreateAlarmViewController * createController = [[CreateAlarmViewController alloc] initWithNibName:@"CreateAlarmViewController" bundle:nil];
    Alarm * alarm = [_alarmDataController.alarmList objectAtIndex:indexPath.row];
    
    createController.date = alarm.date;
    createController.labelString = alarm.info;
    
    [self presentViewController:createController animated:YES completion:nil];
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
}

# pragma mark--

# pragma mark--initWork 

- (void) initView
{
    CGRect titleBarRect;
    {
        titleBarRect.origin.x = 0;
        titleBarRect.origin.y = 0;
        titleBarRect.size.width = 320;
        titleBarRect.size.height = 50;
    }
    
    CGRect separatorLineOne;
    {
        separatorLineOne.origin.x = 0;
        separatorLineOne.origin.y = 50;
        separatorLineOne.size.width = 320;
        separatorLineOne.size.height =1;
    }
    
    CGRect tableViewRect;
    {
        tableViewRect.origin.x = 0;
        tableViewRect.origin.y = 51;
        tableViewRect.size.width = 320;
        tableViewRect.size.height = 356;
    }
    
    CGRect separatorLineTwo;
    {
        separatorLineTwo.origin.x = 0;
        separatorLineTwo.origin.y = 396;
        separatorLineTwo.size.width = 320;
        separatorLineTwo.size.height =1;
    }
    
    CGRect footBarView;
    {
        footBarView.origin.x = 0;
        footBarView.origin.y = 397;
        footBarView.size.width = 320;
        footBarView.size.height = 72;
    }
    

    
    NSArray *_nibs=[[NSBundle mainBundle] loadNibNamed:@"LTitleBarView" owner:self options:nil];
    _titleBar = [_nibs objectAtIndex:0];
    _titleBar.frame = titleBarRect;
    _titleBar.titleBarLabel.text = @"Jame's Alarm";
   [_titleBar setBackgroundColor:[UIColor colorWithRed:0.12 green:0.16 blue:0.21 alpha:1.0]];
    
    _separatorLineOne = [[UIView alloc] initWithFrame:separatorLineOne];
   [_separatorLineOne setBackgroundColor:[UIColor colorWithRed:0.2 green:0.24 blue:0.29 alpha:1.0]];
    
    
    _tableView = [[UITableView alloc] initWithFrame:tableViewRect style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setBackgroundColor:[UIColor colorWithRed:0.12 green:0.16 blue:0.21 alpha:1.0]];
    [_tableView setSeparatorColor:[UIColor colorWithRed:0.2 green:0.24 blue:0.29 alpha:1.0]];
    
    
    _separatorLineTwo = [[UIView alloc] initWithFrame:separatorLineTwo];
    [_separatorLineTwo setBackgroundColor:[UIColor colorWithRed:0.2 green:0.24 blue:0.29 alpha:1.0]];
    
    NSArray *_nib=[[NSBundle mainBundle] loadNibNamed:@"FootBarView" owner:self options:nil];
    _footBar = [_nib objectAtIndex:0];
    _footBar.frame = footBarView;
    
    // 创建一个手势识别器
    UITapGestureRecognizer *oneFingerOneTaps =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerTwoTaps)] ;
    
    // Set required taps and number of touches
    [oneFingerOneTaps setNumberOfTapsRequired:1];
    [oneFingerOneTaps setNumberOfTouchesRequired:1];
    
    // Add the gesture to the view
    [_footBar addGestureRecognizer:oneFingerOneTaps];
    
    [self.view addSubview:_titleBar];
    [self.view addSubview:_separatorLineOne];
    [self.view addSubview:_tableView];
    [self.view addSubview:_separatorLineTwo];
    [self.view addSubview:_footBar];
    
}

- (void) initData
{
   _alarmDataController = [AlarmDataController sharedInstanceMethod];
    _utility = [[Utility alloc] init];
}

# pragma mark--


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
    [self initView];
    [self initData];

}



- (void)viewDidAppear:(BOOL)animated
{
     //[_tableView setEditing:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)oneFingerTwoTaps
{
    CreateAlarmViewController * createAlarm = [[CreateAlarmViewController alloc] initWithNibName:@"CreateAlarmViewController" bundle:nil];
    [self presentViewController:createAlarm animated:YES completion:nil];
}

@end
