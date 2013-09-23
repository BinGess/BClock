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
    UIColor * color = [UIColor colorWithRed:0.12 green:0.16 blue:0.21 alpha:1.0];
    [self.view setBackgroundColor:color];


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
