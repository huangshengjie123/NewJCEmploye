//
//  JCTool.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCTool.h"
#import "Macro.h"
@implementation JCTool


+(NSString *)determinesOutputStatusSringWith:(NSString *)jsonString{
    
    
    if ([jsonString  isEqual: inOutStatus_create]) {
        
        return @"完成创建";
    }
    if ([jsonString  isEqual: inOutStatus_check] ) {
        return @"仓库检查";
    }
    
    if ([jsonString isEqualToString:inOutStatus_rewrite]) {
        return @"出库仓库驳回";
    }
    if ([jsonString isEqualToString:inOutStatus_inRewrite]) {
        return @"入库仓库驳回";
    }
    
    if ([jsonString isEqualToString:inOutStatus_codeCheck]) {
        return @"扫码出库";
    }
    if ([jsonString isEqualToString:inOutStatus_leaderCheck]) {
        return @"主管审批中";
    }
    if ([jsonString isEqualToString:inOutStatus_leaderBack]) {
        return @"主管打回";
    }
    
    if ([jsonString isEqualToString:inOutStatus_inCodeCheck]) {
        return @"扫码入库";
    }
    
    if ([jsonString isEqualToString:inOutStatus_stop]) {
        return @"已取消";
    }
    if ([jsonString isEqualToString:inOutStatus_completed]) {
        return @"已完成";
    }
    
    if ([jsonString isEqualToString: inOutStatus_inputCheck]) {
        return @"入库检查";
    }
    if ([jsonString isEqualToString:@"f_output_requst_check"]) {
        return @"仓库检查";
    }
    if ([jsonString isEqualToString:@"f_output_requst_rewrite"]) {
        return @"重填";
    }
    if ([jsonString isEqualToString:@"f_output_code_check"]) {
        return @"扫码出库";
    }
    
    if ([jsonString isEqualToString:@"scrap_leader_check"]) {
        return @"报废审批";
    }
    
    
    return @"未知状态";
}


+(NSString *)determinesProbationStatusSringWith:(NSString *)jsonString{
    
    
    if ([jsonString  isEqual: probation_return_visit]) {
        
        return @"待回访";
    }
    if ([jsonString  isEqual: probation_send] ) {
        return @"送试用";
    }
    
    if ([jsonString isEqualToString:probation_out_store]) {
        return @"出库中";
    }
    
    if ([jsonString isEqualToString:probation_input_store]) {
        return @"入库";
    }
    if ([jsonString isEqualToString:completed]) {
        return @"完成";
    }
    if ([jsonString isEqualToString:probation_leader_check]) {
        return @"领导审批";
    }
    if ([jsonString isEqualToString:stop]) {
        return @"已结束";
    }
    if ([jsonString isEqualToString:@"f_probation_out_store"]) {
        return @"出库";
    }
    if ([jsonString isEqualToString:@"f_probation_send"]) {
        return @"送试用";
    }
    if ([jsonString isEqualToString:@"f_probation_visit"]) {
        return @"回访";
    }
   
    
    return @"未知状态";
}

//#define sellStatus_create_order      @"sale_create_order"   //创建
//#define sellStatus_out_store         @"sale_out_store"   //出库
//#define sellStatus_in_store          @"sale_in_store"   //入库
//#define sellStatus_out_settle        @"sale_out_settle"   //出库结算
//#define sellStatus_stop_settle     @"sale_stop_settle"   //终止结算
//#define sellStatus_deliver      @"sale_deliver"   //订单交付
//#define sellStatus_pay_back      @"sale_pay_back"   //回款
//#define sellStatus_pay_back_rewrite      @"sale_pay_back_rewrite"   //重填回款



+(NSString *)determinesSellStatusSringWith:(NSString *)jsonString{
    
    
    if ([jsonString  isEqual: sellStatus_create_order]) {
        
        return @"待补填订单";
    }
    if ([jsonString  isEqual: sellStatus_out_store] ) {
        return @"出库中";
    }
    
    if ([jsonString isEqualToString:completed]) {
        return @"完成";
    }
    
    if ([jsonString isEqualToString:sellStatus_in_store]) {
        return @"入库中";
    }
    
    if ([jsonString isEqualToString:sellStatus_out_settle]) {
        return @"出库结算";
    }
    if ([jsonString isEqualToString:sellStatus_stop_settle]) {
        return @"终止结算";
    }
    if ([jsonString isEqualToString:sellStatus_deliver]) {
        return @"订单交付";
    }
    if ([jsonString isEqualToString:sellStatus_pay_back]) {
        return @"待回款";
    }
    if ([jsonString isEqualToString:sellStatus_pay_back_rewrite]) {
        return @"重填回款";
    }
    if ([jsonString isEqualToString:stop]) {
        return @"已结束";
    }
    if ([jsonString isEqualToString:sellStatus_leader_check]) {
        return @"领导审批";
    }
    if ([jsonString isEqualToString:@"f_sale_form"]) {
        return @"填写完整销售单";
    }
    if ([jsonString isEqualToString:@"f_sale_out_store"]) {
        return @"出库";
    }
    if ([jsonString isEqualToString:@"f_sale_confirm"]) {
        return @"成交确认";
    }
    
    
    return @"未知状态";

}

+(NSString *)conversionWorkGroup:(NSString *)jsonString{
    
    
    if ([jsonString  isEqual: @"root"]) {
        return @"根工作组";
    }
    if ([jsonString  isEqual: @"mgr"] ) {
        return @"管理组";
    }
    if ([jsonString  isEqual: @"sale"] ) {
        return @"销售组";
    }
    if ([jsonString  isEqual: @"finance"] ) {
        return @"财务组";
    }
    if ([jsonString  isEqual: @"distribution"] ) {
        return @"配送组";
    }

    
    return @"未知状态";
    
}

+(NSString *)changePurchaserOrder:(NSString *)jsonString;
{
    if ([jsonString  isEqual: @"purchase_com_check"]) {
        return @"总监审批";
    }
    if ([jsonString  isEqual: @"purchase_finance_check"]) {
        return @"总公司财务审批";
    }
    if ([jsonString  isEqual: @"purchase_rewrite"]) {
        return @"重填";
    }
    if ([jsonString  isEqual: @"purchase_distribute_check"]) {
        return @"配送部门检查";
    }
    if ([jsonString  isEqual: @"purchase_distribute_confirm"]) {
        return @"配送员确认";
    }
    if ([jsonString  isEqual: @"purchase_out_store"]) {
        return @"货物出库";
    }
    if ([jsonString  isEqual: @"purchase_distributing"]) {
        return @"货物配送";
    }
    if ([jsonString  isEqual: @"purchase_in_store"]) {
        return @"货物入库";
    }
    if ([jsonString  isEqual: @"completed"]) {
        return @"已完成";
    }
    if ([jsonString  isEqual: @"stop"]) {
        return @"已取消";
    }
    if ([jsonString  isEqual: @"purchase_v_com_check"]) {
        return @"总监审批";
    }
    if ([jsonString  isEqual: @"purchase_v_finance_check"]) {
        return @"总公司财务审批";
    }
    if ([jsonString  isEqual: @"purchase_v_rewrite"]) {
        return @"重填";
    }
    
    
    return @"未知状态";
}
//f (TextUtils.equals("FinancePay", text)) {
//    value = "财务充值";
//} else if (TextUtils.equals("FinanceExpense", text)) {
//    value = "财务消费";
//} else if (TextUtils.equals("ProbationExpense", text)) {
//    value = "试用消费";
//} else if (TextUtils.equals("SalePay", text)) {
//    value = "销售充值";
//} else if (TextUtils.equals("SaleExpense", text)) {
//    value = "销售消费";
//} else if (TextUtils.equals("VisitExpense", text)) {
//    value = "回访消费";
//} else if (TextUtils.equals("DistributionPay", text)) {
//    value = "配送充值";
//} else if (TextUtils.equals("DistributionExpense", text)) {
//    value = "配送消费";
//} else if (TextUtils.equals("CustomerExpense", text)) {
//    value = "客户消费";
//} else if (TextUtils.equals("StandbyPay", text)) {
//    value = "备用充值";
//} else if (TextUtils.equals("StandbyExpense", text)) {
//    value = "备用消费";
//}
//}

+(NSString *)watercardRecord:(NSString *)String {
    if ([String  isEqual: @"FinancePay"]) {
        return @"财务充值";
    }
    if ([String  isEqual: @"FinanceExpense"]) {
        return @"财务消费";
    }
    if ([String  isEqual: @"FinanceExpense"]) {
        return @"试用消费";
    }
    if ([String  isEqual: @"SalePay"]) {
        return @"销售充值";
    }
    if ([String  isEqual: @"SaleExpense"]) {
        return @"销售消费";
    }
    if ([String  isEqual: @"VisitExpense"]) {
        return @"回访消费";
    }
    if ([String  isEqual: @"DistributionPay"]) {
        return @"配送充值";
    }
    if ([String  isEqual: @"DistributionExpense"]) {
        return @"配送消费";
    }
    if ([String  isEqual: @"CustomerExpense"]) {
        return @"客户消费";
    }
    if ([String  isEqual: @"CustomerExpense"]) {
        return @"备用充值";
    }
    if ([String  isEqual: @"StandbyExpense"]) {
        return @"备用消费";
    }
    
    if ([String  isEqual: @"learer_card_out"]) {
        return @"组长转出";
    }
    if ([String  isEqual: @"learer_card_in"]) {
        return @"组长转入";
    }
    if ([String  isEqual: @"learer_card_out"]) {
        return @"组长转出";
    }
    if ([String  isEqual: @"SaleCancel"]) {
        return @"销售取消";
    }
    if ([String  isEqual: @"CooPointExpense"]) {
        return @"合作点消费";
    }
    if ([String  isEqual: @"DonationExpense"]) {
        return @"水卡转赠转出";
    }
    if ([String  isEqual: @"DonationRecharge"]) {
        return @"水卡转赠转入";
    }
    
    
    return @"未知状态";
}

+(NSString *)newDistributionDetails:(NSString *)string {
    
    if ([string  isEqual: @"distribution_on_road"]) {
        return @"配送中";
    }
    if ([string  isEqual: @"completed"]) {
        return @"配送完成";
    }
    if ([string  isEqual: @"stop"]) {
        return @"配送取消";
    }
    
    
    return @"未知状态";
}

+(NSString *)dealerdelivery:(NSString *)string {
    
    if ([string  isEqual: @"f_output_requst_check"]) {
        return @"仓管检查";
    }
    if ([string  isEqual: @"f_output_requst_rewrite"]) {
        return @"重填";
    }
    if ([string  isEqual: @"f_output_code_check"]) {
        return @"扫码出库";
    }
    if ([string  isEqual: @"completed"]) {
        return @"完成";
    }
    if ([string  isEqual: @"stop"]) {
        return @"取消";
    }
    
    return @"未知状态";
}

+(NSString *)applicationSupport:(NSString *)string {
    if ([string  isEqual: @"fgs_probation"]) {
        return @"送试用";
    }
    if ([string  isEqual: @"fgs_probation_back"]) {
        return @"试用待回访";
    }
    if ([string  isEqual: @"fgs_create_sale"]) {
        return @"创建销售单";
    }
    if ([string  isEqual: @"fgs_out_store"]) {
        return @"待出库";
    }
    if ([string  isEqual: @"fgs_deliver"]) {
        return @"交付";
    }
    if ([string  isEqual: @"fgs_in_store"]) {
        return @"入库";
    }
    if ([string  isEqual: @"fgs_pay_back"]) {
        return @"回款";
    }
    if ([string  isEqual: @"fgs_fran_confirm"]) {
        return @"经销商确认回款";
    }
    
    if ([string  isEqual: @"completed"]) {
        return @"完成";
    }
    if ([string  isEqual: @"stop"]) {
        return @"取消";
    }
    return @"未知状态";

}

/**
 *  退货状态
 */
+(NSString *)tuihuo:(NSString *)string {
    
    if ([string  isEqual: @"refundment_confirm"]) {
        return @"待补全退款单";
    }
    if ([string  isEqual: @"refundment_check"]) {
        return @"财务检查";
    }
    if ([string  isEqual: @"refundment_in_store"]) {
        return @"入库";
    }
    if ([string  isEqual: @"refundment_refund"]) {
        return @"财务退款";
    }
    return @"未知状态";
}

/**
 *  支付方式
 */
+(NSString *)payment:(NSString *)string{
    
    if ([string  isEqual: Financial_wx]) {
        return @"微信";
    }
    if ([string  isEqual: Financial_card]) {
        return @"转账";
    }
    if ([string  isEqual: Financial_alipay]) {
        return @"支付宝";
    }
    if ([string  isEqual: Financial_cash]) {
        return @"现金";
    }
    return @"";
}

/**
 *  支付方式
 */
+(NSString *)payment2:(NSString *)string{
    if ([string  isEqual: @"微信"]) {
        return Financial_wx;
    }
    if ([string  isEqual: @"转账"]) {
        return Financial_card;
    }
    if ([string  isEqual: @"支付宝"]) {
        return Financial_alipay;
    }
    if ([string  isEqual: @"现金"]) {
        return Financial_cash;
    }
    return @"";
}

/**
 *  报销单状态
 */
+(NSString *)baoxiao:(NSString *)string{
    if ([string  isEqual: Financial_create]) {
        return @"待审批";
    }
    if ([string  isEqual: Financial_cancel]) {
        return @"取消";
    }
    if ([string  isEqual: Financial_completed]) {
        return @"完成";
    }
    if ([string  isEqual: Financial_mgrCheck]) {
        return @"总监审批";
    }
    if ([string  isEqual: Financial_financeCheck]) {
        return @"财务审批";
    }
    if ([string  isEqual: Financial_apprCheck]) {
        return @"确认收款";
    }
    return @"";
}

/**
 *  出差单状态
 */
+(NSString *)chucha:(NSString *)string{
    
    if ([string  isEqual: Financial_create]) {
        return @"待审批";
    }
    if ([string  isEqual: Financial_cancel]) {
        return @"取消";
    }
    if ([string  isEqual: Financial_completed]) {
        return @"完成";
    }
    if ([string  isEqual: Financial_study]) {
        return @"学习";
    }
    if ([string  isEqual: Financial_business]) {
        return @"销售";
    }
    if ([string  isEqual: Financial_train]) {
        return @"培训";
    }
    if ([string  isEqual: Financial_work]) {
        return @"工作支持";
    }
    return @"";
}

/**
 *  利息状态
 */
+(NSString *)lixi:(NSString *)string{
    if ([string  isEqual: Financial_create]) {
        return @"创建";
    }
    if ([string  isEqual: Financial_open]) {
        return @"已开启";
    }
    if ([string  isEqual: Financial_completed]) {
        return @"已关闭";
    }
    if ([string  isEqual: Financial_split]) {
        return @"已分期";
    }
    if ([string  isEqual: Financial_cancel]) {
        return @"已作废";
    }
     return @"";
}

/**
 * 消息状态
 */
+(NSString *)xiaoxi:(NSString *)string {
    
    
    if ([string  isEqual: @"nonlocal"])
    {
        return @"异地客户";
    }
    if ([string  isEqual: @"nonlocalBack"])
    {
        return @"异地客户驳回";
    }
    if ([string  isEqual: @"nonlocalRatify"])
    {
        return @"异地客户批准";
    }
    if ([string  isEqual: @"cooPointPostil"])
    {
        return @"合作点批注";
    }
    if ([string  isEqual: @"scrap"])
    {
        return @"仓库报废";
    }
    return @"";
    
    
}


@end
