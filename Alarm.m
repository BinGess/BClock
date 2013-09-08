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
@end
