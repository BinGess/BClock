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
#import "MMDrawerController.h"
#import "AlarmDataBase.h"

@interface AlarmDataController : NSObject

@property (strong, nonatomic) AlarmDataBase * alarmDataBase;
@property (strong, nonatomic) NSMutableArray * alarmList;
@property (strong, nonatomic) MMDrawerController * mmDrawerController;

- (void)addAlarmWithInfo:(NSString *)info Date:(NSDate *) date;
- (NSInteger) countOfAlarmList;


+ (AlarmDataController *) sharedInstanceMethod;

@end
