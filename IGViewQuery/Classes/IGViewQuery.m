//
//  IGViewQuery.m
//  IGViewQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "IGViewQuery.h"
#import "DEIgor.h"

IGViewWrapper* IGViewQuerify(id<NSObject> object) {
    if (!object) {
        return [IGViewWrapper wrapperWithViews:@[]];
    }
    
    if ([object isKindOfClass:[NSArray class]]) {
        return [IGViewWrapper wrapperWithViews:(NSArray*)object];
    }
    
    if ([object isKindOfClass:[UIView class]]) {
        return [IGViewWrapper wrapperWithView:(UIView*)object];
    }
    
    if ([object isKindOfClass:[UIViewController class]]) {
        UIViewController* controller = (UIViewController*) object;
        return [IGViewWrapper wrapperWithView:controller.view];
    }
    
    return nil;
}

IGViewWrapper* IGViewQuery(id<NSObject> context, NSString* query) {
    return IGViewQuerify(context).query(query);
}

