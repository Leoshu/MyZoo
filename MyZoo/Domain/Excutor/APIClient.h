//
//  APIClient.h
//  MyZoo
//
//  Created by Leo_hsu on 2018/10/14.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QTTopLevel.h"

@interface APIClient : NSObject

+ (void)requestAnimal:(int)limit andOffset:(int)offset withCompleteBlock:(void (^) (NSArray<QTResultResult *> *objects))complete;

@end
