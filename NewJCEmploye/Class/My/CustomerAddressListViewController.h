//
//  CustomerAddressListViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/18.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "DataModels.h"
@protocol MyCustomerAddressListDelegate <NSObject>
@optional

-(void)selectMyCustomerAddressListReturn:(JCModel_customerAddressListData *)custmerData;

@end
@interface CustomerAddressListViewController : BaseViewController


@property (nonatomic,strong) NSString *userID;
@property (nonatomic,weak)id<MyCustomerAddressListDelegate>delegate;
@property (nonatomic,strong)NSString *type;
@end
