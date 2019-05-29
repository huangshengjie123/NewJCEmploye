//
//  HttpTool.m
//  SC_ComponentGallery
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 com.shichuang. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"

static NSInteger const timeoutInterval = 60;

static AFHTTPSessionManager *Photomanager;

@implementation HttpTool

/**字典转成Json字符串*/
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSDictionary *)JSONStringToNSString:(NSString *)str
{
    NSString *infoStr = str ;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[infoStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
    return dic;
}

+ (NSMutableArray *)JSONStringToNSMutableArray:(NSString *)str
{
    NSString *infoStr = str ;
    NSMutableArray *arr = [NSJSONSerialization JSONObjectWithData:[infoStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
    return arr;
}

+ (NSArray *)JSONStringToNSArrray:(NSString *)str
{
    NSString *infoStr = str ;
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:[infoStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
    return arr;
}

/**
 *  get请求
 *
 *  @param urlStr   请求接口
 *  @param params   请求参数
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)getRequestWithURLStr:(NSString *)urlStr params:(NSDictionary *)params success:(void (^)(NSDictionary * responseDic))success failure:(void(^)(NSError* error))failure
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    });
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = timeoutInterval;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *newPath = [NSString stringWithFormat:@"%@",urlStr];
    [manager GET:newPath parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        
        if (success)
        {
            NSLog(@"参数:%@\nURL:%@ ",params,newPath);
            success(jsonDic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (failure)
        {
            failure(error);
           
        }
        
    }];
}

/**
 *  post请求
 *
 *  @param urlStr   请求接口
 *  @param params   请求参数
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)postRequestWithURLStr:(NSString *)urlStr params:(NSDictionary *)params success:(void (^)(NSDictionary * responseDic))success failure:(void(^)(NSError* error))failure
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    });
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = timeoutInterval;
    //调出请求头
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
   

    NSString *newPath = [NSString stringWithFormat:@"%@",urlStr];
    [manager POST:newPath parameters:params constructingBodyWithBlock:^(id  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        // 这里可以获取到目前的数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        if (success)
        {
            NSLog(@"params::::%@",params);
            success(jsonDic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (failure)
        {
            
            failure(error);
        }
        
    }];
}
/**
 *  postJSON请求
 *
 *  @param urlStr   请求接口
 *  @param params   请求参数
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)postJSONRequestWithURLStr:(NSString *)urlStr params:(NSDictionary *)params success:(void (^)(NSDictionary * responseDic))success failure:(void(^)(NSError* error))failure {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    // 请求头
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:urlStr parameters:params error:nil];
    request.timeoutInterval = timeoutInterval;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"" forHTTPHeaderField:@"token"];
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error)
        {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            if ([responseObject isKindOfClass:[NSDictionary class]])
            {
                if (success)
                {
                    NSLog(@"参数:%@\nURL:%@ \ndata:%@",params,urlStr,responseObject);
                    if ([responseObject[@"errorCode"] integerValue] == 8002)
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                          
                        });
                        
                    }
                    else
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            success(responseObject);
                        });
                    }
                }
            }
            else
            {
                if (failure)
                {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                       
                    });
                    failure(error);
                }
            }
        }
        else
        {
            if (failure)
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    
                    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                });
                
                failure(error);
            }
        }
        
    }];
    [task resume];
    
}
/**
 *  postRaw请求
 *
 *  @param urlStr   请求接口
 *  @param params   请求参数
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)postRawRequestWithURLStr:(NSString *)urlStr params:(id)params success:(void (^)(NSDictionary * responseDic))success failure:(void(^)(NSError* error))failure {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    });
    
    NSDictionary *headers = @{@"Content-Type": @"application/json",
                               @"token": @""};
    NSData *postData = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    [request setHTTPBody:postData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        });
        if (error)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                
            });
        
        }
        else
        {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            if (httpResponse.statusCode == 200)
            {
                //数据正常返回
                NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                
                NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
                NSError *err;
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
                NSLog(@"参数:%@ \n data:%@",params,dic);
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    success(dic);
                });
                
            }
            else
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
//                    if ([[AppUserProfile sharedInstance].network integerValue] == 1)
//                    {
//                        [MessageView showMessage:KLocalizedString(@"网络中断啦～", nil) withTime:1.5];
//                    }
//                    else
//                    {
//                        [MessageView showMessage:KLocalizedString(@"系统异常，请稍后再试", nil) withTime:1.5];
//                    }
                });
            }
        }
    }];
    [dataTask resume];
    
}
/**
 *  delete请求
 *
 *  @param urlStr   请求接口
 *  @param params   请求参数
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)deleteRequestWithURLStr:(NSString *)urlStr params:(NSDictionary *)params success:(void (^)(NSDictionary * responseDic))success failure:(void(^)(NSError* error))failure {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = timeoutInterval;
    //调出请求头
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:@"" forHTTPHeaderField:@"token"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *newPath = [NSString stringWithFormat:@"%@",urlStr];

    [manager DELETE:newPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        if (success)
        {
            NSLog(@"参数:%@\nURL:%@ \ndata:%@",params,newPath,jsonDic);
            if ([jsonDic[@"errorCode"] integerValue] == 8002)
            {
//                AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//                [appDelegate pushLoginViewController];
            }
            else
            {
                success(jsonDic);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
//            if ([[AppUserProfile sharedInstance].network integerValue] == 1)
//            {
//                [MessageView showMessage:KLocalizedString(@"网络中断啦～", nil) withTime:1.5];
//            }
//            else
//            {
//                [MessageView showMessage:KLocalizedString(@"系统异常，请稍后再试", nil) withTime:1.5];
//            }
            failure(error);
        }
    }];
    
}
/**
 *  deleteraw请求
 *
 *  @param urlStr   请求接口
 *  @param params   请求参数
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)deleteRawRequestWithURLStr:(NSString *)urlStr params:(NSDictionary *)params success:(void (^)(NSDictionary * responseDic))success failure:(void(^)(NSError* error))failure {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    });
    
    NSDictionary *headers = @{@"Content-Type": @"application/json",
                              @"token": @""};
    NSData *postData = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
    [request setHTTPMethod:@"DELETE"];
    [request setAllHTTPHeaderFields:headers];
    [request setHTTPBody:postData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                
//                if ([[AppUserProfile sharedInstance].network integerValue] == 1)
//                {
//                    [MessageView showMessage:KLocalizedString(@"网络中断啦～", nil) withTime:1.5];
//                }
//                else
//                {
//                    [MessageView showMessage:KLocalizedString(@"系统异常，请稍后再试", nil) withTime:1.5];
//                }
            });
        }
        else
        {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                
                if (httpResponse.statusCode == 200)
                {
                    //数据正常返回
                    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    
                    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
                    NSError *err;
                    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
                    NSLog(@"参数:%@ \n data:%@",params,dic);
                    success(dic);
                }
                else
                {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                    });
                }
            });
            
            
        }
    }];
    [dataTask resume];
    

}
/**
 *  put请求
 *
 *  @param urlStr   请求接口
 *  @param params   请求参数
 *  @param success  成功回调
 *  @param failure  失败回调
 */
+ (void)putRequestWithURLStr:(NSString *)urlStr params:(NSDictionary *)params success:(void (^)(NSDictionary * responseDic))success failure:(void(^)(NSError* error))failure {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = timeoutInterval;
    //调出请求头
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:@"" forHTTPHeaderField:@"token"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *newPath = [NSString stringWithFormat:@"%@",urlStr];
    
    [manager PUT:newPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        if (success)
        {
            NSLog(@"参数:%@\nURL:%@ \ndata:%@",params,newPath,jsonDic);
            success(jsonDic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            
            
            failure(error);
        }
    }];
}

/**
 *  上传图片
 *
 *  @param urlStr     请求地址
 *  @param params     表单数据
 *  @param imageArray 图片数组
 *  @param success    成功回调
 *  @param failure    失败回调
 *
 */
+ (void)postRequestWithURLStr:(NSString *)urlStr params:(NSDictionary *)params ImageDataArray:(NSMutableArray *)imageArray IsSingleImg:(BOOL)isSingle success:(void (^)(NSDictionary * responseDic))success failure:(void(^)(NSError* error))failure
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *newPath = [NSString stringWithFormat:@"%@",urlStr];
    [manager POST:newPath parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (isSingle == YES && imageArray.count > 0)
        {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.jpg",str];
            [formData appendPartWithFileData:imageArray[0] name:@"head_portrait" fileName:fileName mimeType:@"image/jpeg"];
        }
        else
        {
            for (int i = 0 ; i < imageArray.count; i ++)
            {
                NSData * imgData = imageArray [i];
                NSString *fileName = [NSString stringWithFormat:@"%d.jpg",i];
                [formData appendPartWithFileData:imgData name:@"sd_photolist" fileName:fileName mimeType:@"image/jpeg"];
            }
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        if (success)
        {
            success(jsonDic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (failure)
        {
//            [MessageView showMessage:KLocalizedString(@"系统异常，请稍后再试", nil) withTime:1.5];
            failure(error);
        }
        
    }];
}

+ (void)formRequestURLStr:(NSString *)urlstr
                     Path:(NSString *)path
               parameters:(NSDictionary *)parameters
              fileContent:(NSDictionary *)files
               completion:(void (^)(id responseDic))complete
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:urlstr parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
     {
         if ([files count])
         {
             [files enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                 
                 if ([obj isKindOfClass:[NSArray class]])
                 {
                     for (NSString *fileUrl in obj)
                     {
                         NSData *fileData = [[NSData alloc] initWithContentsOfFile:fileUrl];
                         NSString *fileName = [fileUrl lastPathComponent];
                         [formData appendPartWithFileData:fileData name:key fileName:fileName mimeType:@""];
                     }
                     
                 }
                 else if ([obj isKindOfClass:[NSString class]])
                 {
                     NSData *fileData = [[NSData alloc] initWithContentsOfFile:obj];
                     NSString *fileName = [obj lastPathComponent];
                     [formData appendPartWithFileData:fileData name:key fileName:fileName mimeType:@""];
                 }
             }];
         }
         
     } progress:^(NSProgress * _Nonnull uploadProgress) {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         
         NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
         if (complete)
         {
             complete(jsonDic);
         }
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         
     }];
}


//为了防止内存泄露
+ (AFHTTPSessionManager *)sharedHttpSession
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Photomanager = [AFHTTPSessionManager manager];
        Photomanager.requestSerializer.timeoutInterval = 10;
        Photomanager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html",nil];
    });
    return Photomanager;
}
#pragma mark 上传单张图片

+ (void)uploadImageWithPath:(NSString *)path image:(UIImage *)image params:(NSDictionary *)params success:(void (^)(id responseDic))complete
{
    NSArray *array = [NSArray arrayWithObject:image];
    [self uploadImageWithPath:path photos:array params:params success:complete];
}

#pragma mark 上传图片

+ (void)uploadImageWithPath:(NSString *)path photos:(NSArray *)photos params:(NSDictionary *)params success:(void (^)(id responseDic))complete
{
    
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPSessionManager *manager = [HttpTool sharedHttpSession];
    [manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (int i = 0; i < photos.count; i ++)
        {
            NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
            formatter.dateFormat=@"yyyyMMddHHmmss";
            NSString *str=[formatter stringFromDate:[NSDate date]];
            NSString *fileName=[NSString stringWithFormat:@"%@.jpg",str];
            UIImage *image = photos[i];
            NSData *imageData = UIImageJPEGRepresentation(image, 0.28);
            [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"upload%d",i+1] fileName:fileName mimeType:@"image/jpeg"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"uploadProgress is %lld,总字节 is %lld",uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *resultCode = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"result_code"]];
        NSString *resultInfo = [responseObject objectForKey:@"result_info"];
        NSLog(@"resultInfo is %@",resultInfo);
        if ([resultCode isEqualToString:@"1"])
        {
            if (complete == nil) return ;
            complete(responseObject);
        }
        else
        {
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
}

#pragma mark - 上传图片

+ (void)uploadImagenew:(UIImage *)successImage URL:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseDic))complete
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    CGFloat imgWidth = successImage.size.width;
    CGFloat imgHieght = successImage.size.height;
    
    if(successImage.size.width > successImage.size.height)  //宽 > 高
    {
        if(imgWidth > 2000)
        {
            imgWidth = successImage.size.width/4;
            imgHieght = successImage.size.height/4;
        }
        if(imgWidth >= 1000)
        {
            imgWidth = successImage.size.width/3;
            imgHieght = successImage.size.height/3;
        }
    }
    else
    {
        if (imgHieght > 3000)
        {
            imgWidth = successImage.size.width/5;
            imgHieght = successImage.size.height/5;
        }
        
        if (imgHieght >= 1500)
        {
            imgWidth = successImage.size.width/3;
            imgHieght = successImage.size.height/3;
        }
    }
    
    UIImage * compressImg = [self imageWithImageSimple:successImage scaledToSize:CGSizeMake(imgWidth, imgHieght)];
    
    NSLog(@"原本尺寸:(%f,%f)   裁剪尺寸:(%f,%f)",successImage.size.width,successImage.size.height,imgWidth,imgHieght);
    
    NSData *data;
    if(UIImagePNGRepresentation(compressImg) == nil)
    {
        data = UIImageJPEGRepresentation(compressImg, 1.0);
    }else
    {
        data = UIImagePNGRepresentation(compressImg);
    }
    
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.png",str];
        
        [formData appendPartWithFileData:data name:@"MIME" fileName:fileName mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        complete(jsonDic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

//压缩图片
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

#pragma mark - 上传图片
+ (void)uploadImageOne:(UIImage *)successImage URL:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseDic))complete
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    CGFloat imgWidth = successImage.size.width;
    CGFloat imgHieght = successImage.size.height;
    
    if(successImage.size.width > successImage.size.height)  //宽 > 高
    {
        if(imgWidth > 2000)
        {
            imgWidth = successImage.size.width/4;
            imgHieght = successImage.size.height/4;
        }
        
        if(imgWidth >= 1000)
        {
            imgWidth = successImage.size.width/3;
            imgHieght = successImage.size.height/3;
        }
        
    }else
    {
       
        if (imgHieght > 3000)
        {
            imgWidth = successImage.size.width/5;
            imgHieght = successImage.size.height/5;
        }
        
        if (imgHieght >= 1500)
        {
            imgWidth = successImage.size.width/3;
            imgHieght = successImage.size.height/3;
        }
    }
    
    
    UIImage * compressImg = [self imageWithImageSimple:successImage scaledToSize:CGSizeMake(imgWidth, imgHieght)];
    
    NSLog(@"原本尺寸:(%f,%f)   裁剪尺寸:(%f,%f)",successImage.size.width,successImage.size.height,imgWidth,imgHieght);
    
    
    NSData *data;
    if(UIImagePNGRepresentation(compressImg) == nil)
    {
        data = UIImageJPEGRepresentation(compressImg, 1.0);
    }else
    {
        data = UIImagePNGRepresentation(compressImg);
    }
    
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg",str];
        
        [formData appendPartWithFileData:data name:@"MIME" fileName:fileName mimeType:@"image/jpeg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        complete(jsonDic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //NSLog(@"operation:%@",task.responseString);
        NSLog(@"%@",error);
    }];
    
    
   
}





@end
