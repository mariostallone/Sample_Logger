//
//  MyCustomFormatter.h
//  Sample_Logger
//
//  Created by Mario Stallone on 16/12/12.
//  Copyright (c) 2012 Mario Stallone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDLog.h"

@interface MyCustomFormatter : NSObject <DDLogFormatter>
{
    int atomicLoggerCount;
    NSDateFormatter *threadUnsafeDateFormatter;
}
@end
