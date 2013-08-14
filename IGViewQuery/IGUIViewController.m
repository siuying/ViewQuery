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
#import "IGViewWrapper.h"

@interface IGUIViewController ()

@end

@implementation IGUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // search by accessibilityIdentifier
    $(self, @"#label").each(^(UILabel* label){
        label.text = [label.text stringByAppendingFormat:@" %@", @"+"];
    });
    
    // Find last label in #header and append "(L)" to its text
    $(self, @"#header UILabel").last.each(^(UILabel* label){
        label.text = [label.text stringByAppendingFormat:@" %@", @"(L)"];
    });
    
    // Find a button with accessibilityLabel "Button 2" and change the name to button 2b
    $(self, @"[accessibilityLabel == 'Button 2']").each(^(UIButton* button){
        [button setTitle:@"button 2b" forState:UIControlStateNormal];
    });

    // set value of text field having tag 3 to "Hello World"
    $(self, @"UITextField[tag == 3]").each(^(UITextView* textField){
        textField.text = @"Hello World";
    });

    // find label under #form that having text 'User', and set their background color to blue
    $(self, @"#form UILabel[text == 'User']").each(^(UIView* view){
        NSLog(@"view: %@", view);
        view.backgroundColor = [UIColor blueColor];
    });

    // query without shorthand
    IGViewQuerify(self).query(@"#label2").each(^(UILabel* label){
        label.text = [label.text stringByAppendingFormat:@" %@", @"*"];
    });
}

@end
