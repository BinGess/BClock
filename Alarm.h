//
//  RightViewController.h
//  BClock
//
//  Created by 白 斌 on 13-8-31.
//  Copyright (c) 2013年 baibin. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Alarm : NSObject

@property (strong, nonatomic) NSString * info;
@property (strong, nonatomic) NSDate * date;
@property (strong, nonatomic) UILocalNotification * notification;
@property (nonatomic) BOOL availability;


- (Alarm *) initAlarm:(NSString *) info Date:(NSDate *)date Availability:(BOOL)avail;
- (Alarm *) initAlarm:(NSString *)info Date:(NSDate *)date;
- (Alarm *) initAlarm:(NSString *)info;

@end
