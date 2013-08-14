//
//  IGViewWrapper.h
//  IGViewQuerify
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^IGViewWrapperArrayIteratorBlock)(id view);

@interface IGViewWrapper : NSObject

@property (nonatomic, copy, readonly) IGViewWrapper* (^query)(NSString*);
@property (nonatomic, copy, readonly) IGViewWrapper* (^and)(IGViewWrapper*);
@property (nonatomic, copy, readonly) IGViewWrapper* (^each)(IGViewWrapperArrayIteratorBlock);
@property (nonatomic, copy, readonly) IGViewWrapper* first;
@property (nonatomic, copy, readonly) IGViewWrapper* last;

-(instancetype) initWithView:(UIView*)view;

-(instancetype) initWithViews:(NSArray*)views;

+(instancetype) wrapperWithView:(UIView*)view;

+(instancetype) wrapperWithViews:(NSArray*)views;

@end