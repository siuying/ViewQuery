//
//  UIView+UIQuery.m
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "UIView+UIQuery.h"
#import "IGUIQuery.h"

@implementation UIView (UIQuery)

-(IGUIQuery*) uiq_query:(NSString*)query
{
    return [IGUIQuery queryWithRootView:self query:query];
}

@end