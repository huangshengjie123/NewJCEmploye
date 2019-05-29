//
//  AddressViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/6.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  地址选择

#import "BaseViewController.h"
@protocol AddressDelegate <NSObject>
@optional

-(void)selectedAddress:(NSString *)str  and:(NSString *)addressId;


@end
@interface AddressViewController : BaseViewController
@property (nonatomic, weak) id<AddressDelegate> delegate;

@end
