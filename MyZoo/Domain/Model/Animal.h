//
//  Animal.h
//  MyZoo
//
//  Created by Leo_hsu on 2018/10/14.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QTTopLevel.h"

@interface Animal : NSObject

@property (nonatomic, strong, nonnull) NSString *name;
@property (nonatomic, strong, nonnull) NSString *location;
@property (nonatomic, strong, nonnull) NSString *behavior;
@property (nonatomic, strong, nonnull) NSString *interpretation;
@property (nonatomic, strong, nonnull) NSString *imgUrl;

-(instancetype)init:(QTResultResult *)databean;

@end
