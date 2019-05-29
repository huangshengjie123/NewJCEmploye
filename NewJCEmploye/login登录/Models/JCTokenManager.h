//
//  JCTokenManager.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/4/13.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCTokenManager : NSObject


//储存token
+(void)saveToken:(NSString *)tokenString;

//获取token
+(NSString *)getToken;

// 清空token
+(void)cleanToken;

//储存userID
+(void)saveUser:(NSString *)userID;

//获取userID
+(NSString *)getUserID;

// 清空userID
+(void)cleanUserID;

//储存orgID
+(void)saveUserOrg:(NSString *)orgID;

//获取userID
+(NSString *)getUserOrgID;

// 清空userID
+(void)cleanUserOrgID;

//储存类型
+(void)saveUserType:(NSString *)type;

//获取user类型
+(NSString *)getUserType;

//清空user类型
+(void)cleanUserType;

//储存服务业务员ID
+(void)saveUserID:(NSString *)uid;

//获取服务业务员ID
+(NSString *)getUID;

//清空服务业务员ID
+(void)cleanUID;

//储存是否是财务
+(void)saveFinancial:(NSString *)isFinancial;

//获取是否是财务
+(NSString * )sgetFinancial;

//清空是否是财务
+(void)cleanFinancial;

//储存是否是经销商员工
+(void)saveDealerstaff:(NSString *)Dealerstaff;

//获取是否是经销商员工
+(NSString * )sgetDealerstaffl;

//清空是否是经销商员工
+(void)cleanDealerstaff;

//储存是否是经销商
+(void)saveDealer:(NSString *)Dealer ;

//获取是否是经销商
+(NSString * )sgetDealer;

//清空是否是经销商
+(void)cleanDealer;

@end
