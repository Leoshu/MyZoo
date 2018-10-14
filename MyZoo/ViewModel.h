//
//  ViewModel.h
//  MyZoo
//
//  Created by Leo_hsu on 2018/10/14.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewItem.h"

@protocol ViewModelCallback

-(void)viewItemDidRefesh:(NSArray<ViewItem *> *)items;

@end

@interface ViewModel : NSObject

@property (nonatomic, weak) id<ViewModelCallback> delegate;

- (void)requestMore;

@end
