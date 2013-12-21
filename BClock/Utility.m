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
    notification.timeZone = [NSTimeZone defaultTimeZone];
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


+ (void)removeAllNotification
{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}


+ (NSString *)ChangeDateToString:(NSDate *)date
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat : @"M/d/yyyy h:m:s"];
    
    NSString * stirng = [formatter stringFromDate:date];
    
    return stirng;
}

+ (NSDate *)ChangeStringToDate:(NSString*)string
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : @"M/d/yyyy h:m:s"];
    
    NSDate *dateTime = [formatter dateFromString:string];
    return dateTime;
}


// 对颜色的处理，十六进制 和 颜色值的处理

+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}


+ (UIColor*) colorWithHex:(NSInteger)hexValue
{
    return [self colorWithHex:hexValue alpha:1.0];
}


+ (NSString *) hexFromUIColor: (UIColor*) color {
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"#FFFFFF"];
    }
    
    return [NSString stringWithFormat:@"#XXX", (int)((CGColorGetComponents(color.CGColor))[0]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[1]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[2]*255.0)];
}

//

- (void) getSizeOfScreen
{

    CGRect rect;
    CGRect mainRect;
    
    rect = [UIApplication sharedApplication].statusBarFrame;
    mainRect = [UIScreen mainScreen].applicationFrame;
    
    
    NSLog(@"sssss");
    NSLog(@"%f",rect.size.height);
    
    NSLog(@"%f",mainRect.origin.x);
    NSLog(@"%f",mainRect.origin.y);
    NSLog(@"%f",mainRect.size.width);
    NSLog(@"%f",mainRect.size.height);

}



@end
