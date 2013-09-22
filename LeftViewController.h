//
//  LeftViewController.h
//  BClock
//
//  Created by 白 斌 on 13-8-31.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlarmDataController.h"
#import "Utility.h"
#import "FootBarView.h"
#import "CreateAlarmViewController.h"
#import "LTitleBarView.h"

@interface LeftViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{

    // View of this Controller
    LTitleBarView * _titleBar;
    UITableView * _tableView;
    FootBarView * _footBar;
    Utility * _utility;
    
    UIView * _separatorLineOne;
    UIView * _separatorLineTwo;
    
    
    
}
// DataSource of _tableView
@property(nonatomic, strong) AlarmDataController *alarmDataController;

@end
