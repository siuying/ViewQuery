//
//  IGUIViewController.m
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "IGUIViewController.h"
#import "IGUIQuery.h"
#import "UIView+UIQuery.h"
#import "UIViewController+UIQuery.h"

@interface IGUIViewController ()

@end

@implementation IGUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // search by accessibilityIdentifier
    IGUIQuery* q = [IGUIQuerify(self) query:@"#label"];
    NSLog(@"query: %@", q);
    
    q = [IGUIQuerify(self) query:@"#label"];
    NSLog(@"query: %@", q);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    // IGUIQuerify(self)
}

@end
