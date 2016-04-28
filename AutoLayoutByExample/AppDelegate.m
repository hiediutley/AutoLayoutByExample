//
//  AppDelegate.m
//  AutoLayoutByExample
//
//  Created by Hiedi Utley on 4/24/16.
//  Copyright © 2016 Hiedi Utley. All rights reserved.
//

#import "AppDelegate.h"
#import "LandingViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[LandingViewController new]];
    navController.navigationBar.translucent = NO;
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
