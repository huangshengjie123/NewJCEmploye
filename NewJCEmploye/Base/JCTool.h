//
//  JCTool.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCTool : NSObject
/**
 *  出入库状态
 */
+(NSString *)determinesOutputStatusSringWith:(NSString *)jsonString;

/**
 *  试用单状态
 */
+(NSString *)determinesProbationStatusSringWith:(NSString *)jsonString;

/**
 *  销售单状态
 */
+(NSString *)determinesSellStatusSringWith:(NSString *)jsonString;

/**
 *  工作组状态
 */
+(NSString *)conversionWorkGroup:(NSString *)jsonString;

/**
 *  进货单状态
 */
+(NSString *)changePurchaserOrder:(NSString *)jsonString;

/**
 *  水卡记录状态
 */
+(NSString *)watercardRecord:(NSString *)String;

/**
 *  配送状态
 */
+(NSString *)newDistributionDetails:(NSString *)string;

/**
 *  经销商出库单状态
 */
+(NSString *)dealerdelivery:(NSString *)string;

/**
 *  经销商支持
 */
+(NSString *)applicationSupport:(NSString *)string;

/**
 *  退货状态
 */
+(NSString *)tuihuo:(NSString *)string;


/**
 *  支付方式
 */
+(NSString *)payment:(NSString *)string;

/**
 *  支付方式
 */
+(NSString *)payment2:(NSString *)string;

/**
 *  报销单状态
 */
+(NSString *)baoxiao:(NSString *)string;

/**
 *  出差单状态
 */
+(NSString *)chucha:(NSString *)string;

/**
 *  利息状态
 */
+(NSString *)lixi:(NSString *)string;


/**
 * 消息状态
 */
+(NSString *)xiaoxi:(NSString *)string;



@end
