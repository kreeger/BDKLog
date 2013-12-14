# BDKLog

[![Version](http://cocoapod-badges.herokuapp.com/v/BDKLog/badge.png)](http://cocoadocs.org/docsets/BDKLog)
[![Platform](http://cocoapod-badges.herokuapp.com/p/BDKLog/badge.png)](http://cocoadocs.org/docsets/BDKLog)

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

## Author

Ben Kreeger, ben@kree.gr

## License

BDKLog is available under the MIT license. See the file `license.markdown` for more info.

