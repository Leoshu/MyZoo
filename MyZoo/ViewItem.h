//
//  ViewItem.h
//  MyZoo
//
//  Created by Leo_hsu on 2018/10/14.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewItem : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *behavior;
@property (nonatomic, strong) NSString *imgUrl;

- (instancetype)init:(Animal *)animal;

@end

NS_ASSUME_NONNULL_END
