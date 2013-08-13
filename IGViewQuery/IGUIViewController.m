//
//  IGUIViewController.m
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "IGUIViewController.h"

#define IG_VIEWQUERY_USE_SHORTHAND
#import "IGViewQuery.h"

@interface IGUIViewController ()

@end

@implementation IGUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // search by accessibilityIdentifier
    IGViewWrapper* q = $(self, @"#label");
    NSLog(@"query: %@", q);
    
    // search by accessibilityLabel
    q = $(self, @"[accessibilityLabel == 'Button 2']");
    NSLog(@"query: %@", q);
    
    // search by tag
    q = $(self, @"[tag == 2]");
    NSLog(@"query: %@", q);
    
    // iterate with query
    [$(self, @"UIView > UILabel[text == 'User']") each:^(UIView* view){
        view.backgroundColor = [UIColor blueColor];
    }];
}

@end
