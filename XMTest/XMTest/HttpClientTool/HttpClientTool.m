//
//  HttpClientTool.m
//  xinzhangqu
//
//  Created by TONY on 15/6/1.
//  Copyright (c) 2015年 tony. All rights reserved.
//

#import "HttpClientTool.h"
#import "WrongCodeConst.h"
#import "AppDelegate.h"

@implementation HttpClientTool

//get请求
+(void)tl_requestWithActionName:(NSString *)actionName params:(NSDictionary *)params SuccessBlock:(SuccessBlock)successBlock FailureBlock:(FailureBlock)failureBlock
{
    //创建请求地址，包含baseURL和actionName两块
    NSString *URLString = nil;
    if ([actionName hasPrefix:@"http://"]) {
        URLString = [[NSMutableString stringWithFormat:@"%@",actionName] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    else
    {
        URLString = [[NSMutableString stringWithFormat:@"%@%@",MyBaseUrl,actionName] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    //创建请求地址，包含baseURL和actionName两块
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    // Requests 请求Header参数
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    //系统参数
    [session.requestSerializer setValue:@"text/plain; charset=UTF-8" forHTTPHeaderField:@"Content-type"];
    //设置超时时间
    session.requestSerializer.timeoutInterval = 10.0f;
    //创建请求地址，包含baseURL和actionName两块
    
    [session GET:URLString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *result = responseObject ;
        NSString* codeDescription = [HttpClientTool tl_getCodeDescriptionFromCode:result];
        successBlock(responseObject,codeDescription);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"connet"] isEqualToString:@"YES"]) {
            [hudTool showContent:@"请检查您的网络连接" inView:[[UIApplication sharedApplication].delegate window] withDuration:1];
        }
        failureBlock(error);
    }];
}

//post请求
+(void)newTl_requestWithActionName:(NSString *)actionName params:(NSDictionary *)params SuccessBlock:(SuccessBlock)successBlock FailureBlock:(FailureBlock)failureBlock
{
    //创建请求地址，包含baseURL和actionName两块
    NSString *URLString = nil;
    if ([actionName hasPrefix:@"http://"]) {
        URLString = [[NSMutableString stringWithFormat:@"%@",actionName] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    else
    {
        URLString = [[NSMutableString stringWithFormat:@"%@%@",MyNewBaseUrl,actionName] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    //创建请求地址，包含baseURL和actionName两块
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    // Requests 请求Header参数
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    //设置超时时间
    session.requestSerializer.timeoutInterval = 10.0f;
    //创建请求地址，包含baseURL和actionName两块
    
    [session POST:URLString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *result = responseObject ;
        NSString* codeDescription = [HttpClientTool tl_getCodeDescriptionFromCode:result];
        successBlock(responseObject,codeDescription);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"connet"] isEqualToString:@"YES"]) {
            [hudTool showContent:@"请检查您的网络连接" inView:[[UIApplication sharedApplication].delegate window] withDuration:1];
        }
        failureBlock(error);
    }];
}

+(NSString*)tl_getCodeDescriptionFromCode:(NSDictionary*)resultDic
{
    NSString * code = resultDic[@"code"];
    NSString*codeDescription;
    if ([code isEqualToString:@"GOOD"]) {
        codeDescription=GOOD;
    }else if ([code isEqualToString:@"SYS-001"]){
//        codeDescription=SYS_001;
        codeDescription = resultDic[@"content"];
    }else if ([code isEqualToString:@"BUSI-001"]){
        codeDescription=BUSI_001;
    }else if ([code isEqualToString:@"BUSI-101"]){
        codeDescription=BUSI_101;
    }else if ([code isEqualToString:@"BUSI-102"]){
        codeDescription=BUSI_102;
    }else if ([code isEqualToString:@"BUSI-103"]){
        codeDescription=BUSI_103;
    }else if ([code isEqualToString:@"BUSI-104"]){
        codeDescription=BUSI_104;
    }else if ([code isEqualToString:@"BUSI-105"]){
        codeDescription=BUSI_105;
    }else if ([code isEqualToString:@"BUSI-106"]){
        codeDescription=BUSI_106;
    }else if ([code isEqualToString:@"BUSI-107"]){
        codeDescription=BUSI_107;
    }else if ([code isEqualToString:@"BUSI-201"]){
        codeDescription=BUSI_201;
    }else if ([code isEqualToString:@"BUSI-301"]){
        codeDescription=BUSI_301;
    }else if ([code isEqualToString:@"BUSI-302"]){
        codeDescription=BUSI_302;
    }else if ([code isEqualToString:@"BUSI-303"]){
        codeDescription=BUSI_303;
    }else if ([code isEqualToString:@"BUSI-304"]){
        codeDescription=BUSI_304;
    }else if ([code isEqualToString:@"BUSI-501"]){
        codeDescription=BUSI_501;
    }else if ([code isEqualToString:@"BUSI-502"]){
        codeDescription=BUSI_502;
    }else if ([code isEqualToString:@"BUSI-503"]){
        codeDescription=BUSI_503;
    }else if ([code isEqualToString:@"BUSI-504"]){
        codeDescription=BUSI_504;
    }else if ([code isEqualToString:@"BUSI-505"]){
        codeDescription=BUSI_505;
    }else if ([code isEqualToString:@"BUSI-506"]){
        codeDescription=BUSI_506;
    }else if ([code isEqualToString:@"BUSI-507"]){
        codeDescription=BUSI_507;
    }else if ([code isEqualToString:@"BUSI-508"]){
        codeDescription=BUSI_508;
    }else if ([code isEqualToString:@"BUSI-509"]){
        codeDescription=BUSI_509;
    }else if ([code isEqualToString:@"BUSI-510"]){
        codeDescription=BUSI_510;
    }else if ([code isEqualToString:@"BUSI-601"]){
        codeDescription=BUSI_601;
    }else if ([code isEqualToString:@"BUSI-602"]){
        codeDescription=BUSI_602;
    }else if ([code isEqualToString:@"BUSI-603"]){
        codeDescription=BUSI_603;
    }else if ([code isEqualToString:@"BUSI-701"]){
        codeDescription=BUSI_701;
    }else if ([code isEqualToString:@"BUSI-702"]){
        codeDescription=BUSI_702;
    }else if ([code isEqualToString:@"BUSI-703"]){
        codeDescription=BUSI_703;
    }else if ([code isEqualToString:@"BUSI-704"]){
        codeDescription=BUSI_704;
    }else if ([code isEqualToString:@"BUSI-705"]){
        codeDescription=BUSI_705;
    }else if ([code isEqualToString:@"BUSI-801"]){
        codeDescription=BUSI_801;
    }else if ([code isEqualToString:@"BUSI-802"]){
        codeDescription=BUSI_802;
    }else if ([code isEqualToString:@"BUSI-1001"]){
        codeDescription=BUSI_1001;
    }else if ([code isEqualToString:@"BUSI-1101"]){
        codeDescription=BUSI_1101;
    }else{
        NSString *str = resultDic[@"content"];
        if ([str isKindOfClass:[NSString class]]) {
             codeDescription = str;
        }else{
            codeDescription = @"未知错误";

        }
    }
    
    return codeDescription;
}

#pragma mark - 上传图片(包括多图上传)
+ (void)postMultiFileRequestWithActionName:(NSString *)actionName
                                      para:(NSDictionary *)para
                                 fileDatas:(NSArray *)fileDatas
                                   success:(ResultBlock)successBlock
                                   failure:(FailRequestBlock)failureBlock
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    configuration.HTTPMaximumConnectionsPerHost = 8;
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    //系统参数
    [session.requestSerializer setValue:@"text/html;text/plain;multipart/form-data;charset=UTF-8;boundary=----WebKitFormBoundarymKCfTmt8JmMFx9eQ" forHTTPHeaderField:@"content-type"];
    //设置超时时间
    session.requestSerializer.timeoutInterval = 10.0f;
    
    //创建请求地址，包含baseURL和actionName两块
    NSMutableString *URLString = [NSMutableString stringWithFormat:@"%@%@",UpLoadImageUrl,actionName];
    [session POST:URLString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (int i = 0; i < fileDatas.count; i++) {
            
            UIImage *image = fileDatas[i];
            NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
            // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
            // 要解决此问题，
            // 可以在上传时使用当前的系统事件作为文件名
            NSString *fileName = [NSString  stringWithFormat:@"%d%@",i,FileName];
            NSString *name = [NSString  stringWithFormat:@"%d_file",i];
            
            [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:@"image/png"]; //
        }
        
    }
         progress:^(NSProgress * _Nonnull uploadProgress)
     {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         successBlock(responseObject);
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         failureBlock(error);
     }];
}
@end
