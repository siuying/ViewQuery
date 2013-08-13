//
//  IGUIQueryWrapper.h
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IGUIQueryWrapper : NSObject

@property (nonatomic, strong) NSArray* views;

-(id) initWithRootView:(UIView*)view query:(NSString*)query;

-(id) initWithView:(UIView*)view;

-(id) initWithViews:(NSArray*)views;

+(id) wrapperWithRootView:(UIView*)view query:(NSString*)query;

+(id) wrapperWithView:(UIView*)view;

+(id) wrapperWithViews:(NSArray*)views;

-(IGUIQueryWrapper*) query:(NSString*)query;

-(IGUIQueryWrapper*) andQuery:(IGUIQueryWrapper*)query;

@end
