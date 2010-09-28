//
//  MTDDFormatter.m
//  myell0w-helper
//
//  Created by Matthias Tretter on 26.09.10.
//  Copyright 2010 YellowSoft. All rights reserved.
//

#import "MTDDFormatter.h"
#import "ColorLog.h"


@implementation MTDDFormatter

- (id)init 
{
	if((self = [super init])) {
		dateFormatter_ = [[NSDateFormatter alloc] init];
		
		[dateFormatter_ setFormatterBehavior:NSDateFormatterBehavior10_4];
		[dateFormatter_ setDateFormat:@"yyyy-MM-dd HH:mm:ss:SSS"];
	}
	
	return self;
}

- (void)dealloc
{
	[dateFormatter_ release], dateFormatter_ = nil;
	
	[super dealloc];
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
	NSString *logLevel;
	
	
	switch (logMessage->logFlag) {
		case LOG_FLAG_ERROR: 
			if (IsXcodeColorsEnabled()) {
				logLevel = LCL_RED @"ERROR: ";
			} else {
				logLevel = @"ERROR: "; 
			}
			break;
			
		case LOG_FLAG_WARN:
			if (IsXcodeColorsEnabled()) {
				logLevel = LCL_MAGENTA @"Warning: ";
			} else {
				logLevel = @"Warning: ";
			}
			break;
			
		case LOG_FLAG_INFO:
			logLevel = @"";
			break;
			
		default:
			if (IsXcodeColorsEnabled()) {
				logLevel = LCL_GREEN @"V: ";
			} else {
				logLevel = @"V: ";
			}
			break;
	}
	
	NSString *dateAndTime = [dateFormatter_ stringFromDate:(logMessage->timestamp)];
	NSString *logMsg = logMessage->logMsg;
	
	return  [NSString stringWithFormat:@"%@%@(%@) [%@ %@/%d] %@%@", logLevel, dateAndTime, [logMessage threadID], 
			 [logMessage fileName], [logMessage methodName], logMessage->lineNumber, logMsg, IsXcodeColorsEnabled() ? LCL_RESET : @""];  
}

@end