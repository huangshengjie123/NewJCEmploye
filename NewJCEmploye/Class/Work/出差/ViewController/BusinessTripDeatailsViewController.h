//
//  BusinessTripDeatailsViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/20.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "DataModels.h"

@protocol BusinessTripDeatailsActionSuccessDelegate <NSObject>

@optional

-(void)detailsActionSuccessDelegate;

@end


@interface BusinessTripDeatailsViewController : BaseViewController

@property (nonatomic,strong) JCModel_businessTripList *listData;
@property (nonatomic,strong) NSString *typeString;
@property (nonatomic, weak) id<BusinessTripDeatailsActionSuccessDelegate> delegate;

@end
