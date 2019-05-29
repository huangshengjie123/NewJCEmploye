//
//  WorkTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/5.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WorkTableViewCell.h"
#import "Macro.h"
#import "Masonry.h"
#import "WorkCollectionViewCell.h"

@implementation WorkTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
    }
    return self;
}

-(void)addViews {
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = JCColorWithe;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(15);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
    view.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(-4, 4);
    view.layer.shadowOpacity = 0.8;
    view.layer.shadowRadius = 10.0;
    view.layer.cornerRadius = 10.0;
    view.clipsToBounds = NO;
    
    _moduleNameLabel = [[UILabel alloc]init];
    _moduleNameLabel.font = [UIFont boldSystemFontOfSize:16];
    _moduleNameLabel.textColor = BlueColor;
    [view addSubview:_moduleNameLabel];
    [_moduleNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(10);
        make.left.equalTo(view.mas_left).offset(10);
    }];
  
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(50, 50);
    
    _collectionView =  [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    [view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(view).offset(0);
        make.top.equalTo(_moduleNameLabel.mas_bottom).offset(15);
    }];
    _collectionView.userInteractionEnabled = YES;
    [_collectionView registerClass:[WorkCollectionViewCell class] forCellWithReuseIdentifier:@"WorkCollectionViewCell"];

}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    WorkCollectionViewCell *cell = (WorkCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"WorkCollectionViewCell" forIndexPath:indexPath];
    
    cell.titleLabel.text = _dataArray[indexPath.row];
    NSString *str = [[NSString alloc]initWithFormat:@"%@", _dataArray[indexPath.row]];
    if ([str  isEqual: @"洁澄公告"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"洁澄公告"];
    }
    if ([str  isEqual: @"工作日志"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"工作日志"];
    }
    if ([str  isEqual: @"商品套餐"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"商品套餐"];
    }
    if ([str  isEqual: @"试用"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"试用"];
    }
    if ([str  isEqual: @"销售"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"销售"];
    }
    if ([str  isEqual: @"售后服务"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"售后服务"];
    }
    if ([str  isEqual: @"合作点记录"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"合作点"];
    }
    
    if ([str isEqualToString:@"仓库信息"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"仓库信息"];
    }
    
    if ([str  isEqual: @"出入库管理"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"出入库管理"];
    }
    if ([str  isEqual: @"我的出入库"] || [str  isEqual: @"经销商出库"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"申请出入库"];
    }
    if ([str  isEqual: @"回款单"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"回款单"];
    }
    
    if ([str isEqualToString:@"配送服务"] || [str isEqualToString:@"经销商配送"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"配送服务"];
    }
    
    if ([str isEqualToString:@"进货管理"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"进货"];
    }
    if ([str isEqualToString:@"经销商试用"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"试用"];
    }
    
    if ([str isEqualToString:@"经销商销售"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"销售"];
    }
    
    if ([str isEqualToString:@"客户水量预警"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"客户水量预警"];
    }
    
    if ([str isEqualToString:@"客户回访"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"客户回访"];
    }
    if ([str isEqualToString:@"库存预警"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"客户水量预警"];
    }
    if ([str isEqualToString:@"经销商出库管理"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"出入库管理"];
    }
    if ([str isEqualToString:@"水卡管理"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"水卡管理"];
    }
    if ([str isEqualToString:@"水卡转赠"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"水卡转赠"];
    }
    if ([str isEqualToString:@"申请支持"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"经销商支持"];
    }
    if ([str isEqualToString:@"经销商支持"])
    {
        cell.kImageView.image = [UIImage imageNamed:@"经销商支持"];
    }
    if ([str isEqualToString:@"消息"]) {
        cell.kImageView.image = [UIImage imageNamed:@"公共消息"];
    }
    if ([str isEqualToString:@"市场排名"]) {
        cell.kImageView.image = [UIImage imageNamed:@"市场排名"];
    }
    if ([str isEqualToString:@"缴款"]) {
        cell.kImageView.image = [UIImage imageNamed:@"缴款"];
    }
    if ([str isEqualToString:@"报销"]) {
        cell.kImageView.image = [UIImage imageNamed:@"报销"];
    }
    if ([str isEqualToString:@"出差"]) {
        cell.kImageView.image = [UIImage imageNamed:@"出差"];
    }
    if ([str isEqualToString:@"采购"]) {
        cell.kImageView.image = [UIImage imageNamed:@"采购"];
    }
    if ([str isEqualToString:@"退款清单"]) {
        cell.kImageView.image = [UIImage imageNamed:@"退款"];
    }
    
    if ([str isEqualToString:@"借款管理"]) {
        cell.kImageView.image = [UIImage imageNamed:@"借款"];
    }
    
    if ([str isEqualToString:@"报销管理"]) {
        cell.kImageView.image = [UIImage imageNamed:@"报销管理"];
    }
    
    if ([str isEqualToString:@"缴款管理"]) {
        cell.kImageView.image = [UIImage imageNamed:@"缴款管理"];
    }
    
    if ([str isEqualToString:@"采购管理"]) {
        cell.kImageView.image = [UIImage imageNamed:@"采购管理"];
    }
//    if ([str  isEqual: @"洁澄公告"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"洁澄公告"];
//    }
   
   
    return cell;
}



//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat w= (JCScreen_Width -  40 - 20)/4;
    
    return CGSizeMake(w, w);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点了 %@",_dataArray[indexPath.row]);
    [self.delegate2 selectedString:_dataArray[indexPath.row]];
}


    
@end
