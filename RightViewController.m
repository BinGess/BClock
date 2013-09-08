//
//  RightViewController.m
//  BClock
//
//  Created by 白 斌 on 13-8-31.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController
@synthesize dataSourceArray = _dataSourceArray;



# pragma mark --UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSourceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Setting";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
        
    }
    cell.textLabel.text = @"SettingOne";
    cell.detailTextLabel.text = @"SettingTwo";
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
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
        tableViewRect.size.height = 350;
    }
    
    CGRect footBarRect;
    {
        footBarRect.origin.x = 0;
        footBarRect.origin.y = 400;
        footBarRect.size.width = 320;
        footBarRect.size.height = 70;
    }
    
    _titleBar = [[UIView alloc] initWithFrame:titleBarRect];
    [_titleBar setBackgroundColor:[UIColor colorWithRed:9.0 green:9.0 blue:9.0 alpha:0.5 ]];
    
    _tableView = [[UITableView alloc] initWithFrame:tableViewRect style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _footBar = [[UIView alloc] initWithFrame:footBarRect];
    [_footBar setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5 ]];
    
    [self.view addSubview:_titleBar];
    [self.view addSubview:_tableView];
    [self.view addSubview:_footBar];
    
}

- (void) initData
{
    _dataSourceArray = [[NSMutableArray alloc] initWithObjects:@"Alarm1",@"Alarm2",nil
                        ];
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

@end
