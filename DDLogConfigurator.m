//
//  DDLogConfigurator.m
//  Sample_Logger
//
//  Created by Mario Stallone on 16/12/12.
//  Copyright (c) 2012 Mario Stallone. All rights reserved.
//

#import "DDLogConfigurator.h"
#import "MyCustomFormatter.h"

@implementation DDLogConfigurator

+(void)configure
{
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                              NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:@"DDLogConfiguration.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:@"DDLogConfiguration" ofType:@"plist"];
    }
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
                                          propertyListFromData:plistXML
                                          mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                          format:&format
                                          errorDescription:&errorDesc];

    [[DDTTYLogger sharedInstance] setLogFormatter:[MyCustomFormatter new]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    if([temp objectForKey:@"FileLogger"])
    {
        DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
        [fileLogger setRollingFrequency:60*30*30];
        [DDLog addLogger:fileLogger];
    }
}

@end
