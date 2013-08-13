//
//  IGUIQuery.m
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "IGUIQuery.h"
#import "DEIgor.h"

IGUIQuery* IGUIQuerify(id<NSObject> object) {
    if (!object) {
        return [IGUIQuery queryWithViews:@[]];
    }
    
    if ([object isMemberOfClass:[NSArray class]]) {
        return [IGUIQuery queryWithViews:(NSArray*)object];
    }
    
    if ([object isMemberOfClass:[UIView class]]) {
        return [IGUIQuery queryWithView:(UIView*)object];
    }

    return nil;
}

@implementation IGUIQuery

-(id) initWithRootView:(UIView*)view query:(NSString*)query
{
    return [self initWithViews:[[DEIgor igor] findViewsThatMatchQuery:query inTree:view]];
}

-(id) initWithView:(UIView*)view
{
    return [self initWithViews:@[view]];
}

-(id) initWithViews:(NSArray*)views
{
    self = [super init];
    if (self) {
        _views = views;
    }
    return self;
}

+(id) queryWithRootView:(UIView*)view query:(NSString*)query
{
    return [[self alloc] initWithRootView:view query:query];
}

+(id) queryWithView:(UIView*)view
{
    return [[self alloc] initWithView:view];
}

+(id) queryWithViews:(NSArray*)views
{
    return [[self alloc] initWithViews:views];
}

@end
