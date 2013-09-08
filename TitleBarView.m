//
//  TitleBarView.m
//  BClock
//
//  Created by 白 斌 on 13-9-7.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import "TitleBarView.h"

@implementation TitleBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)settingAction:(id)sender {
    
    NSLog(@"setting");
}

- (IBAction)moreAction:(id)sender {
    
    NSLog(@"moreAciton");
    
}
@end
