//
//  AppDelegate.m
//  Sample_Logger
//
//  Created by Mario Stallone on 16/12/12.
//  Copyright (c) 2012 Mario Stallone. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [DDLogConfigurator configure];
    DDLogVerbose(@"Sample Log");
    DDLogInfo(@"Sample Log");
    DDLogWarn(@"Sample Log");
    DDLogError(@"Sample Log");
}

@end
