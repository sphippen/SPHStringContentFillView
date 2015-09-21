//
//  SPHAppDelegate.m
//  SPHStringContentFillView
//
//  Created by Spencer Phippen on 09/21/2015.
//  Copyright (c) 2015 Spencer Phippen. All rights reserved.
//

#import "SPHAppDelegate.h"

#import "SPHViewController.h"

@implementation SPHAppDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
    UIWindow* win = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [win setRootViewController:[SPHViewController new]];
    [self setWindow:win];
    
    [win makeKeyAndVisible];
    return TRUE;
}

@end
