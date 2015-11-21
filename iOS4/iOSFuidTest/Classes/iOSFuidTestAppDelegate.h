//
//  iOSFuidTestAppDelegate.h
//  iOSFuidTest
//
//  Created by MINGFEN WANG on 11-11-21.
//  Copyright 2011 no. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iOSFuidTestViewController;

@interface iOSFuidTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iOSFuidTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iOSFuidTestViewController *viewController;

@end

