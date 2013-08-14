# IGViewQuery

A lightweight jQuery style view selector library for UIKit, based on [Igor](https://github.com/dhemery/igor).

## Usage

Add these two lines to top of your view controller implementation:

```objective-c
#define IG_VIEWQUERY_USE_SHORTHAND
#import "IGViewQuery.h"
```

Then use ``$( ___viewOrViewController___ , ___query___)`` to create query:

```objective-c
// search by accessibilityIdentifier
$(self, @"#label").each(^(UILabel* label){
    label.text = [label.text stringByAppendingFormat:@" %@", @"+"];
});

// Find a button with accessibilityLabel "Button 2" and change the name to button 2b
$(self, @"[accessibilityLabel == 'Button 2']").each(^(UIButton* button){
    [button setTitle:@"button 2b" forState:UIControlStateNormal];
});

// set value of text field having tag 3 to "Hello World"
$(self, @"UITextField[tag == 3]").each(^(UITextView* textField){
    textField.text = @"Hello World";
});

// find label under form that having text 'User', and set their background color to blue
$(self, @"#form UILabel[text == 'User']").each(^(UIView* view){
    NSLog(@"view: %@", view);
    view.backgroundColor = [UIColor blueColor];
});

// query without shorthand
[IGViewWrapper wrapperWithView:self.view].query(@"#label2").each(^(UILabel* label){
    label.text = [label.text stringByAppendingFormat:@" %@", @"*"];
});
```

### What is IGViewWrapper?

- The query (```$()```/```IGViewQuery()```) always return a ```IGViewWrapper```. 
- ```IGViewWrapper``` is an array like object containing UIViews. 
- If nothing is selected in the selector, it's an empty [ ] array-like object.
- You can chain ```methods in IGViewWrapper```.

### Simple query patterns

- ``*`` - universal pattern, all views
- ``classsname`` - member of class pattern, exact match a class
- ``classsname*`` - kind of class pattern , match isKindOf a class
- ``[predicat]`` - predicate pattern
- ``#name`` -  identifier pattern for ``accessibilityIdentifier`` property.

### Relationship Patterns

- ``a b`` — descendant combinator (whitespace)
- ``a (b c) d`` — branch pattern
- ``a > b`` — child combinator
- ``a ~ b`` — sibling combinator

### Subject Marker

- ``a $b c`` —  subject marker marks a pattern as the subject of the enclosing Igor query.

For details, check [Igor Implementation](https://github.com/dhemery/igor/wiki/Implementation-Status).

## FAQ

### Can I set ``accessibilityIdentifier`` (``#identifier``) in Interface Builder?

Not directly. However, it can be set in IB by using the Identity Inspector tab's 'User Defined Runtime Attributes':

    Key Path: accessibilityIdentifier
    Type: String
    Value: Chosen accessibilityIdentifier text

## License

This software is licensed in [MIT License](https://github.com/siuying/ViewQuery/blob/master/LICENSE.txt).
