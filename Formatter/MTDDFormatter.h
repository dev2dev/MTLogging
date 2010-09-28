//
//  MTDDFormatter.h
//  myell0w-helper
//
//  Created by Matthias Tretter on 26.09.10.
//  Copyright 2010 YellowSoft. All rights reserved.
//
// Credits go to Peter Steinberger for his post on Custom CocoaLumberJack-Formatters:
// http://petersteinberger.com/2010/09/custom-formatter-for-the-cocoalumberjack-logging-framework/

#import "DDLog.h"

@interface MTDDFormatter : NSObject <DDLogFormatter> {
	NSDateFormatter *dateFormatter_;
}

@end