//
//  NSArray+UIQuery.m
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "NSArray+UIQuery.h"
#import "IGUIQuery.h"

@implementation NSArray (UIQuery)

-(IGUIQuery*) uiq_query
{
    [self enumerateObjectsUsingBlock:^(UIView* view, NSUInteger idx, BOOL *stop) {
        if (![view isMemberOfClass:[UIView class]]) {
            @throw [NSException exceptionWithName:@"IGUIQueryInvalidQueryExcetion"
                                           reason:@"UIQuery expects only UIView or subclasses in the array"
                                         userInfo:nil];
        }
    }];

    return [IGUIQuery queryWithViews:self];
}

@end
