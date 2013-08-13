# IGViewQuery

A lightweight jQuery style view selector library for UIKit, based on [Igor](https://github.com/dhemery/igor).

## Usage

Add these two lines to top of your view controller implementation:

```objective-c
#define IG_VIEWQUERY_USE_SHORTHAND
#import "IGViewQuery.h"
```

Then use $(__viewOrViewController__, __query__) to create query:

```objective-c
    // iterate with query
    [$(self, @"#form > UIView > UILabel[text == 'User']") each:^(UIView* view){
        view.backgroundColor = [UIColor blueColor];
    }];
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
