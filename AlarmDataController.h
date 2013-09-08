//
//  RightViewController.h
//  BClock
//
//  Created by 白 斌 on 13-8-31.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Alarm.h"
#import "Utility.h"

@interface AlarmDataController : NSObject


@property (strong, nonatomic) NSMutableArray * alarmList;

- (void)addAlarmWithInfo:(NSString *)info Date:(NSDate *) date;
- (NSInteger) countOfAlarmList;


+ (AlarmDataController *) sharedInstanceMethod;

@end
