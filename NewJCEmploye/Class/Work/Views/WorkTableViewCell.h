//
//  WorkTableViewCell.h
//  NewJCEmploye
//  r
//  Created by 陳升琪 on 2018/2/5.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WorkSelectedDelegate <NSObject>

-(void)selectedString:(NSString *)workName;

@end

@interface WorkTableViewCell : UITableViewCell <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView * collectionView;
@property (nonatomic,strong) UILabel *moduleNameLabel; //模块名称
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic, weak)id <WorkSelectedDelegate> delegate2;

@end
