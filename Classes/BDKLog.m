#import "BDKLog.h"

#import <UIKit/UIColor.h>
#import <libkern/OSAtomic.h>

#import <CocoaLumberjack/DDLog.h>
#import <CocoaLumberjack/DDTTYLogger.h>

/**
Most of this code is from https://github.com/robbiehanson/CocoaLumberjack/wiki/CustomFormatters.
 */
@implementation BDKLog

+ (void)configureLogging {
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setLogFormatter:[BDKLog new]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor colorWithRed:0.20 green:0.62 blue:0.85 alpha:1.0]
                                     backgroundColor:nil forFlag:LOG_FLAG_INFO];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor colorWithRed:0.22 green:0.68 blue:0.66 alpha:1.0]
                                     backgroundColor:nil forFlag:LOG_FLAG_API];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor colorWithRed:0.76 green:0.60 blue:0.12 alpha:1.0]
                                     backgroundColor:nil forFlag:LOG_FLAG_UI];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor colorWithRed:0.59 green:0.65 blue:0.12 alpha:1.0]
                                     backgroundColor:nil forFlag:LOG_FLAG_DATA];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor colorWithRed:0.89 green:0.29 blue:0.26 alpha:1.0]
                                     backgroundColor:Nil forFlag:LOG_FLAG_WARN];
}

- (NSString *)stringFromDate:(NSDate *)date {
    int32_t loggerCount = OSAtomicAdd32(0, &_atomicLoggerCount);

    if (loggerCount <= 1) {
        // Single-threaded mode.

        if (!_threadUnsafeDateFormatter) {
            _threadUnsafeDateFormatter = [NSDateFormatter new];
            [_threadUnsafeDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
            // [_threadUnsafeDateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss:SSS"];
            [_threadUnsafeDateFormatter setDateFormat:@"HH:mm:ss:SSS"];
        }

        return [_threadUnsafeDateFormatter stringFromDate:date];
    }
    else {
        // Multi-threaded mode.
        // NSDateFormatter is NOT thread-safe.

        NSString *key = @"BDKLog_NSDateFormatter";

        NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
        NSDateFormatter *dateFormatter = threadDictionary[key];

        if (dateFormatter == nil) {
            dateFormatter = [NSDateFormatter new];
            [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
            [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss:SSS"];
            threadDictionary[key] = dateFormatter;
        }

        return [dateFormatter stringFromDate:date];
    }
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *logLevel;
    switch (logMessage->logFlag) {
        case LOG_FLAG_ERROR : logLevel = @"E"; break;
        case LOG_FLAG_WARN  : logLevel = @"W"; break;
        case LOG_FLAG_INFO  : logLevel = @"I"; break;
//        case LOG_FLAG_DEBUG : logLevel = @"D"; break;
        default             : logLevel = @"V"; break;
    }

    NSString *dateAndTime = [self stringFromDate:(logMessage->timestamp)];
    NSString *logMsg = logMessage->logMsg;

    return [NSString stringWithFormat:@"%@ %@ | %@\n", logLevel, dateAndTime, logMessage->logMsg];
}

- (void)didAddToLogger:(id<DDLogger>)logger {
    OSAtomicIncrement32(&_atomicLoggerCount);
}

- (void)willRemoveFromLogger:(id<DDLogger>)logger {
    OSAtomicDecrement32(&_atomicLoggerCount);
}

@end
