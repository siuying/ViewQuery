//
//  UIView+UIQuery.h
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IGUIQuery;

@interface UIView (UIQuery)

-(IGUIQuery*) uiq_query:(NSString*)query;

@end
