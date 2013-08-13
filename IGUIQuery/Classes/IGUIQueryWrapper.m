//
//  IGUIQueryWrapper.m
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "IGUIQueryWrapper.h"
#import "IGUIQuery.h"
#import "DEIgor.h"

@interface IGUIQueryWrapper()
@end

@implementation IGUIQueryWrapper

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

+(id) wrapperWithRootView:(UIView*)view query:(NSString*)query
{
    return [[self alloc] initWithRootView:view query:query];
}

+(id) wrapperWithView:(UIView*)view
{
    return [[self alloc] initWithView:view];
}

+(id) wrapperWithViews:(NSArray*)views
{
    return [[self alloc] initWithViews:views];
}

#pragma mark -

-(IGUIQueryWrapper*) query:(NSString*)query
{
    __block IGUIQueryWrapper* result = IGUIQuerify(nil);
    [self.views enumerateObjectsUsingBlock:^(UIView* view, NSUInteger idx, BOOL *stop) {
        IGUIQueryWrapper* q = [IGUIQueryWrapper wrapperWithRootView:view query:query];
        result = [result andQuery:q];
    }];
    return result;
}

-(IGUIQueryWrapper*) andQuery:(IGUIQueryWrapper*)query {
    NSMutableArray* views = [NSMutableArray arrayWithArray:self.views];
    [views addObjectsFromArray:query.views];
    return [IGUIQueryWrapper wrapperWithViews:views];
}

#pragma mark - NSObject

-(NSString*) description
{
    return [NSString stringWithFormat:@"<IGUIQueryWrapper views=%@>", self.views];
}

@end
