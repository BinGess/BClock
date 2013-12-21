//
//  RightViewCellView.m
//  BClock
//
//  Created by 白 斌 on 13-9-20.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import "RightViewCellView.h"

@implementation RightViewCellView


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

        //[_StatusTrueButton setBackgroundImage:[UIImage imageNamed:@"StatusTrueNormal.png"] forState:UIControlStateNormal];
        //[_StatusFalseButton setBackgroundImage:[UIImage imageNamed:@"StatusFalseNormal"] forState:UIControlStateNormal];
        
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)switchAction:(id)sender
{
    
    
}
@end
