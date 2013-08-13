//
//  IGUIQuery+Functional.m
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "IGUIQuery+Functional.h"

@implementation IGUIQuery (Functional)

-(IGUIQuery*) first {
    if ([self.views count] > 0) {
        return IGUIQuerify(self.views[0]);
    } else {
        return IGUIQuerify(nil);
    }
}

-(IGUIQuery*) last {
    if ([self.views count] > 0) {
        return IGUIQuerify([self.views lastObject]);
    } else {
        return IGUIQuerify(nil);
    }
}

@end
