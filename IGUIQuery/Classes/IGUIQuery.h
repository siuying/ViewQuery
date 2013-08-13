//
//  IGUIQuery.h
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DEIgor.h"
#import "UIView+UIQuery.h"
#import "UIViewController+UIQuery.h"

extern IGUIQuery* IGUIQuerify(id<NSObject> object);

@interface IGUIQuery : NSObject

@property (nonatomic, strong) NSArray* views;

-(id) initWithRootView:(UIView*)view query:(NSString*)query;

-(id) initWithView:(UIView*)view;

-(id) initWithViews:(NSArray*)views;

+(id) queryWithRootView:(UIView*)view query:(NSString*)query;

+(id) queryWithView:(UIView*)view;

+(id) queryWithViews:(NSArray*)views;

@end
