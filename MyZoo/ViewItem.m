//
//  ViewItem.m
//  MyZoo
//
//  Created by Leo_hsu on 2018/10/14.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "ViewItem.h"

@implementation ViewItem

- (instancetype)init:(Animal *)animal {
    self = [super init];
    if (self) {
        self.name = animal.name;
        self.location = animal.location;
        self.behavior = animal.behavior.length > 0 ? animal.behavior : animal.interpretation;
        self.imgUrl = animal.imgUrl;
    }
    
    return self;
}

@end
