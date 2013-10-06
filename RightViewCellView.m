//
//  RightViewCellView.m
//  BClock
//
//  Created by 白 斌 on 13-9-20.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import "RightViewCellView.h"

@implementation RightViewCellView
@synthesize delegate = _delegate;
@synthesize StatusFalseButton = _StatusFalseButton;
@synthesize StatusTrueButton = _StatusTrueButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

        //[_StatusTrueButton setBackgroundImage:[UIImage imageNamed:@"StatusTrueNormal.png"] forState:UIControlStateNormal];
        //[_StatusFalseButton setBackgroundImage:[UIImage imageNamed:@"StatusFalseNormal"] forState:UIControlStateNormal];
        
        
        CGRect segmentRect;
        {
            segmentRect.origin.x = 10 ;
            segmentRect.origin.y = 10 ;
            segmentRect.size.width = 30;
            segmentRect.size.height = 30;
        }
        
        SVSegmentedControl *redSC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:[UIImage imageNamed:@"StatusTrueNormal.png"], [UIImage imageNamed:@"StatusFalseNormal.png"], nil]];
        [redSC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
        
        redSC.crossFadeLabelsOnDrag = YES;
        redSC.thumb.tintColor = [UIColor colorWithRed:0.6 green:0.2 blue:0.2 alpha:1];
        redSC.selectedIndex = 1;
        redSC.frame = segmentRect;
        //redSC.center = CGPointMake(50,5);
        
        [self addSubview:redSC];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)actionTrueButton:(id)sender {
    
    [_delegate actionRightViewCellTrueButton:sender];
}

- (IBAction)actionFalseButton:(id)sender {
    
    [_delegate actionRightViewCellFalseButton:sender];
}
@end
