//
//  IGUIAppDelegate.h
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IGUIViewController;

@interface IGUIAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) IGUIViewController *viewController;

@end
