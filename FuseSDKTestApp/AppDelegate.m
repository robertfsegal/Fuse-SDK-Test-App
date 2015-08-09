//
//  AppDelegate.m
//  FuseSDKTestApp
//
//  Created by Robert Segal on 2015-08-08.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [FuseSDK startSession:@"" delegate:self withOptions:nil];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)sessionLoginError:(NSError *)_error
{
    NSLog(@"Session login error %@", _error);
}

-(void)sessionStartReceived
{
    NSLog(@"Session start received");
 
    [FuseSDK registerLevel:10];
    
    for (int i = 0 ; i < 10; i++)
    {
        [FuseSDK registerCustomEvent:i withInt:0];
    }
}

-(void)adAvailabilityResponse:(NSNumber *)_available Error:(NSError *)_error
{
    BOOL isAvailable = [_available boolValue];
    
    int error = (int) [_error code];
 
    NSLog(@"isAvailable -> %@, error -> %@", _available, _error);
    
    if (error != FUSE_ERROR_NO_ERROR)
    {
        
    }
    else
    {
        if (isAvailable)
        {
            [FuseSDK showAdForZoneID:@"" options:@{kFuseRewardedAdOptionKey_ShowPreRoll:@NO}];
        }
    }
}

-(void)adWillClose
{
    NSLog(@"%@", @"adWillClose");
}

-(void)onPlayButton
{
    [FuseSDK preloadAdForZoneID:@""];
}

@end
