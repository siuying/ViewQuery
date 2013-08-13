//
//  UIViewController+UIQuery.m
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "UIViewController+UIQuery.h"
#import "IGUIQuery.h"

@implementation UIViewController (UIQuery)

-(IGUIQuery*) uiq_query:(NSString*)query
{
    return [IGUIQuery queryWithRootView:self.view query:query];
}

@end
