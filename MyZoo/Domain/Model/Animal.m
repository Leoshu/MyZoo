//
//  Animal.m
//  MyZoo
//
//  Created by Leo_hsu on 2018/10/14.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "Animal.h"

@implementation Animal

-(instancetype)init:(QTResultResult *)databean {
    self = [super init];
    if (self) {
        self.name = databean.aNameCh;
        self.location = databean.aLocation;
        self.behavior = databean.aBehavior;
        self.interpretation = databean.aInterpretation;
        self.imgUrl = databean.aPic01URL;
    }
    return self;
}

- (void)setInterpretation:(NSString *)interpretation {
    _interpretation = interpretation;
    if (interpretation.length == 0) {
        _interpretation = @"查無資料";
    }
}

@end
