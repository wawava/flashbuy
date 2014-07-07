//
//  TDHttpManager.h
//  UnionpayCard
//
//  Created by towne on 14-2-20.
//  Copyright (c) 2014年 Frodo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FNblock)(NSURLSessionDataTask *task, id responseObject, NSError* anError);

typedef void(^FNcompletionBlock)(id responseObject);


@interface FNhttpClient : AFHTTPSessionManager


+ (FNhttpClient *)sharedClient;


- (void)processCommand:(FNhttpCommand * ) command callback:(FNblock)aCallback;



@end
