//
//  RightViewController.h
//  BClock
//  Created by 白 斌 on 13-8-31.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import "AlarmDataController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "CenterClockViewController.h"
#import "AlarmDataBase.h"

static AlarmDataController * sharedInstance = nil;

@implementation AlarmDataController
@synthesize alarmList = _alarmList;
@synthesize mmDrawerController = _mmDrawerController;
@synthesize alarmDataBase = _alarmDataBase;

- (id)init
{
    self = [super init];
    if(self)
    {
        _alarmList = [[NSMutableArray alloc] init];
        _alarmDataBase = [[AlarmDataBase alloc] init];
        
        [_alarmDataBase createDataBase];
        [self getALarmListFromDataBase];

       // [self getLastAlarm];
     
    
        
    }
    return self;
}


- (void)GetMMDrawerController
{
    LeftViewController * leftDrawer = [[LeftViewController alloc] init];
    leftDrawer.view.backgroundColor = [UIColor blackColor];
    
    CenterClockViewController * center = [[CenterClockViewController alloc] init];
    
    UIViewController * rightDrawer = [[RightViewController alloc] init];
    rightDrawer.view.backgroundColor = [UIColor greenColor];
    
    _mmDrawerController = [[MMDrawerController alloc]
                                             initWithCenterViewController:center
                                             leftDrawerViewController:leftDrawer
                                             rightDrawerViewController:rightDrawer];
    
    [_mmDrawerController setMaximumRightDrawerWidth:200];
    [_mmDrawerController setMaximumLeftDrawerWidth:200];
    
    [_mmDrawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [_mmDrawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    self.mmDrawerController = _mmDrawerController;
    
}

+(AlarmDataController *)sharedInstanceMethod
{
    @synchronized(self)
    {
        if (sharedInstance == nil)
        {
        sharedInstance = [[self alloc] init];
        }
}
    return sharedInstance;
}

//唯一一次alloc单例，之后均返回nil
+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;
        }
    }
    return nil;
}


//copy返回单例本身
- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

// addAlarm and setLocalNotificaiton for a Alarm
- (void)addAlarmWithInfo:(NSString *)info Date:(NSDate *)date
{
    Alarm * alarm = [[Alarm alloc] initAlarm:info Date:date Availability:YES];
    
    UILocalNotification * localNotification = [Utility setNotificationWith:date];
    alarm.notification  = localNotification;
    
    [_alarmDataBase insertDate:[Utility ChangeDateToString:alarm.date] Info:alarm.info Avail:alarm.availability];
    
    if(alarm)
    {
        [_alarmList addObject:alarm];
    }
}


- (void)deleteAlarmWith:(Alarm*)alarm;
{
    [Utility removeNotification:alarm.notification];
    [_alarmDataBase delete:[Utility ChangeDateToString:alarm.date]];

}


- (void)getALarmListFromDataBase
{
   
    NSMutableArray * result = [_alarmDataBase queryAll];
    for(Alarm *alarm in result)
    {
        NSLog(@"%@",alarm.info);
        [_alarmList addObject:alarm];
    }

}

- (NSTimeInterval)getTimeInterval:(NSDate *)theDate
{
    NSDateFormatter* dateFormatter =[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    
    NSDate * now = [NSDate date];
    
    NSLog(@"theDate%@",[dateFormatter stringFromDate:theDate]);
    NSLog(@"now%@",[dateFormatter stringFromDate:now]);
    NSTimeInterval time=[theDate timeIntervalSinceDate:now];

    int days=((int)time)/(3600*24);
    int hours=((int)time)%(3600*24)/3600;
    NSString * dateContent=[[NSString alloc] initWithFormat:@"%i天%i小时",days,hours];
    
    NSLog(@"...%@",dateContent);
    
    return time;
}


- (Alarm *)getLastAlarm
{
    NSMutableArray * result = [_alarmDataBase queryAll];
    
    if(result.count != 0)
    {
        [self BubbleSort:result];
        
        NSDateFormatter* date=[[NSDateFormatter alloc] init];
        [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
//        for(Alarm * alarm in result)
//        {
//            NSLog(@"%@",alarm.info);
//            NSLog(@"%@",[date stringFromDate:alarm.date]);
//        }
        
        Alarm * tempAlarm = [result objectAtIndex:0];
        NSLog(@"%@",tempAlarm.info);
        NSLog(@"%@",[date stringFromDate:tempAlarm.date]);
        
        return tempAlarm;
    }
    return  Nil;
}

-(void)BubbleSort:(NSMutableArray *)list{
    
    for (int j = 1; j<= [list count]; j++) {
        for(int i = 0 ;i < j ; i++){
            if(i == [list count]-1)return;
            NSDate * a1 = ((Alarm*)[list objectAtIndex:i]).date ;
            NSDate * a2 = ((Alarm*)[list objectAtIndex:i+1]).date;
            if([self getTimeInterval:a1] < [self getTimeInterval:a2]){
                [list exchangeObjectAtIndex:i withObjectAtIndex:i+1];
            }
        }
    }
}
// cancel alarm and remove the localNotificaiton for a Alarm
- (void) removeAlarm:(Alarm *) alarm
{
    [Utility removeNotification:alarm.notification];
}


- (NSInteger) countOfAlarmList
{
    return [_alarmList count];
}

@end
