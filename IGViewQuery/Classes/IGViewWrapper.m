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
@property (nonatomic, strong) NSArray* views;

@end

@implementation IGViewWrapper

-(instancetype) initWithView:(UIView*)view
{
    return [self initWithViews:@[view]];
}

-(instancetype) initWithViews:(NSArray*)views
{
    self = [super init];
    if (self) {
        _views = views;
    }
    return self;
}

+(instancetype) wrapperWithView:(UIView*)view
{
    return [[self alloc] initWithView:view];
}

+(instancetype) wrapperWithViews:(NSArray*)views
{
    return [[self alloc] initWithViews:views];
}

#pragma mark -

-(IGViewWrapper* (^)(NSString*)) query
{
    return ^IGViewWrapper*(NSString* query) {
        __block NSMutableArray* views = [NSMutableArray array];
        [self.views enumerateObjectsUsingBlock:^(UIView* view, NSUInteger idx, BOOL *stop) {
            [views addObjectsFromArray:[[DEIgor igor] findViewsThatMatchQuery:query inTree:view]];
        }];
        self.views = views.copy;
        return self;
    };
}

-(IGViewWrapper* (^)(IGViewWrapper* wrapper)) and
{
    return ^IGViewWrapper* (IGViewWrapper* query) {
        NSMutableArray* views = [NSMutableArray arrayWithArray:self.views];
        [views addObjectsFromArray:query.views];
        self.views = views.copy;
        return self;
    };
}

#pragma mark - NSObject

-(NSString*) description
{
    return [NSString stringWithFormat:@"<IGUIQueryWrapper views=%@>", self.views];
}

#pragma mark - Array Extension

-(IGViewWrapper*) first
{
    if ([self.views count] > 0) {
        return IGViewQuerify(self.views[0]);
    } else {
        return IGViewQuerify(nil);
    }
}

-(IGViewWrapper*) last
{
    if ([self.views count] > 0) {
        return IGViewQuerify([self.views lastObject]);
    } else {
        return IGViewQuerify(nil);
    }
}

-(IGViewWrapper* (^)(IGViewWrapperArrayIteratorBlock)) each
{
    return ^IGViewWrapper* (IGViewWrapperArrayIteratorBlock iterator) {
        [self.views enumerateObjectsUsingBlock:^(UIView* view, NSUInteger idx, BOOL *stop) {
            iterator(view);
        }];
        return self;
    };
}

@end
