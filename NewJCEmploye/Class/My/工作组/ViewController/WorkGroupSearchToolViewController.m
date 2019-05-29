//
//  WorkGroupSearchToolViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/2/21.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "WorkGroupSearchToolViewController.h"
#import "Macro.h"
#import "WorkCollectionViewCell.h"
#import "AttributeViewController.h"
#import "WorkLogViewController.h"
#import "ProbationViewController.h"
#import "SellViewController.h"
#import "BeyondbacklogViewController.h"
#import "WaterCardViewController.h"
#import "MyCustomerViewController.h"
#import "WarningViewController.h"
#import "ProbationCustomViewController.h"
#import "DealerBaseViewController.h"
#import "MyItemsViewController.h"
#import "MyCooperationViewController.h"
@interface WorkGroupSearchToolViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation WorkGroupSearchToolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"查询员工账号信息";
    self.view.backgroundColor = JCBackgroundColor;
    _dataArray = @[@"试用报表",@"销售报表",@"工作日志",@"试用清单",@"销售清单",@"超期待办",@"水卡充值",@"ta的客户",@"客户水量预警",@"试用客户名单",@"ta的经销商",@"ta的自身物品",@"ta的合作点"];
    if (_list == nil) {
        _list = [[JCModel_GroupEMPList alloc]init];
        _list.listIdentifier = _workGroupRelations.number;
        _list.saleGroupId = _workGrouplist.listIdentifier;
    }
    
    [self addViews];
}

-(void)addViews {
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(50, 50);
    
    _collectionView =  [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 +15);
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
 
    if ([str  isEqual: @"工作日志"]) {
        cell.kImageView.image = [UIImage imageNamed:@"工作日志"];
    }
    if ([str  isEqual: @"商品套餐"]) {
        cell.kImageView.image = [UIImage imageNamed:@"商品套餐"];
    }
    if ([str  isEqual: @"试用报表"] ||[str  isEqual: @"试用清单"]) {
        
        cell.kImageView.image = [UIImage imageNamed:@"试用"];
    }
    if ([str  isEqual: @"销售报表"]||[str  isEqual: @"销售清单"]) {
        
        cell.kImageView.image = [UIImage imageNamed:@"销售"];
    }
    if ([str isEqualToString:@"水卡充值"]) {
        cell.kImageView.image = [UIImage imageNamed:@"水卡管理"];
    }
    
    if ([str isEqualToString:@"超期待办"]) {
        cell.kImageView.image = [UIImage imageNamed:@"工作消息"];
    }
    if ([str isEqualToString:@"ta的客户"]) {
        
        cell.kImageView.image = [UIImage imageNamed:@"我的客户"];
    }
    if ([str isEqualToString:@"客户水量预警"]) {
        cell.kImageView.image = [UIImage imageNamed:@"客户水量预警"];
    }
    if ([str  isEqual:  @"试用客户名单"]) {
        cell.kImageView.image = [UIImage imageNamed:@"我的试用客户"];
    }
    if ([str  isEqual:  @"ta的经销商"]) {
        cell.kImageView.image = [UIImage imageNamed:@"我的经销商"];
    }
    if ([str  isEqual:  @"ta的自身物品"]) {
        cell.kImageView.image = [UIImage imageNamed:@"我的物品"];
    }
    if ([str  isEqual: @"ta的合作点"]) {
        cell.kImageView.image = [UIImage imageNamed:@"合作点"];
    }
    
    
//    if ([str  isEqual: @"售后服务"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"售后服务"];
//    }
//    if ([str  isEqual: @"合作点记录"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"合作点"];
//    }
//
//    if ([str isEqualToString:@"仓库信息"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"仓库信息"];
//    }
//
//    if ([str  isEqual: @"出入库管理"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"出入库管理"];
//    }
//    if ([str  isEqual: @"我的出入库"] || [str  isEqual: @"经销商出库"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"申请出入库"];
//    }
//
//    if ([str  isEqual: @"回款单"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"回款单"];
//    }
//
//    if ([str isEqualToString:@"配送服务"] || [str isEqualToString:@"经销商配送"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"配送服务"];
//    }
//
//    if ([str isEqualToString:@"进货管理"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"进货"];
//    }
//    if ([str isEqualToString:@"经销商试用"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"试用"];
//    }
//
//    if ([str isEqualToString:@"经销商销售"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"销售"];
//    }
//    if ([str isEqualToString:@"客户回访"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"客户回访"];
//    }
//
//    if ([str isEqualToString:@"库存预警"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"客户水量预警"];
//    }
//
//    if ([str isEqualToString:@"经销商出库管理"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"出入库管理"];
//    }
//
//    if ([str isEqualToString:@"水卡转赠"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"水卡转赠"];
//    }
//    if ([str isEqualToString:@"申请支持"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"申请支持"];
//    }
//    if ([str isEqualToString:@"经销商支持"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"申请支持"];
//    }
//    if ([str isEqualToString:@"消息"]) {
//        cell.kImageView.image = [UIImage imageNamed:@"工作消息"];
//    }
//
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

    NSString *str = _dataArray [indexPath.row];
    
                                if (indexPath.row == 0 || indexPath.row == 1) {
                                    
                                    AttributeViewController *attribute = [[AttributeViewController alloc]init];
                                    attribute.titleString = _dataArray[indexPath.row];
                                    attribute.workGroupIdString =  [NSString stringWithFormat:@"%d",(int)_list.saleGroupId];
                                    attribute.userIdString = _list.listIdentifier;
                                    [self.navigationController pushViewController:attribute animated:YES];
                                }
    
    
                                if (indexPath.row == 2) {
                                    //跳转到工作日志界面
                                    WorkLogViewController *worklogVC = [[WorkLogViewController alloc]init];
                                    worklogVC.employeeString =  [NSString stringWithFormat:@"%d",(int) _list.listIdentifier];
                                    [self.navigationController pushViewController:worklogVC animated:YES];
                                }
    
                                if (indexPath.row == 3) {
                                    //跳到试用清单
                                    ProbationViewController *vc = [[ProbationViewController alloc]init];
                                    vc.uID =[NSString stringWithFormat:@"%d",(int)_list.listIdentifier];
                                    vc.gID = [NSString stringWithFormat:@"%@",_list.saleGroupId];
                                    [self.navigationController pushViewController:vc animated:YES];
        
                                }
    
                                if (indexPath.row == 4) {
                                    //跳到销售清单
                                    SellViewController *vc = [[SellViewController alloc]init];
                                    vc.uID = [NSString stringWithFormat:@"%d",(int)_list.listIdentifier];
                                    vc.gID = [NSString stringWithFormat:@"%@",_list.saleGroupId];
        
                                    [self.navigationController pushViewController:vc animated:YES];
                                }
    
                                if (indexPath.row == 5) {
                                    //超期待办
                                    BeyondbacklogViewController *vc = [[BeyondbacklogViewController alloc ]init];
                                    vc.numberString = [NSString stringWithFormat:@"%d",(int)_list.listIdentifier];
                                    vc.groupId =[NSString stringWithFormat:@"%@",_list.saleGroupId];
                                    [self.navigationController pushViewController:vc animated:YES];
        
                                }
    
    
                                if (indexPath.row == 6) {
                                    //水卡充值
                                    WaterCardViewController *vc  = [[WaterCardViewController alloc]init];
                                    vc.numstring =[NSString stringWithFormat:@"%d",(int)_list.listIdentifier];
                                    vc.groupId = [NSString stringWithFormat:@"%@",_list.saleGroupId];
                                    [self.navigationController pushViewController:vc animated:YES];
        
                                }
    
                                if (indexPath.row == 7) {
                                    //ta的客户
                                    MyCustomerViewController *myCustomerVC  = [[MyCustomerViewController alloc]init];
                                    myCustomerVC.guideSring = [NSString stringWithFormat:@"%d",(int)_list.listIdentifier];
                                    [self.navigationController pushViewController:myCustomerVC animated:YES];
                                }
                                if (indexPath.row == 8) {
                                    //ta的水量预警
                                    WarningViewController *warningVC = [[WarningViewController alloc]init];
                                    warningVC.guideSring = [NSString stringWithFormat:@"%d",(int)_list.listIdentifier];
                                    [self.navigationController pushViewController:warningVC animated:YES];
        
                                }
    
                                if (indexPath.row == 9) {
                                    //ta的试用客户
                                    ProbationCustomViewController *vc = [[ProbationCustomViewController alloc]init];
                                    vc.guideSring = [NSString stringWithFormat:@"%d",(int)_list.listIdentifier];
                                    [self.navigationController pushViewController:vc animated:YES];
        
                                }
    
                                if (indexPath.row == 10) {
                                    DealerBaseViewController *vc = [[DealerBaseViewController alloc]init];
                                    vc.guideSring = [NSString stringWithFormat:@"%d",(int)_list.listIdentifier];
                                    [self.navigationController pushViewController:vc animated:YES];
                                }
    
                                if (indexPath.row == 11) {
                                    MyItemsViewController *vc = [[MyItemsViewController alloc]init];
                                    vc.guideSring =[NSString stringWithFormat:@"%d",(int)_list.listIdentifier];
                                    vc.sting = @"工作组组员";
                                    vc.groupId = [NSString stringWithFormat:@"%@",_list.saleGroupId];
                                    [self.navigationController pushViewController:vc animated:YES];
        
                                }
    
                                if (indexPath.row == 12) {
                                    MyCooperationViewController *vc = [[MyCooperationViewController alloc]init];
                                    vc.guideSring = [NSString stringWithFormat:@"%d",(int)_list.listIdentifier];
                                    [self.navigationController pushViewController:vc animated:YES];
                                }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
