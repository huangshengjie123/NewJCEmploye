//
//  HttpTool.h
//  SC_ComponentGallery
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 com.shichuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject

/**
 *  字典转Json
 *  @return json
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

+ (NSDictionary *)JSONStringToNSString:(NSString *)str;

+ (NSMutableArray *)JSONStringToNSMutableArray:(NSString *)str;

+ (NSArray *)JSONStringToNSArrray:(NSString *)str;


/**
 *  get请求
 *
 *  @param urlStr   请求接口
 *  @param params   请求参数
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)getRequestWithURLStr:(NSString *)urlStr params:(NSDictionary *)params success:(void (^)(NSDictionary * responseDic))success failure:(void(^)(NSError* error))failure;

/**
 *  post请求
 *
 *  @param urlStr   请求接口
 *  @param params   请求参数
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)postRequestWithURLStr:(NSString *)urlStr params:(NSDictionary *)params success:(void (^)(NSDictionary * responseDic))success failure:(void(^)(NSError* error))failure;

/**
 *  postJSON请求
 *
 *  @param urlStr   请求接口
 *  @param params   请求参数
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)postJSONRequestWithURLStr:(NSString *)urlStr params:(NSDictionary *)params success:(void (^)(NSDictionary * responseDic))success failure:(void(^)(NSError* error))failure;

/**
 *  postRaw请求
 *
 *  @param urlStr   请求接口
 *  @param params   请求参数
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)postRawRequestWithURLStr:(NSString *)urlStr params:(id)params success:(void (^)(NSDictionary * responseDic))success failure:(void(^)(NSError* error))failure;
/**
 *  delete请求
 *
 *  @param urlStr   请求接口
 *  @param params   请求参数
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)deleteRequestWithURLStr:(NSString *)urlStr params:(NSDictionary *)params success:(void (^)(NSDictionary * responseDic))success failure:(void(^)(NSError* error))failure;
/**
 *  deleteraw请求
 *
 *  @param urlStr   请求接口
 *  @param params   请求参数
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)deleteRawRequestWithURLStr:(NSString *)urlStr params:(NSDictionary *)params success:(void (^)(NSDictionary * responseDic))success failure:(void(^)(NSError* error))failure;
/**
 *  put请求
 *
 *  @param urlStr   请求接口
 *  @param params   请求参数
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)putRequestWithURLStr:(NSString *)urlStr params:(NSDictionary *)params success:(void (^)(NSDictionary * responseDic))success failure:(void(^)(NSError* error))failure;


@end
