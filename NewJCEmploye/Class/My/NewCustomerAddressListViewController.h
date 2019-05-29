//
//  NewCustomerAddressListViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/18.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
@protocol NewCustomerAddressListDelegate <NSObject>
@optional

-(void)NewMyCustomerSuccuss;

@end
@interface NewCustomerAddressListViewController : BaseViewController

@property (nonatomic,strong) NSString *userID;
@property (nonatomic,weak)id<NewCustomerAddressListDelegate>delegate;

@end
