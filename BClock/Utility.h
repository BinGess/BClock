//
//  Utility.h
//  XiaoMIAlarm
//
//  Created by 帅牛 on 13-6-10.
//  Copyright (c) 2013年 郑 杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject


-(NSString*) changeDateFormat:(NSDate *)date;

+ (UILocalNotification *) setNotificationWith:(NSDate *) date;

+ (void)removeNotification:(UILocalNotification *) notificaiton;

+ (NSDate *)ChangeStringToDate:(NSString*)string;

+ (NSString *)ChangeDateToString:(NSDate *)date;

+ (void)removeAllNotification;

@end
