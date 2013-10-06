//
//  RightViewCellView.h
//  BClock
//
//  Created by 白 斌 on 13-9-20.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SVSegmentedControl.h"

@protocol actionRightViewCellDelegate;

@interface RightViewCellView : UITableViewCell

@property (strong, nonatomic) IBOutlet UIButton *StatusTrueButton;
@property (strong, nonatomic) IBOutlet UIButton *StatusFalseButton;
@property (strong, nonatomic) IBOutlet UILabel *TextLabel;
@property (strong, nonatomic) id<actionRightViewCellDelegate> delegate;

- (IBAction)actionTrueButton:(id)sender;
- (IBAction)actionFalseButton:(id)sender;

@end

@protocol actionRightViewCellDelegate <NSObject>

@required

-(void) actionRightViewCellTrueButton:(id)sender;

-(void) actionRightViewCellFalseButton:(id)sender;

@end