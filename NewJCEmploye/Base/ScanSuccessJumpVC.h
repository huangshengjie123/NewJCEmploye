//
//  ScanSuccessJumpVC.h
//  NewJCEmploye
//
//  Created by 张晓光 on 2019/5/22.
//  Copyright © 2019 洁澄水业科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    ScanSuccessJumpComeFromWB,
    ScanSuccessJumpComeFromWC
} ScanSuccessJumpComeFrom;

@interface ScanSuccessJumpVC : UIViewController

/** 判断从哪个控制器 push 过来 */
@property (nonatomic, assign) ScanSuccessJumpComeFrom comeFromVC;
/** 接收扫描的二维码信息 */
@property (nonatomic, copy) NSString *jump_URL;
/** 接收扫描的条形码信息 */
@property (nonatomic, copy) NSString *jump_bar_code;


@end

NS_ASSUME_NONNULL_END
