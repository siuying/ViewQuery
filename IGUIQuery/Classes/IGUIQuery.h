//
//  IGUIQuery.h
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

// define UIQUERY_USE_SHORTHAND to use $ instead of IGUIQuery
#ifdef UIQUERY_USE_SHORTHAND
#define $ IGUIQuery
#endif

@class IGUIQueryWrapper;

extern IGUIQueryWrapper* IGUIQuerify(id<NSObject> object);
extern IGUIQueryWrapper* IGUIQuery(id<NSObject> object, NSString* query);