# BDKLog

## Requirements

Gotta have [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack) and [XcodeColors](https://github.com/robbiehanson/XcodeColors)!

## Installation

BDKLog is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

``` ruby
pod 'BDKLog'
```

Then, in your `AppDelegate`, add `[BDKLog configureLogging]`, like so:

``` objective-c
#import "AppDelegate.h"
#import <BDKLog/BDKLog.h>
// ...

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // ...

    [BDKLog configureLogging];

    // ...
    [self.window makeKeyAndVisible];
    return YES;
}

@end
```

You may want to add this into your precompiled header, if you're using one.

``` objective-c
#import <BDKLog/BDKLog.h>
static const int ddLogLevel = LOG_LEVEL_INFO | LOG_FLAG_CUSTOM;
```

Then, log away.

``` objective-c
DDLogUI(@"UI-specific logging!");
DDLogData(@"Data logging!");
DDLogAPI(@"Great for logging webservice responses!");
DDLogWarn(@"Careful, too many exclamation points!");
```

You get the idea.

## Author

Ben Kreeger, ben@kree.gr

## License

BDKLog is available under the MIT license. See the file `license.markdown` for more info.

