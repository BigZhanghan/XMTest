//
//  HttpClientTool.h
//  xinzhangqu
//
//  Created by TONY on 15/6/1.
//  Copyright (c) 2015年 tony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
//#import "AFHTTPRequestOperation.h"        
//#import "AFHTTPRequestOperationManager.h"
//#import "AFHTTPSessionManager.h"

typedef void (^SuccessBlock)(id responseObject,NSString*code);

typedef void (^FailureBlock)(NSError *error);

typedef void (^FailRequestBlock)(NSError *error);

typedef void (^ResultBlock) (NSArray *resultDic);

@interface HttpClientTool : NSObject

+(void)tl_requestWithActionName:(NSString *)actionName
                         params:(NSDictionary *)params
                   SuccessBlock:(SuccessBlock)successBlock
                   FailureBlock:(FailureBlock)failureBlock;

+(void)newTl_requestWithActionName:(NSString *)actionName
                            params:(NSDictionary *)params
                      SuccessBlock:(SuccessBlock)successBlock
                      FailureBlock:(FailureBlock)failureBlock;

+(NSString*)tl_getCodeDescriptionFromCode:(NSDictionary*)resultDic;

/**
 *  multipart 图片上传
 *
 *  @param actionName   服务器地址
 *  @param para         请求参数
 *  @param fileDatas    图片data
 *  @param successBlock 成功回调
 *  @param failureBlock 失败回调
 */
+ (void)postMultiFileRequestWithActionName:(NSString *)actionName
                                      para:(NSDictionary *)para
                                 fileDatas:(NSArray *)fileDatas
                                   success:(ResultBlock)successBlock
                                   failure:(FailRequestBlock)failureBlock;
@end
