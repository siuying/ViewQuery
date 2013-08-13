//
//  IGViewWrapper.m
//  IGViewQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "IGViewWrapper.h"
#import "IGViewQuery.h"
#import "DEIgor.h"

@interface IGViewWrapper()
@end

@implementation IGViewWrapper

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

-(IGViewWrapper*) query:(NSString*)query
{
    __block IGViewWrapper* result = IGViewQuerify(nil);
    [self.views enumerateObjectsUsingBlock:^(UIView* view, NSUInteger idx, BOOL *stop) {
        IGViewWrapper* q = [IGViewWrapper wrapperWithRootView:view query:query];
        result = [result andQuery:q];
    }];
    return result;
}

-(IGViewWrapper*) andQuery:(IGViewWrapper*)query
{
    NSMutableSet* views = [NSMutableSet setWithArray:self.views];
    [views addObjectsFromArray:query.views];
    return [IGViewWrapper wrapperWithViews:[views allObjects]];
}

#pragma mark - NSObject

-(NSString*) description
{
    return [NSString stringWithFormat:@"<IGUIQueryWrapper views=%@>", self.views];
}

@end

@implementation IGViewWrapper (ArrayExtension)

-(IGViewWrapper*) first {
    if ([self.views count] > 0) {
        return IGViewQuerify(self.views[0]);
    } else {
        return IGViewQuerify(nil);
    }
}

-(IGViewWrapper*) last {
    if ([self.views count] > 0) {
        return IGViewQuerify([self.views lastObject]);
    } else {
        return IGViewQuerify(nil);
    }
}

-(IGViewWrapper*) each:(IGViewWrapperArrayIteratorBlock)iterator {
    [self.views enumerateObjectsUsingBlock:^(UIView* view, NSUInteger idx, BOOL *stop) {
        iterator(view);
    }];
    return self;
}

@end
