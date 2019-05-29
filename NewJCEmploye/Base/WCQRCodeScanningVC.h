//
//  WCQRCodeScanningVC.h
//  NewJCEmploye
//
//  Created by 张晓光 on 2019/5/22.
//  Copyright © 2019 洁澄水业科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WCQRCodeDelegate <NSObject>

- (void)scanOfdata:(NSString *)str;

@end

@interface WCQRCodeScanningVC : UIViewController

@property (nonatomic, weak) id<WCQRCodeDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
