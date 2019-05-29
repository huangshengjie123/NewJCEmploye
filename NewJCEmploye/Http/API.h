
//
//  API.h
//  NewJCEmploye
//
//  Created by 张晓光 on 2019/5/22.
//  Copyright © 2019 洁澄水业科技有限公司. All rights reserved.
//

#ifndef API_h
#define API_h

#define BASEURL @"https://www.ejiecheng.com"
//#define BASEURL @"http://192.168.0.199:8080"
//#define BASEURL @"http://192.168.0.156:8080"



#define BASEURLSMALL @"https://www.ejiecheng.com"
//#define BASEURLSMALL @"http://192.168.0.199:8083"
//#define BASEURLSMALL @"http://192.168.0.156:8080"

/*
 首页
 */
#define home_flow [NSString stringWithFormat:@"%@/oa/flow/workbar.do",BASEURL]
#define getUserRoleByLoginId [NSString stringWithFormat:@"%@/oa/user/getUserRoleByLoginId.do",BASEURL]
#define getPurAuthsByUserId [NSString stringWithFormat:@"%@/oa/auth/getPurAuthsByUserId.do",BASEURL]
#define getMenuAuthsByUser [NSString stringWithFormat:@"%@/oa/auth/getMenuAuthsByUser.do",BASEURL]
#define getMyFinanceCroups [NSString stringWithFormat:@"%@/oa/flow/getMyFinanceCroups.do",BASEURL]

#define searchWorkGroup [NSString stringWithFormat:@"%@/oa/flow/searchWorkGroup.do",BASEURL]

#define getSaleOrdersByPageSearch [NSString stringWithFormat:@"%@/oa/flow/getSaleOrdersByPageSearch.do",BASEURL]

#define getProbationsByGuide [NSString stringWithFormat:@"%@/oa/flow/getProbationsByGuide.do",BASEURL]

#define getInOutOrdersAdvance [NSString stringWithFormat:@"%@/oa/inOutOrder/getInOutOrdersAdvance.do",BASEURL]

#define getStoreHouseByUp [NSString stringWithFormat:@"%@/oa/storeHouse/getStoreHouseByUp.do",BASEURL]

#define getInOutOrdersAdvance [NSString stringWithFormat:@"%@/oa/inOutOrder/getInOutOrdersAdvance.do",BASEURL]

#define getResaleStatisticBySearch [NSString stringWithFormat:@"%@/finance/getResaleStatisticBySearch.mdo",BASEURLSMALL]

#define moneyBackRanking [NSString stringWithFormat:@"%@/finance/moneyBackRanking.mdo",BASEURLSMALL]

#define address_list [NSString stringWithFormat:@"%@/oa/org/getAllOrgs.do",BASEURL]

#define getOrgUserExInfo [NSString stringWithFormat:@"%@/oa/user/getOrgUserExInfo.do",BASEURL]

#define getOrgUserExtInfoNum [NSString stringWithFormat:@"%@/oa/org/getOrgUserExtInfoNum.do",BASEURL]

#define getOrgByWaterCardId [NSString stringWithFormat:@"%@/oa/org/getOrgByWaterCardId.do",BASEURL]

#define getUserExtInfoListByOrgId [NSString stringWithFormat:@"%@/oa/user/getUserExtInfoListByOrgId",BASEURL]

/* 回收水卡 */
#define doRecoveryFromWaterCard [NSString stringWithFormat:@"%@/oa/flow/doRecoveryFromWaterCard.do",BASEURL]
/* 获得进货单位id */
#define getMyPurchaser [NSString stringWithFormat:@"%@/flow/getMyPurchaser.do",BASEURL]


#endif /* API_h */
