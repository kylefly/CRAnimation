//
//  CRBaseRequestManager.m
//  CRAnimation
//
//  Created by Bear on 17/2/26.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRBaseRequestManager.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>

static CRBaseRequestManager *kSharedManager;

@implementation CRBaseRequestManager

+ (id)sharedManager
{
    if (!kSharedManager) {
        kSharedManager = [[CRBaseRequestManager alloc] init];
    }
    
    return kSharedManager;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        return self;
    }
    
    return self;
}

- (void)getReuestWithSuffixURLStr:(NSString *)urlStr
                         paraDict:(NSDictionary *)paraDict
                          success:(void (^) (CRResponseBaseModel *responseBaseModel))success
                          failure:(void (^) (NSString *errorMsg))failure
{
    urlStr = [NSString stringWithFormat:@"%@%@", CR_BASE_URL, urlStr];
    
    AFHTTPSessionManager *sessionManager =[AFHTTPSessionManager manager];
    [sessionManager GET:urlStr
             parameters:paraDict
               progress:nil
                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    NSDictionary *responseDict = (NSDictionary *)responseObject;
                    CRResponseBaseModel *responseBaseModel = [CRResponseBaseModel mj_objectWithKeyValues:responseDict];
                    NSLog(@"--responseObject:%@", responseObject);
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"--error:%@", error);
                }];
}

- (void)postReuestWithSuffixURLStr:(NSString *)urlStr
                          paraDict:(NSDictionary *)paraDict
                           success:(void (^) (CRResponseBaseModel *responseBaseModel))success
                           failure:(void (^) (NSString *errorMsg))failure
{
    urlStr = [NSString stringWithFormat:@"%@%@", CR_BASE_URL, urlStr];
    
    AFHTTPSessionManager *sessionManager =[AFHTTPSessionManager manager];
    [sessionManager POST:urlStr
              parameters:paraDict
                progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    NSDictionary *responseDict = (NSDictionary *)responseObject;
                    CRResponseBaseModel *responseBaseModel = [CRResponseBaseModel mj_objectWithKeyValues:responseDict];
                    NSLog(@"--responseObject:%@", responseObject);
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"--error:%@", error);
                }];
}

@end
