//
//  InitLogging.h
//  MTLogging
//
//  Created by Matthias Tretter on 28.09.10.
//  Copyright 2010 YellowSoft. All rights reserved.
//


//=========================================================== 
#pragma mark -
#pragma mark Logging
//=========================================================== 

// initializes the ASL & TTY - Logger with Custom Formatter
void InitDefaultLogger();

// Default Logging Level for Debugging-State is Log All
// otherwise log only Warnings and Errors
#ifdef DEBUG
#define SET_DEFAULT_LOG_LEVEL() static const int ddLogLevel = LOG_LEVEL_VERBOSE
#else
#define SET_DEFAULT_LOG_LEVEL() static const int ddLogLevel = LOG_LEVEL_WARN
#endif