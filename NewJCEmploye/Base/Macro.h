//
//  Macro.h
//  KDReader
//
//  Created by 陳升琪 on 2017/5/16.
//  Copyright © 2017年 陳升琪. All rights reserved.
//
// 常用的宏

//#import "Masonry.h"
//#import "MBProgressHUD.h"
//#import "LCRequestAccessory.h"
//#import "JCTokenManager.h"
//#import "LCNetwork.h"
//#import "JCTool.h"

#ifndef Macro_h
#define Macro_h

#import "Masonry.h"
#import "MBProgressHUD.h"
#import "LCRequestAccessory.h"
#import "JCTokenManager.h"
#import "LCNetwork.h"
#import "JCTool.h"


/**
出入库状态
 */
#define inOutStatus_create      @"output_requst_create"   //生成出库单
#define inOutStatus_check       @"output_requst_check"    //仓库审批检查
#define inOutStatus_rewrite     @"output_requst_rewrite"  //更正出库单
#define inOutStatus_inRewrite     @"input_requst_rewrite"  //更正入库单
#define inOutStatus_codeCheck   @"output_code_check"      //扫码出库
#define inOutStatus_leaderCheck @"output_leader_check"    //主管审批
#define inOutStatus_leaderBack  @"output_leader_back"     //主管打回
#define inOutStatus_leaderBack  @"output_leader_back"     //主管打回
#define inOutStatus_inCodeCheck @"input_code_check"     //入库扫码

#define inOutStatus_stop        @"stop"   //取消
#define inOutStatus_completed   @"completed"   //完成
#define inOutStatus_inputCheck  @"input_requst_check"  //入库检查
/**
 销售单状态
 */
#define sellStatus_create_order      @"sale_create_order"   //创建
#define sellStatus_out_store         @"sale_out_store"   //出库
#define sellStatus_in_store          @"sale_in_store"   //入库
#define sellStatus_out_settle        @"sale_out_settle"   //出库结算
#define sellStatus_stop_settle       @"sale_stop_settle"   //终止结算
#define sellStatus_deliver           @"sale_deliver"   //订单交付
#define sellStatus_pay_back          @"sale_pay_back"   //回款
#define sellStatus_pay_back_rewrite      @"sale_pay_back_rewrite"   //重填回款  sale_leader_check
#define sellStatus_leader_check          @"sale_leader_check"

/**
 试用单状态
 */
#define probation_return_visit      @"probation_return_visit"   //待回访
#define probation_send      @"probation_send"   //送试用
#define probation_out_store      @"probation_out_store"   //出库
#define probation_input_store      @"probation_input_store"   //入库
#define completed      @"completed"   //完成
#define probation_leader_check      @"probation_leader_check"   //领导审批
#define stop      @"stop"   //结束

/**
财务其他收入类型
  */
#define Financial_sale_olds      @"sale_olds"   //卖废品
#define Financial_donation     @"donation"   //乐捐

/**
 财务其他收入状态
 */
#define Financial_create      @"create"   //创建
#define Financial_completed      @"completed"   //完成
#define Financial_cancel     @"cancel"   //取消

/**
 财务支付方式
 */
#define Financial_cash    @"cash"   //现金
#define Financial_alipay     @"alipay"   //支付宝
#define Financial_wx      @"wx"   //微信
#define Financial_card     @"card"   //转账

/**
 报销状态
 */
#define Financial_mgrCheck  @"mgrCheck" //总监审批
#define Financial_financeCheck @"financeCheck" //财务审批
#define Financial_apprCheck @"apprCheck" //确认收款

/**
 出差状态
 */
#define Financial_study    @"study"   //学习
#define Financial_business    @"business"   //销售
#define Financial_train    @"train"   //培训
#define Financial_work    @"work"   //工作支持

/**
 利息
 */
#define Financial_open    @"open"   //开启
#define Financial_split    @"split"   //分期
#define Financial_cancel    @"cancel"   //作废


/**
 屏幕宽度
 屏幕高度
*/
#define KScreen_Width   [UIScreen mainScreen].bounds.size.width
#define KScreen_Height  [UIScreen mainScreen].bounds.size.height
#define JCScreen_Width   [UIScreen mainScreen].bounds.size.width
#define JCScreen_Height  [UIScreen mainScreen].bounds.size.height

#define JCNew64 [[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height

/* 导航栏高度 */
#define NAVIGATION_H  self.navigationController.navigationBar.frame.size.height

/* 状态栏高度 */
#define STATUS_H     [[UIApplication sharedApplication] statusBarFrame].size.height


/**
  获取当前语言
 */
#define KCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])


/**
 项目URL
 */


/**
 颜色
 */
#define GrayColor [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0f]
#define BlackColor [UIColor colorWithRed:37.0/255.0 green:22.0/255.0 blue:24.0/255.0 alpha:1.0f]
#define BlueColor [UIColor colorWithRed:59.0/255.0 green:155.0/255.0 blue:255.0/255.0 alpha:1.0f]

#define MidGrayColor [UIColor colorWithRed:191.0/255.0 green:191.0/255.0 blue:191.0/255.0 alpha:1.0f]

#define JCColorBlack [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0f]
#define JCColorMidGray [UIColor colorWithRed:191.0/255.0 green:191.0/255.0 blue:191.0/255.0 alpha:1.0f]
#define JCColorGray [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0f]
#define JCColorBlue [UIColor colorWithRed:43.0/255.0 green:152.0/255.0 blue:221.0/255.0 alpha:1.0f]
#define JCColorWithe [UIColor whiteColor]

#define JCBackgroundColor [UIColor colorWithRed:241.0/255.0 green:246.0/255.0 blue:253.0/255.0 alpha:1.0f]
#define JCShadowColor [UIColor colorWithRed:192.0/255.0 green:221.0/255.0 blue:254.0/255.0 alpha:1.0f]
/**
 
 字体
 */

#define JCFont12  [UIFont systemFontOfSize:12]
#define JCFont13  [UIFont systemFontOfSize:13]
#define JCFont14  [UIFont systemFontOfSize:14]
#define JCFont15  [UIFont systemFontOfSize:15]
#define JCFont16  [UIFont systemFontOfSize:16]

 

#endif /* Macro_h */
