//
//  NSString+GGAddOn.h
//  Gagein
//
//  Created by Dong Yiming on 5/24/13.
//  Copyright (c) 2013 gagein. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GGAddOn)

-(NSString *)stringLimitedToLength:(NSUInteger)aLength;

-(NSString *)stringSeperatedWith:(NSString *)aSeporator componentsCount:(NSUInteger)aCompCount maxLength:(NSUInteger)aMaxLength;

-(BOOL)isCaseInsensitiveEqualToString:(NSString *)aString;

@end
