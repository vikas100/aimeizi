//
//  JAAppDelegate.m
//  example
//
//  Created by scott on 14-9-7.
//  Copyright (c) 2014年 冯靖. All rights reserved.
//

#import "JAAppDelegate.h"
#import "Reachability.h"
#import <JDStatusBarNotification.h>
@implementation JAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    Reachability* reach = [Reachability reachabilityWithHostname:@"www.qq.com"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    [reach startNotifier];
    
    return YES;
}

-(void)reachabilityChanged:(NSNotification*)note
{
    Reachability * reach = [note object];
    NSString* title = @"网络未连接";
    if([reach isReachable])
    {
        if ([reach isReachableViaWiFi]) {
            title = @"当前wifi已连接";
        }else if([reach isReachableViaWWAN]){
            title = @"当前2g/3g已连接";
        }
    }
    else
    {
        title = @"网络未连接";
    }
    [JDStatusBarNotification showWithStatus:title dismissAfter:2.0
                                  styleName:JDStatusBarStyleDefault];
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

@end
