//
//  LeftViewCellView.h
//  BClock
//
//  Created by 白 斌 on 13-9-8.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftViewCellView : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *timeText;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIButton *statusButton;


- (IBAction)statusButton:(id)sender;
@end
