//
//  RightViewController.h
//  BClock
//
//  Created by 白 斌 on 13-8-31.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import "Alarm.h"

@implementation Alarm
@synthesize date = _date;
@synthesize info = _info;
@synthesize notification = _notification;
@synthesize availability = _availability;

- (Alarm *) initAlarm:(NSString *)info
{
    _info = info;
    
    return self;
}


- (Alarm *) initAlarm:(NSString *)info Date:(NSDate *)date
{
    _info = info;
    _date = date;
    
    return self;

}


- (Alarm *) initAlarm:(NSString *)info Date:(NSDate *)date Availability:(BOOL)avail
{
    _info = info;
    _date = date;
    _availability = avail;

    return self;
}

- (void) setAvailability:(BOOL)availability
{
    _availability = availability;
//    if (availability == YES)
//    {
//        // 如果此时设置的状态为True,则重新设置闹钟状态为开启
//        
//        [Utility setNotificationWith:self.date];
//        
//    }else if (availability == NO)
//    {
//         // 如果此时设置的状态为False,则重新设置闹钟状态为关闭
//        [Utility removeNotification:self.notification];
//    }
//    

}

- (BOOL) availability
{

    return _availability;
}

@end
