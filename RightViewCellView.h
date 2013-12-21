//
//  RightViewCellView.h
//  BClock
//
//  Created by 白 斌 on 13-9-20.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol actionRightViewCellDelegate;

@interface RightViewCellView : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *TextLabel;
@property (weak, nonatomic) IBOutlet UISwitch *switchview;


- (IBAction)switchAction:(id)sender;


@end

