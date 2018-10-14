//
//  APIClient.m
//  MyZoo
//
//  Created by Leo_hsu on 2018/10/14.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "APIClient.h"
#import "AFNetworking.h"


@implementation APIClient

+ (void)requestAnimal:(int)limit andOffset:(int)offset withCompleteBlock:(void (^) (NSArray<QTResultResult *> *objects))complete {
    NSString *URLString = @"https://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=a3e2b221-75e0-45c1-8f97-75acbd43d613";
    NSDictionary *parameters = @{@"limit": [NSNumber numberWithInt:limit],
                                 @"offset": [NSNumber numberWithInt:offset]};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = NULL;
        QTTopLevel *databean = [QTTopLevel fromData:responseObject error: &error];
        complete(databean.result.results);
//        for (QTResultResult *result in databean.result.results) {
//            NSLog(@"A_Name_Ch = %@", result.aNameCh);
//            NSLog(@"A_Location = %@", result.aLocation);
//            NSLog(@"A_Behavior = %@", result.aBehavior ? result.aBehavior : @"nil");
//            NSLog(@"A_Interpretation = %@", result.aInterpretation);
//            NSLog(@"A_Pic01_URL = %@", result.aPic01URL);
//            NSLog(@"*********");
//        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@", error.description);
    }];
    [manager invalidateSessionCancelingTasks:NO];
}

@end
