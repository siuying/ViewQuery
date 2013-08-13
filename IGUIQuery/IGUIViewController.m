//
//  IGUIViewController.m
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "IGUIViewController.h"

#define UIQUERY_USE_SHORTHAND
#import "IGUIQuery.h"

@interface IGUIViewController ()

@end

@implementation IGUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // search by accessibilityIdentifier
    IGUIQueryWrapper* q = $(self, @"#label");
    NSLog(@"query: %@", q);
    
    // search by accessibilityLabel
    q = $(self, @"[accessibilityLabel == 'Button 2']");
    NSLog(@"query: %@", q);
    
    // search by tag
    q = $(self, @"[tag == 2]");
    NSLog(@"query: %@", q);
    
    // search with complex query
    q = $(self, @"#group2 > UILabel");
    NSLog(@"query: %@", q);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    // IGUIQuerify(self)
}

@end
