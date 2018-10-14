//
//  ViewModel.m
//  MyZoo
//
//  Created by Leo_hsu on 2018/10/14.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "ViewModel.h"
#import "APIClient.h"

static int LIMIT = 30;
static int OFFSET = 30;

@interface ViewModel()

@property NSMutableArray<ViewItem *> *items;

@end

@implementation ViewModel {
    int count;
}



- (instancetype)init {
    self = [super init];
    if (self) {
        [self requestData:LIMIT andOffset: count * OFFSET];
        self.items = [[NSMutableArray<ViewItem *> alloc] initWithCapacity:5];
    }
    return self;
}

- (void)requestMore {
    count ++;
    [self requestData:LIMIT andOffset: count * OFFSET];
}

- (void)requestData:(int)limit andOffset:(int)offset {
    __weak typeof(self) weakSelf = self;
    [APIClient requestAnimal:limit andOffset:offset withCompleteBlock:^(NSArray<QTResultResult *> *objects) {
        for (QTResultResult *obj in objects) {
            Animal *animal = [[Animal alloc] init:obj];
            ViewItem *item = [[ViewItem alloc] init:animal];
            [weakSelf.items addObject:item];
        }
        [weakSelf.delegate viewItemDidRefesh:weakSelf.items];
    }];
}

@end
