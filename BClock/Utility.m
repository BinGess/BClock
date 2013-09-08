//
//  Utility.m
//  XiaoMIAlarm
//
//  Created by 帅牛 on 13-6-10.
//  Copyright (c) 2013年 郑 杰. All rights reserved.
//

#import "Utility.h"

@implementation Utility

-(NSString*) changeDateFormat:(NSDate *)date
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init] ;
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"HH:mm"];
    NSString *str = [outputFormatter stringFromDate:date];
    return str;
}

+ (UILocalNotification *) setNotificationWith:(NSDate *) date
{
    UILocalNotification * notification = [[UILocalNotification alloc] init];
    notification.fireDate = date;
    notification.repeatInterval = NSDayCalendarUnit;
    notification.timeZone = nil;
    notification.alertBody = @"起床啦";
    notification.alertAction = @"关闭";
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    return notification;
}

+ (void)removeNotification:(UILocalNotification *) notificaiton
{
    [[UIApplication sharedApplication] cancelLocalNotification:notificaiton];
}

@end
