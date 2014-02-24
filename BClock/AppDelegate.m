//
//  AppDelegate.m
//  BClock
//
//  Created by 白 斌 on 13-8-31.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import "AppDelegate.h"
#import "MMDrawerController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "CenterClockViewController.h"
#import "AlarmDataController.h"
#import "MMDrawerVisualState.h"


@implementation AppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    LeftViewController * leftDrawer = [[LeftViewController alloc] init];

    
    CenterClockViewController * center = [[CenterClockViewController alloc] init];
    
    RightViewController * rightDrawer = [[RightViewController alloc] init];

    
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:center];
    
    navigationController.navigationBar.tintColor = [UIColor clearColor];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:65/255.0 green:159/255.0 blue:252/255.0 alpha:0.5]];
    
    [navigationController setRestorationIdentifier:@"MMExampleCenterNavigationControllerRestorationKey"];
    
    
    MMDrawerController * _mmDrawerController = [[MMDrawerController alloc]
                           initWithCenterViewController:navigationController
                           leftDrawerViewController:leftDrawer
                           rightDrawerViewController:rightDrawer];
    
    [_mmDrawerController setRestorationIdentifier:@"MMDrawer"];
    
    [_mmDrawerController setMaximumRightDrawerWidth:260];
    [_mmDrawerController setMaximumLeftDrawerWidth:260];
    
    [_mmDrawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [_mmDrawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];

    AlarmDataController * x = [AlarmDataController sharedInstanceMethod];
    x.mmDrawerController= _mmDrawerController;
    
     _window.rootViewController = _mmDrawerController;
    [_window makeKeyAndVisible];
    
    // 当一个提醒处理后，则获得当前最近的未处理的通知，执行处理
    UILocalNotification * localNotif=[launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if(localNotif != Nil)
    {
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    }
    
//    [Utility removeAllNotification];
    
    
    return YES;

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    
    UIApplicationState state = application.applicationState;
    
    if (state == UIApplicationStateActive) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提醒"
                                                         message:notification.alertBody
                                                        delegate:self
                                               cancelButtonTitle:@"Close"
                                               otherButtonTitles:@"OK",nil];
        [alert show];
    }
}


@end
