//
//  IGUIQuery.m
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "IGUIQuery.h"
#import "DEIgor.h"
#import "IGUIQueryWrapper.h"

IGUIQueryWrapper* IGUIQuerify(id<NSObject> object) {
    if (!object) {
        return [IGUIQueryWrapper wrapperWithViews:@[]];
    }
    
    if ([object isKindOfClass:[NSArray class]]) {
        return [IGUIQueryWrapper wrapperWithViews:(NSArray*)object];
    }
    
    if ([object isKindOfClass:[UIView class]]) {
        return [IGUIQueryWrapper wrapperWithView:(UIView*)object];
    }
    
    if ([object isKindOfClass:[UIViewController class]]) {
        UIViewController* controller = (UIViewController*) object;
        return [IGUIQueryWrapper wrapperWithView:controller.view];
    }
    
    return nil;
}

IGUIQueryWrapper* IGUIQuery(id<NSObject> context, NSString* query) {
    return [IGUIQuerify(context) query:query];
}

