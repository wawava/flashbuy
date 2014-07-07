//
//  FNAppDelegate.m
//  flashbuy
//
//  Created by towne on 7/3/14.
//  Copyright (c) 2014 com.feiniu. All rights reserved.
//

#import "FNAppDelegate.h"
#import "FNHomeVC.h"
#import "AMSlideOutNavigationController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation FNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
	UIViewController* controller;
	
	[[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0.37 green:0.41f blue:0.48f alpha:1.0f]];
	
	self.slideoutController = [AMSlideOutNavigationController slideOutNavigation];
    
	if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
		[self.slideoutController setSlideoutOptions:[AMSlideOutGlobals defaultFlatOptions]];
	} else {
		[self.slideoutController setSlideoutOptions:
		 @{
		   AMOptionsAnimationShrink: @NO,
		   AMOptionsAnimationDarken: @NO,
		   AMOptionsAnimationSlide: @YES,
		   AMOptionsCellBackground: [UIColor clearColor],
		   AMOptionsAnimationSlidePercentage: @0.7f,
		   AMOptionsEnableShadow : @YES,
		   AMOptionsBadgeShowTotal: @YES,
           // Want inset cell widths? uncomment and set size of gap that goes on both sides
           //AMOptionsTableInsetX : @(10),
		   // Want a custom cell? uncomment and use your own class that inherits from AMSlideTableCell
		   //AMOptionsTableCellClass: @"CustomCell",
		   AMOptionsHeaderFont : [UIFont systemFontOfSize:14]
		   }];
	}
	
	// Add a first section
	[self.slideoutController addSectionWithTitle:@"FIRST SECTION"];
	
	controller = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
	
	NSString* icon1 = @"icon1.png";
	if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
		icon1 = @"icon1b.png";
	}
	NSString* icon2 = @"icon2.png";
	if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
		icon2 = @"icon2b.png";
	}
	
	[self.slideoutController addViewControllerToLastSection:controller tagged:1 withTitle:@"First View" andIcon:icon1];
	
	controller = [FNhomeVC new];
	[self.slideoutController addViewControllerToLastSection:controller tagged:2 withTitle:@"Second View" andIcon:icon2];
	
	// Add a second section
	[self.slideoutController addSectionWithTitle:@"SECOND SECTION"];
    
	// Add two viewcontrollers to the second section (with lazy initialization)
    
	[self.slideoutController addViewControllerClassToLastSection:[FirstViewController class]
                                                     withNibName:@"FirstViewController"
                                                          tagged:3
                                                       withTitle:@"First View"
                                                         andIcon:[UIImage imageNamed:icon1]
                                                    beforeChange:^{
                                                        NSLog(@"Changing viewController");
                                                    } onCompletition:^{
                                                        NSLog(@"Done");
                                                    }];
	
//	[self.slideoutController addViewControllerClassToLastSection:[FNhomeVC class] withNibName:@"FNhomeVC" tagged:4 withTitle:@"Second View" andIcon:icon2];
    
	/* To use a custom header: */
    //	[self.slideoutController addSectionWithTitle:@"" andHeaderClassName:@"CustomHeader" withHeight:5];
	
	[self.slideoutController addActionToLastSection:^{} // Some action
											 tagged:5
										  withTitle:@"Action"
											andIcon:@""];
	
	[self.window setRootViewController:self.slideoutController];
    [self.window makeKeyAndVisible];
	
	[self.slideoutController setBadgeTotalValue:@"1"];
    
    //    [TDAPIEngineTest run];
    
    [FNutil findFonts];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(UINavigationController *)ncWithVC:(UIViewController *)aVC {
    if (aVC) {
        return [[UINavigationController alloc] initWithRootViewController:aVC];
    }
    
    return nil;
}


- (void)customizeInterface {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    if ([[[UIDevice currentDevice] systemVersion] integerValue] >= 7.0) {
        [navigationBarAppearance setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_tall"]
                                      forBarMetrics:UIBarMetricsDefault];
    } else {
        [navigationBarAppearance setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar"]
                                      forBarMetrics:UIBarMetricsDefault];
    }
    
    navigationBarAppearance.titleTextAttributes = [self naviBarAttributes];
}

-(NSDictionary *)naviBarAttributes {
    
    NSDictionary *textAttributes = nil;
    
    if ([[[UIDevice currentDevice] systemVersion] integerValue] >= 7.0) {
        textAttributes = @{
                           NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
                           NSForegroundColorAttributeName : [UIColor whiteColor],
                           UITextAttributeTextShadowColor : [UIColor grayColor],
                           UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(1, 1)]
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        textAttributes = @{
                           UITextAttributeFont: [UIFont boldSystemFontOfSize:20],
                           UITextAttributeTextColor: [UIColor whiteColor],
                           UITextAttributeTextShadowColor: [UIColor grayColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero]
                           };
#endif
    }
    
    return textAttributes;
}

- (void)setBadgeValue:(NSString*)value forTag:(int)tag
{
	[self.slideoutController setBadgeValue:value forTag:tag];
}


@end