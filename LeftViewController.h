//
//  LeftViewController.h
//  BClock
//
//  Created by 白 斌 on 13-8-31.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{

    // View of this Controller
    UIView * _titleBar;
    UITableView * _tableView;
    UIView * _footBar;
    
    
    
}
// DataSource of _tableView
@property(nonatomic, strong) NSMutableArray * dataSourceArray;

@end
