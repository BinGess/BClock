//
//  CenterClockViewController.m
//  BClock
//
//  Created by 白 斌 on 13-8-31.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import "CenterClockViewController.h"

@interface CenterClockViewController ()

@end

@implementation CenterClockViewController
@synthesize clockView = _clockView;
@synthesize hourLabel = _hourLabel;
@synthesize minLabel = _minLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initMainView
{
        
        NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(setTimer:) userInfo:nil repeats:YES];
    
        [timer fire];
    
       
        

}
- (void)setTimer:(NSTimer *)timer
{
    
    NSDate * tempDate;
    _alrmDataController = [AlarmDataController sharedInstanceMethod];
    if([_alrmDataController.alarmList count] != 0)
    {
        Alarm * alarm = [_alrmDataController.alarmList objectAtIndex:0];
        tempDate = alarm.date;
    }else
    {
        tempDate = [NSDate date];
    }

    NSCalendar *cal = [NSCalendar currentCalendar];//定义一个NSCalendar对象
    NSDate *today = [NSDate date];//得到当前时间
    //用来得到具体的时差
    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    component = [cal components:unitFlags fromDate:today toDate:tempDate options:0];
    
    [_hourLabel setText:[NSString stringWithFormat:@"%d",[component hour]]];
    [_minLabel setText:[NSString stringWithFormat:@"%d",[component minute]]];
    
    NSLog(@"%d",[component hour]);
    NSLog(@"%d",[component minute]);

}


- (void)initTitleBarView
{
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"TitleBarView" owner:self options:nil];
    //得到第一个UIView
    UIView *tmpCustomView = [nib objectAtIndex:0];
    //设置自定义视图的位置
    [tmpCustomView setCenter:CGPointMake(160,22)];
    //添加视图
    [self.view addSubview:tmpCustomView];
}

- (void)initClockView
{
    UIImage *image = [UIImage imageNamed:@"4.png"];
    _clockView = [[ClockView alloc] initWithFrame:CGRectMake(0, 44, image.size.width, image.size.height)];
    _clockView.center = CGPointMake(self.view.center.x, 180);
   [_clockView setClockBackgroundImage:image.CGImage];

	[self.view addSubview:_clockView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
}

- (void)viewWillAppear:(BOOL)animated
{
    [self initMainView];
    [self initTitleBarView];
    [self initClockView];
    [_clockView updateClock:nil];
    [_clockView start];
}

- (void)viewDidAppear:(BOOL)animated
{

}

- (void)viewWillDisappear:(BOOL)animated
{
    [_clockView stop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
