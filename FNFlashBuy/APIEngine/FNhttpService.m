//
//  TDHttpService.m
//  UnionpayCard
//
//  Created by towne on 14-3-5.
//  Copyright (c) 2014年 Frodo. All rights reserved.
//

#import "FNhttpService.h"

@implementation FNhttpService

/**
 *  功能:从SEL获取接口名称
 */
+ (NSString *)interfaceNameFromSelector:(SEL)aSelector
{
    if (aSelector)
    {
        NSString *selStr = NSStringFromSelector(aSelector);
        NSRange range = [NSStringFromSelector(aSelector) safeRangeOfString:@":" options:NSLiteralSearch];
        if (range.location != NSNotFound)
        {
            NSString *retStr = [selStr safeSubstringToIndex:range.location];
            return retStr;
        }
    }
    return nil;
}

/**
 *  功能:命令模式调用
 */
+ (void) postCommand :(FNhttpCommand *) command completionBlock:(FNcompletionBlock)aCompletionBlock {
    
    [[FNhttpClient sharedClient] processCommand:command callback:^(NSURLSessionDataTask *task, id responseObject, NSError *anError) {
        if (anError==nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                aCompletionBlock(responseObject);
            });
        }
        else
            NSLog(@"%@",anError);
    }];
}

@end
