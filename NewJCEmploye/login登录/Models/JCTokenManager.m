//
//  JCTokenManager.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/4/13.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCTokenManager.h"

NSString *const TOKEN_KEY = @"token";
NSString *const USERID_KEY = @"userid";
NSString *const USERORGID_KEY = @"userorgid";
NSString *const USERTYPE_KEY = @"userType";
NSString *const UID_KEY = @"uID";
NSString *const  Financial_KEY = @"financial";
NSString *const  Dealerstaff_KEY = @"Dealerstaff";
NSString *const  Dealer_KEY = @"Dealer";

@implementation JCTokenManager

// 存储token
+(void)saveToken:(NSString *)tokenString
{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    NSData *tokenData = [NSKeyedArchiver archivedDataWithRootObject:tokenString];
    [userDefaults setObject:tokenData forKey:TOKEN_KEY];
    [userDefaults synchronize];
}

// 读取token
+(NSString *)getToken
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *tokenData = [userDefaults objectForKey:TOKEN_KEY];
    NSString *token = [NSKeyedUnarchiver unarchiveObjectWithData:tokenData];
    [userDefaults synchronize];
    return token;
}

// 清空token
+(void)cleanToken
{
    NSUserDefaults *UserLoginState = [NSUserDefaults standardUserDefaults];
    [UserLoginState removeObjectForKey:TOKEN_KEY];
    [UserLoginState synchronize];
}

// 存储userID
+(void)saveUser:(NSString *)userID
{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    NSData *tokenData = [NSKeyedArchiver archivedDataWithRootObject:userID];
    [userDefaults setObject:tokenData forKey:USERID_KEY];
    [userDefaults synchronize];
}

// 读取userID
+(NSString *)getUserID
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *tokenData = [userDefaults objectForKey:USERID_KEY];
    NSString *token = [NSKeyedUnarchiver unarchiveObjectWithData:tokenData];
    [userDefaults synchronize];
    return token;
}

// 清空userID
+(void)cleanUserID
{
    NSUserDefaults *UserLoginState = [NSUserDefaults standardUserDefaults];
    [UserLoginState removeObjectForKey:USERID_KEY];
    [UserLoginState synchronize];
}

//储存orgID  USERORGID_KEY
+(void)saveUserOrg:(NSString *)orgID {
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    NSData *tokenData = [NSKeyedArchiver archivedDataWithRootObject:orgID];
    [userDefaults setObject:tokenData forKey:USERORGID_KEY];
    [userDefaults synchronize];
}

//获取userID
+(NSString *)getUserOrgID {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *tokenData = [userDefaults objectForKey:USERORGID_KEY];
    NSString *token = [NSKeyedUnarchiver unarchiveObjectWithData:tokenData];
    [userDefaults synchronize];
    return token;
}

// 清空userID
+(void)cleanUserOrgID {
    NSUserDefaults *UserLoginState = [NSUserDefaults standardUserDefaults];
    [UserLoginState removeObjectForKey:USERORGID_KEY];
    [UserLoginState synchronize];
}


//储存类型
+(void)saveUserType:(NSString *)type;
{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    NSData *tokenData = [NSKeyedArchiver archivedDataWithRootObject:type];
    [userDefaults setObject:tokenData forKey:USERTYPE_KEY];
    [userDefaults synchronize];
}

//获取user类型
+(NSString *)getUserType{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *tokenData = [userDefaults objectForKey:USERTYPE_KEY];
    NSString *token = [NSKeyedUnarchiver unarchiveObjectWithData:tokenData];
    [userDefaults synchronize];
    return token;
}

//清空user类型
+(void)cleanUserType{
    NSUserDefaults *UserLoginState = [NSUserDefaults standardUserDefaults];
    [UserLoginState removeObjectForKey:USERTYPE_KEY];
    [UserLoginState synchronize];
}

//储存服务业务员ID
+(void)saveUserID:(NSString *)uid{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    NSData *tokenData = [NSKeyedArchiver archivedDataWithRootObject:uid];
    [userDefaults setObject:tokenData forKey:UID_KEY];
    [userDefaults synchronize];
}

//获取服务业务员ID
+(NSString *)getUID{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *tokenData = [userDefaults objectForKey:UID_KEY];
    NSString *token = [NSKeyedUnarchiver unarchiveObjectWithData:tokenData];
    [userDefaults synchronize];
    return token;
}

//清空服务业务员ID
+(void)cleanUID{
    NSUserDefaults *UserLoginState = [NSUserDefaults standardUserDefaults];
    [UserLoginState removeObjectForKey:UID_KEY];
    [UserLoginState synchronize];
}
//储存是否是财务
+(void)saveFinancial:(NSString *)isFinancial {
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    NSData *tokenData = [NSKeyedArchiver archivedDataWithRootObject:isFinancial];
    [userDefaults setObject:tokenData forKey:Financial_KEY];
    [userDefaults synchronize];
}

//获取是否是财务
+(NSString * )sgetFinancial{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *tokenData = [userDefaults objectForKey:Financial_KEY];
    NSString *token = [NSKeyedUnarchiver unarchiveObjectWithData:tokenData];
    [userDefaults synchronize];
    return token;
}

//清空是否是财务
+(void)cleanFinancial{
    
    NSUserDefaults *UserLoginState = [NSUserDefaults standardUserDefaults];
    [UserLoginState removeObjectForKey:Financial_KEY];
    [UserLoginState synchronize];
}

//储存是否是经销商员工
+(void)saveDealerstaff:(NSString *)Dealerstaff{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    NSData *tokenData = [NSKeyedArchiver archivedDataWithRootObject:Dealerstaff];
    [userDefaults setObject:tokenData forKey:Dealerstaff_KEY];
    [userDefaults synchronize];
}

//获取是否是经销商员工
+(NSString * )sgetDealerstaffl{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *tokenData = [userDefaults objectForKey:Dealerstaff_KEY];
    NSString *token = [NSKeyedUnarchiver unarchiveObjectWithData:tokenData];
    [userDefaults synchronize];
    return token;
}

//清空是否是经销商员工
+(void)cleanDealerstaff{
    NSUserDefaults *UserLoginState = [NSUserDefaults standardUserDefaults];
    [UserLoginState removeObjectForKey:Dealerstaff_KEY];
    [UserLoginState synchronize];
}


//储存是否是经销商
+(void)saveDealer:(NSString *)Dealer {
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    NSData *tokenData = [NSKeyedArchiver archivedDataWithRootObject:Dealer];
    [userDefaults setObject:tokenData forKey:Dealer_KEY];
    [userDefaults synchronize];
    
}

//获取是否是经销商
+(NSString * )sgetDealer{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *tokenData = [userDefaults objectForKey:Dealer_KEY];
    NSString *token = [NSKeyedUnarchiver unarchiveObjectWithData:tokenData];
    [userDefaults synchronize];
    return token;
}

//清空是否是经销商
+(void)cleanDealer{
    NSUserDefaults *UserLoginState = [NSUserDefaults standardUserDefaults];
    [UserLoginState removeObjectForKey:Dealer_KEY];
    [UserLoginState synchronize];
}


@end
