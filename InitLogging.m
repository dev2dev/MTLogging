//
//  InitLogging.m
//  MTLogging
//
//  Created by Matthias Tretter on 28.09.10.
//  Copyright 2010 YellowSoft. All rights reserved.
//

#import "InitLogging.h"
#import "MTDDFormatter.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"


//=========================================================== 
#pragma mark -
#pragma mark Logging
//=========================================================== 

inline void InitDefaultLogger() 
{
	// Setup default logging (with our custom formatter)
	
	MTDDFormatter *formatter = [[MTDDFormatter alloc] init];
	
	[[DDASLLogger sharedInstance] setLogFormatter:formatter];
	[[DDTTYLogger sharedInstance] setLogFormatter:formatter];
	
	[DDLog addLogger:[DDASLLogger sharedInstance]];
	[DDLog addLogger:[DDTTYLogger sharedInstance]];
	
	[formatter release];
}