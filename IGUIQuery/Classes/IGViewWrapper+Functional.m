//
//  IGUIQuery+Functional.m
//  IGUIQuery
//
//  Created by Chong Francis on 13年8月13日.
//  Copyright (c) 2013年 Ignition Soft. All rights reserved.
//

#import "IGViewWrapper+Functional.h"
#import "IGViewQuery.h"

@implementation IGViewWrapper (Functional)

-(IGViewWrapper*) first {
    if ([self.views count] > 0) {
        return IGViewQuerify(self.views[0]);
    } else {
        return IGViewQuerify(nil);
    }
}

-(IGViewWrapper*) last {
    if ([self.views count] > 0) {
        return IGViewQuerify([self.views lastObject]);
    } else {
        return IGViewQuerify(nil);
    }
}

@end
