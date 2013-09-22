//
//  RightViewController.h
//  BClock
//
//  Created by 白 斌 on 13-8-31.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    // View of this Controller
    UITableView * _tableView;
}

// DataSource of _tableView
@property(nonatomic, strong) NSMutableArray * dataSourceArray;

@end
