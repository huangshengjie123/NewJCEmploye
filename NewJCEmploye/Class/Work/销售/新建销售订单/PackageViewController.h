//
//  PackageViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/11.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "DataModels.h"
@protocol PackageDelegate <NSObject>
@optional

-(void)selectPackageReturn:(JCModel_PackageData *)packageData;

@end
@interface PackageViewController : BaseViewController

@property (nonatomic,strong) NSString *fromString;
@property (nonatomic,weak)id<PackageDelegate>delegate;

@end
