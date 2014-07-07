//
//  NSObject+IOS7UI.m
//  OneStore
//
//  Created by Brick on 13-12-30.
//  Copyright (c) 2013年 OneStore. All rights reserved.
//

#import "NSObject+IOS7UI.h"

@implementation NSObject (IOS7UI)

-(BOOL)aboveIOS7{
    
    float num = [[UIDevice currentDevice].systemVersion floatValue];
    if (num>=7.0) {
        return YES;
    }
    return NO;
}

@end
