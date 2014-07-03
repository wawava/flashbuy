//
//  FNAppDelegate.m
//  flashbuy
//
//  Created by towne on 7/3/14.
//  Copyright (c) 2014 com.feiniu. All rights reserved.
//

#import "FNAppDelegate.h"
#import "FNHomeVC.h"

@implementation FNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // create tab bar controller
//    _tabbarController = [RDVTabBarController new];
//    NSArray *viewControllers = @[[self ncWithVC:[TDHomeVC new]]
//                                 , [self ncWithVC:[TDLogVendorsVCViewController new]]
//                                 , [self ncWithVC:[TDProfileVC new]]
//                                 , [self ncWithVC:[TDSettingsVC new]]];
//    _tabbarController.viewControllers = viewControllers;
//    [self customizeTabBarForController:_tabbarController];
//    
//    _window.rootViewController = _tabbarController;
    
    [_window addSubview:[UIView new]];
    
    _window.rootViewController = [self ncWithVC:[FNhomeVC new]];
    
    [self.window makeKeyAndVisible];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [self customizeInterface];
    
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


@end
