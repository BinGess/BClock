//
//  LeftViewController.m
//  BClock
//
//  Created by 白 斌 on 13-8-31.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftViewCellView.h"

@interface LeftViewController ()<createAlarmDelegate>


@end

@implementation LeftViewController
@synthesize alarmDataController = _alarmDataController;


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
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    Alarm * alarm = [_alarmDataController.alarmList objectAtIndex:indexPath.row];
    cell.timeText.text = [_utility changeDateFormat:alarm.date];
    cell.nameLabel.text = alarm.info;

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
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
    
    CGRect tableViewRect;
    {
        tableViewRect.origin.x = 0;
        tableViewRect.origin.y = 50;
        tableViewRect.size.width = 320;
        tableViewRect.size.height = 356;
    }
    

    _titleBar = [[UIView alloc] initWithFrame:titleBarRect];
    [_titleBar setBackgroundColor:[UIColor colorWithRed:9.0 green:9.0 blue:9.0 alpha:0.5 ]];
    
    _tableView = [[UITableView alloc] initWithFrame:tableViewRect style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    
    NSArray *_nib=[[NSBundle mainBundle] loadNibNamed:@"FootBarView" owner:self options:nil];
    _footBar = [_nib objectAtIndex:0];
    [_footBar setCenter:CGPointMake(160, 435)];;
    
    // 创建一个手势识别器
    UITapGestureRecognizer *oneFingerOneTaps =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerTwoTaps)] ;
    
    // Set required taps and number of touches
    [oneFingerOneTaps setNumberOfTapsRequired:1];
    [oneFingerOneTaps setNumberOfTouchesRequired:1];
    
    // Add the gesture to the view
    [_footBar addGestureRecognizer:oneFingerOneTaps];
    
    [self.view addSubview:_titleBar];
    [self.view addSubview:_tableView];
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
