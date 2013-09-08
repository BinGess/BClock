//
//  TitleBarView.h
//  BClock
//
//  Created by 白 斌 on 13-9-7.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleBarView : UIView



@property (strong, nonatomic) IBOutlet UILabel *titleName;

- (IBAction)settingAction:(id)sender;
- (IBAction)moreAction:(id)sender;

@end
