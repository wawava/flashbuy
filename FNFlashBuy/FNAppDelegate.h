//
//  FNAppDelegate.h
//  flashbuy
//
//  Created by towne on 7/3/14.
//  Copyright (c) 2014 com.feiniu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AMSlideOutNavigationController;

@interface FNAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AMSlideOutNavigationController*	slideoutController;

- (void)setBadgeValue:(NSString*)value forTag:(int)tag;

@end
