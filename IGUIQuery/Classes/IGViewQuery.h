//
//  IGViewQuery.h
//  IGViewQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

// define IG_VIEWQUERY_USE_SHORTHAND to use $ instead of IGUIQuery
#ifdef IG_VIEWQUERY_USE_SHORTHAND
#define $ IGViewQuery
#endif

@class IGViewWrapper;

extern IGViewWrapper* IGViewQuerify(id<NSObject> object);

extern IGViewWrapper* IGViewQuery(id<NSObject> object, NSString* query);