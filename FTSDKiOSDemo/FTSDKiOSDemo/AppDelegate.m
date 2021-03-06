//
//  AppDelegate.m
//  FTSDKiOSDemo
//
//  Created by 胡蕾蕾 on 2019/12/13.
//  Copyright © 2019 hll. All rights reserved.
//

#import "AppDelegate.h"
#import <FTMobileAgent.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSProcessInfo *processInfo = [NSProcessInfo processInfo];
    NSString *url = [processInfo environment][@"ACCESS_SERVER_URL"];
    NSString *appid = [processInfo environment][@"APP_ID"];
    if (url) {
        FTMobileConfig *config = [[FTMobileConfig alloc]initWithMetricsUrl:url];
        config.appid = appid;
        config.enableSDKDebugLog = YES;
        config.eventFlowLog = YES;
        config.networkTrace = YES;
        config.enableTrackAppCrash = YES;
        config.enableTrackAppANR = YES;
        config.enableTrackAppUIBlock = YES;
        [FTMobileAgent startWithConfigOptions:config];
    }
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
