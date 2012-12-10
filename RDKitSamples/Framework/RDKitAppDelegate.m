//
//  RDKitAppDelegate.m
//  RDKit
//
//  Created by Alexey Dozortsev on 03.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDKitAppDelegate.h"
#import "RDKitSamplesTableController.h"

@implementation RDKitAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIViewController* rootController = [[RDKitSamplesTableController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:rootController];;
    [navigationController.navigationBar setTintColor:[UIColor blackColor]];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

@end
