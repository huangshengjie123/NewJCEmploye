//
//  WorkViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/1/30.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WorkViewController.h"
#import "Macro.h"
#import "WorkTableViewCell.h"
#import "WarehouseInfoViewController.h"
#import "InventoryInfoViewController.h"
#import "InAndOutViewController.h"
#import "ProbationViewController.h"
#import "CooperationsViewController.h"
#import "SellViewController.h"
#import "JCRequest_ReadMyMenu.h"
#import "DataModels.h"
#import "BulletinViewController.h"
#import "CBStoreHouseRefreshControl.h"
#import "JCRequest_ReadStorehouseInfo.h"
#import "SGActionView.h"
#import "MyInAndOutViewController.h"
#import "PackageViewController.h"
#import "ReceivableOrderViewController.h"
#import "JCRequest_ReadGroup.h"
#import "DistributionViewController.h"
#import "WorkLogViewController.h"
#import "JCRequest_ReadStockJurisdiction.h"
#import "StockBaseViewController.h"
#import "DealerOutputViewController.h"
#import "DealerProbationViewController.h"
#import "DealerSaleViewController.h"
#import "DistributionLeaderViewController.h"
#import "JCRequest_getUserRoleByLoginId.h"
#import "NewDistributionViewController.h"
#import "WarningViewController.h"
#import "InventoryWarningViewController.h"
#import "DealerDeliveryViewController.h"
#import "CustomersReturnVisitViewController.h"
#import "ReadAllWaterCardsViewController.h"
#import "MyCooperationPointViewController.h"
#import "CleanWaterViewController.h"
#import "ApplicationSupportViewController.h"
#import "SalesmanSupportViewController.h"
#import "SupportReceivableViewController.h"
#import "Message2ViewController.h"
#import "ReturnGoodsViewController.h"
#import "RefundViewController.h"
#import "OtherIncomeViewController.h"
#import "InterestIncomeViewController.h"
#import "ReimbursementViewController.h"
#import "MyReimbursementViewController.h"
#import "BusinessTripViewController.h"
#import "RankingViewController.h"
#import "JCRequest_getStorehouseByid.h"
//#import "ActivityMainViewController.h"

@interface WorkViewController ()<UITableViewDelegate,UITableViewDataSource,WorkSelectedDelegate,UITabBarControllerDelegate>

@property (nonatomic,strong) UITableView    *tableView;
@property (nonatomic,strong) NSMutableArray *commonWorkArray;//常见工作数组
@property (nonatomic,strong) NSMutableArray *personalWorkArray;//个人工作数组
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSMutableArray *groupArray; //财务组
@property (nonatomic,assign) BOOL           isShowStock;
@property (nonatomic,strong) NSArray        *dataArray2; //进货权限集合
@property (nonatomic,strong) NSString       *distributionString;
@property (nonatomic,assign) BOOL           isFinancial;  //是否财务

@end

@implementation WorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = JCBackgroundColor;
    self.title = @"工作";
    self.tabBarController.delegate = self;
    _commonWorkArray = [NSMutableArray arrayWithCapacity:10];
    [self readDistributionData];
    _isShowStock = NO;
    _personalWorkArray = [[NSMutableArray alloc]initWithCapacity:20];

    //界面配置
    if([[JCTokenManager sgetDealer]  isEqual: @"franchiser"])
    {
        _commonWorkArray = @[@"经销商出库",@"商品套餐"].mutableCopy;
        _personalWorkArray = @[@"经销商试用",@"经销商销售",@"经销商配送",@"申请支持",@"客户水量预警"].mutableCopy;
    }
    else
    {
        _commonWorkArray = @[@"洁澄公告",@"我的出入库",@"商品套餐",@"工作日志",@"消息",@"报销",@"出差",@"市场排名",@"缴款",@"采购"].mutableCopy;
        
        [self readData];
        [self readPermissionsData];
        [_tableView reloadData];
    }
    _isFinancial = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = NO;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    [self.view addSubview:self.tableView];
  
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self.view).offset(0);
        make.top.equalTo (self.view).offset(JCNew64);
    }];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    
}
- (void)refreshHeader {
    
    [self readData];
    [self readPermissionsData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    if (indexPath.row == 0)
    {
        static NSString *identifier = @"WorkTableViewCell";
        WorkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        cell.delegate2 = self;
        if (cell == nil)
        {
            cell = [[WorkTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.delegate2 = self;
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.moduleNameLabel.text = @"公共模块";
        cell.dataArray = _commonWorkArray;
        [cell.collectionView reloadData];
        
         return  cell;
    }
    else
    {
        static NSString *identifier2 = @"WorkTableViewCell2";
        WorkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier2];
        cell.delegate2 = self;
        if (cell == nil)
        {
            cell = [[WorkTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier2];
            cell.delegate2 = self;
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.moduleNameLabel.text = @"工作模块";
        cell.dataArray = _personalWorkArray;
        [cell.collectionView reloadData];
        return  cell;
    }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0)
    {
        int i = (int)(_commonWorkArray.count %3);
        int m = (int)(_commonWorkArray.count /3);
        if (i > 0)
        {
            return 170 + ((JCScreen_Width -  40 - 20)/4 + 15) * (m);
        }
        else
        {
            return 170 + ((JCScreen_Width -  40 - 20)/4 + 15) * (m-1);
        }
    }
    
    if (indexPath.row == 1)
    {
        if (_personalWorkArray.count <= 3)
        {
            return 170;
        }
        
        if (_personalWorkArray.count > 3 && _personalWorkArray.count <= 6 )
        {
            return 170 + ((JCScreen_Width -  40 - 20)/4 + 15);
        }
        
        if (_personalWorkArray.count > 6 && _personalWorkArray.count <= 9)
        {
            return 170 + ((JCScreen_Width -  40 - 20)/4 + 15) *2;
        }
        if (_personalWorkArray.count > 9 && _personalWorkArray.count <= 12)
        {
            return 170 + ((JCScreen_Width -  40 - 20)/4 + 15) *3;
        }
        
        if (_personalWorkArray.count > 12 && _personalWorkArray.count <= 15)
        {
            return 170 + ((JCScreen_Width -  40 - 20)/4 + 15) *4;
        }
        
        if (_personalWorkArray.count > 15 && _personalWorkArray.count <= 18)
        {
            return 170 + ((JCScreen_Width -  40 - 20)/4 + 15) *5;
        }
        
        if (_personalWorkArray.count > 18 && _personalWorkArray.count <= 21)
        {
            return 170 + ((JCScreen_Width -  40 - 20)/4 + 15) *6;
        }
        if (_personalWorkArray.count > 21 && _personalWorkArray.count <= 24)
        {
            return 170 + ((JCScreen_Width -  40 - 20)/4 + 15) *7;
        }
    }
    return 0;
}


#pragma mark 被选择cell 的name
-(void)selectedString:(NSString *)workName {
    
    if ([workName isEqualToString:@"库存信息"])
    {
        InventoryInfoViewController *inventoryInfoVC = [[InventoryInfoViewController alloc]init];
        inventoryInfoVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:inventoryInfoVC animated:YES];
    }
    
    if ([workName isEqualToString:@"仓库信息"])
    {
        WarehouseInfoViewController *warehouseInfoVC = [[WarehouseInfoViewController alloc]init];
        warehouseInfoVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:warehouseInfoVC animated:YES];
    }
    
    if ([workName isEqualToString:@"出入库管理"])
    {
        [self readMyData:1];
    }
    
    if ([workName isEqualToString:@"试用"])
    {
        ProbationViewController *probationVC = [[ProbationViewController alloc]init];
        probationVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:probationVC animated:YES];
    }
    
    if ([workName isEqualToString:@"合作点记录"])
    {
        MyCooperationPointViewController *cooperationVC = [[MyCooperationPointViewController alloc]init];
        cooperationVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:cooperationVC animated:YES];
    }
    
    if ([workName isEqualToString:@"销售"])
    {
        SellViewController *sellVC = [[SellViewController alloc]init];
        sellVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:sellVC animated:YES];
    }
    
    if ([workName isEqualToString:@"回款单"])
    {
        [self readGroupData];
    }
    if ([workName isEqualToString:@"售后服务"])
    {
        [self showInfo:@"暂未开放"];
    }
    
    if ([workName isEqualToString:@"洁澄公告"])
    {
        BulletinViewController *bulletinVC = [[BulletinViewController alloc]init];
        bulletinVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:bulletinVC animated:YES];
    }
    
    if ([workName isEqualToString:@"我的出入库"] )
    {
        MyInAndOutViewController *myInAndOutVC = [[MyInAndOutViewController alloc]init];
        myInAndOutVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myInAndOutVC animated:YES];
    }
    
    if ([workName isEqualToString:@"商品套餐"])
    {
        PackageViewController *packageVC = [[PackageViewController alloc]init];
        packageVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:packageVC animated:YES];
    }
    
    if ([workName isEqualToString:@"配送服务"])
    {
        if ([_distributionString  isEqual: @"配送主管"])
        {
            DistributionLeaderViewController *packageVC = [[DistributionLeaderViewController alloc]init];
            packageVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:packageVC animated:YES];
        }

        if([_distributionString isEqualToString:@"配送员"])
        {
            NewDistributionViewController *vc = [[NewDistributionViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }

        if ([_distributionString isEqual:@"销售员"])
        {
            DistributionViewController *vc = [[DistributionViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
    if ([workName isEqualToString:@"工作日志"])
    {
        WorkLogViewController *packageVC = [[WorkLogViewController alloc]init];
        packageVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:packageVC animated:YES];
    }
    
    if ([workName isEqualToString:@"进货管理"])
    {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
        for (int i = 0; i < _dataArray2.count; i ++)
        {
            JCModel_jinhuoquanxianData* data =_dataArray2[i];
            if ([data.authId  isEqual: @"41"])
            {
                [array addObject:@"总公司财务"];
            }
            if ([data.authId  isEqual: @"42"])
            {
                [array addObject:@"总公司配送主管"];
            }
            if ([data.authId  isEqual: @"43"])
            {
                [array addObject:@"总公司配送员"];
            }
            if ([data.authId  isEqual: @"44"])
            {
                [array addObject:@"分公司主管"];
            }
            if ([data.authId  isEqual: @"40"])
            {
                [array addObject:@"进货发起人"];
            }
        }
        [SGActionView showSheetWithTitle:@"" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {

            StockBaseViewController *stockbaseVC = [[StockBaseViewController alloc]init];
            stockbaseVC.identityString = array[index];
            stockbaseVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:stockbaseVC animated:YES];

        }];
    }
    
    if([workName isEqualToString:@"经销商试用"])
    {
        DealerProbationViewController *packageVC = [[DealerProbationViewController alloc]init];
        packageVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:packageVC animated:YES];
    }
    
    if ([workName isEqualToString:@"经销商销售"])
    {
        DealerSaleViewController *saleVC = [[DealerSaleViewController alloc]init];
        saleVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:saleVC animated:YES];
    }
    
    if ([workName isEqualToString:@"经销商出库"])
    {
        DealerOutputViewController *packageVC = [[DealerOutputViewController alloc]init];
        packageVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:packageVC animated:YES];
    }
    
    if ([workName isEqualToString:@"经销商配送"])
    {
        DistributionViewController *vc = [[DistributionViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([workName isEqualToString:@"客户水量预警"])
    {
        WarningViewController *vc = [[WarningViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([workName isEqualToString:@"库存预警"])
    {
        InventoryWarningViewController *vc = [[InventoryWarningViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([workName isEqualToString:@"水卡管理"])
    {
        ReadAllWaterCardsViewController *vc = [[ReadAllWaterCardsViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([workName isEqualToString:@"经销商出库管理"])
    {
        [self readMyData:2];
    }

    if ([workName isEqualToString:@"客户回访"])
    {
        CustomersReturnVisitViewController *vc = [[CustomersReturnVisitViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([workName isEqualToString:@"水卡转赠"])
    {
        CleanWaterViewController *vc = [[CleanWaterViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([workName isEqualToString:@"申请支持"])
    {
//        [self showInfo:@"下个版本开放"];
        ApplicationSupportViewController *vc = [[ApplicationSupportViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([workName isEqualToString:@"经销商支持"])
    {
        SalesmanSupportViewController *vc = [[SalesmanSupportViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([workName isEqualToString:@"经销商支持回款"])
    {
        SupportReceivableViewController *vc = [[SupportReceivableViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([workName isEqualToString:@"消息"])
    {
        Message2ViewController *vc = [[Message2ViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([workName isEqualToString:@"退货清单"])
    {
        ReturnGoodsViewController *vc = [[ReturnGoodsViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([workName isEqualToString:@"退款清单"])
    {
         RefundViewController *vc = [[ RefundViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([workName isEqualToString:@"缴款管理"])
    {
        OtherIncomeViewController *vc = [[ OtherIncomeViewController alloc]init];
        vc.isFinancial = YES;
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([workName isEqualToString:@"借款管理"])
    {
        InterestIncomeViewController*vc = [[ InterestIncomeViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([workName isEqualToString:@"报销管理"])
    {
        ReimbursementViewController*vc = [[ ReimbursementViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }

    if ([workName isEqualToString:@"报销"])
    {
        MyReimbursementViewController*vc = [[ MyReimbursementViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }

    if ([workName isEqualToString:@"出差"])
    {
        BusinessTripViewController*vc = [[ BusinessTripViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([workName isEqualToString:@"缴款"])
    {
        OtherIncomeViewController *vc = [[OtherIncomeViewController alloc]init];
        vc.isFinancial = NO;
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([workName isEqualToString:@"市场排名"])
    {
        RankingViewController *vc = [[RankingViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([workName isEqualToString:@"活动"])
    {

    }
}

-(void)readData {

    [HttpTool  getRequestWithURLStr:getMenuAuthsByUser params:@{@"isAppLogin":@"true",@"jc4login":[JCTokenManager getToken]} success:^(NSDictionary *responseDic) {
        
        if ([responseDic[@"code"] integerValue] == 200)
        {
            NSDictionary *dic = responseDic;
            JCModel_MenuBase *base = [[JCModel_MenuBase alloc]initWithDictionary:dic];
            NSArray *dataArray = base.data;
            [_personalWorkArray removeAllObjects];
            
            for (int i = 0; i < dataArray.count; i++)
            {
                JCModel_MenuData *data = dataArray[i];
                if ([data.authId  isEqual: @"101"])
                {
                    [_personalWorkArray addObject:@"仓库信息"];
                }
                if ([data.authId  isEqual: @"103"])
                {
                    /*
                     出入库管理
                     */
                    [_personalWorkArray addObject:@"出入库管理"];
                    [_personalWorkArray addObject:@"经销商出库管理"];
                    
                }
                if ([data.authId  isEqual: @"104"])
                {
                    [_personalWorkArray addObject:@"试用"];
                    [_personalWorkArray addObject:@"活动"];
                    
                }
                if ([data.authId  isEqual: @"105"])
                {
                    /*
                     销售
                     定制水
                     */
                    [_personalWorkArray addObject:@"销售"];
                    [_personalWorkArray addObject:@"客户回访"];
                    [_personalWorkArray addObject:@"水卡转赠"];
                    [_personalWorkArray addObject:@"经销商支持"];
                    [_personalWorkArray addObject:@"退货清单"];
                    [_personalWorkArray addObject:@"客户水量预警"];
                }
                if ([data.authId  isEqual: @"106"])
                {
                    [_personalWorkArray addObject:@"合作点记录"];
                }
                if ([data.authId  isEqual: @"107"])
                {
                    /*
                     回款单
                     */
                    [JCTokenManager saveFinancial:@"是财务"];
                    [_personalWorkArray addObject:@"回款单"];
                    [_personalWorkArray addObject:@"经销商支持回款"];
                    [_personalWorkArray addObject:@"水卡管理"];
                    [_personalWorkArray addObject:@"退款清单"];
                    [_personalWorkArray addObject:@"借款管理"];
                    [_personalWorkArray addObject:@"报销管理"];
                    [_personalWorkArray addObject:@"缴款管理"];
                    [_personalWorkArray addObject:@"采购管理"];
                }
                if ([data.authId  isEqual: @"108"])
                {
                    [_personalWorkArray addObject:@"售后服务"];
                }
                
                if ([data.authId isEqualToString:@"109"])
                {
                    [_personalWorkArray addObject:@"配送服务"];
                }
                /*
                 110 ：客户回访
                 111:  进货管理
                 112:经销商出库管理
                 113:水卡管理
                 114:库存预警
                 115:经销商支持
                 116:客户水量转增
                 117:经销商支持回馈
                 118:退货清单
                 119:退款
                 120:借款管理
                 121:缴款管理
                 122:报销管理
                 123:采购管理
                 124:客户水量预警
                 125:物料采购
                 */
                if ([data.authId isEqualToString:@"111"])
                {
                    [_personalWorkArray addObject:@"进货管理"];
                }
                if ([data.authId isEqualToString:@"114"])
                {
                    [_personalWorkArray addObject:@"库存预警"];
                }
            }
            
            [self.tableView reloadData];
        }
        else
        {
            
        }
        
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        
    } failure:^(NSError *error) {
        
    }];

}
//读取配送身份
-(void)readDistributionData {
    
    [HttpTool postRequestWithURLStr:getUserRoleByLoginId params:@{@"isAppLogin":@"true",@"jc4login":[JCTokenManager getToken] } success:^(NSDictionary *responseDic) {
        
        if ([responseDic[@"code"] integerValue] == 200)
        {
            if ([responseDic[@"msg"]  isEqual: @"配送员"])
            {
                _distributionString = @"配送员";
            }
            if ([responseDic[@"msg"]   isEqual: @"销售员"])
            {
                _distributionString = @"销售员";
            }
            if ([responseDic[@"msg"]   isEqual: @"配送主管"])
            {
                _distributionString = @"配送主管";
            }
        }
        else
        {
            [self showInfo:responseDic[@"msg"]];
        }
       
    } failure:^(NSError *error) {
        
    }];

}

//读取是否有进货权限
-(void)readPermissionsData {
    
    [HttpTool postRequestWithURLStr:getPurAuthsByUserId params:@{@"isAppLogin":@"true", @"jc4login":[JCTokenManager getToken] } success:^(NSDictionary *responseDic) {

        if ([responseDic[@"code"] integerValue] == 200)
        {
            JCModel_jinhuoquanxianBase *base = [[JCModel_jinhuoquanxianBase alloc]initWithDictionary:responseDic];
            _dataArray2 = base.data;
            _isShowStock = YES;
            [self readData];
        }
        else
        {
            _isShowStock = NO;
            [self showInfo:responseDic[@"msg"]];
        }
    } failure:^(NSError *error) {

    }];
}


-(void)readGroupData {
    
    [HttpTool postRequestWithURLStr:getMyFinanceCroups params:@{@"isAppLogin":@"true",@"jc4login":[JCTokenManager getToken] } success:^(NSDictionary *responseDic) {
        
        if ([responseDic[@"code"] integerValue] == 200)
        {
            JCModel_FinancialGroupBase *base = [[JCModel_FinancialGroupBase alloc]initWithDictionary:responseDic];
            _groupArray = [NSMutableArray arrayWithCapacity:20];
            for (int i = 0; i < base.data.count;i++)
            {
                JCModel_FinancialGroupData *data = base.data[i];
                [_groupArray addObject:data.name];
            }
            //设置选择框  -1 是为了什么都不选
            [SGActionView showSheetWithTitle:@"选择财务组" itemTitles:_groupArray selectedIndex:-1 selectedHandle:^(NSInteger index) {
                
                ReceivableOrderViewController *inAndOutVC = [[ReceivableOrderViewController alloc]init];
                JCModel_FinancialGroupData *data = base.data[index];
                inAndOutVC.data = data;
                inAndOutVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:inAndOutVC animated:YES];
                
            }];
            
            
            [_tableView reloadData];
        }
        else
        {
            [self showInfo:responseDic[@"msg"]];
        }
        
    } failure:^(NSError *error) {
        
    }];

}

-(void)readMyData:(int)intNum {
    
    
    JCRequest_getStorehouseByid *request = [[JCRequest_getStorehouseByid alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getStorehouseByid *request) {
        //
        NSLog(@"成功获取仓库信息");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_StoreHouseInfoBase *base = [[JCModel_StoreHouseInfoBase alloc]initWithDictionary:dic];
        
        
        _dataArray = [NSMutableArray arrayWithCapacity:20];
        
        for (int i = 0; i < base.data.count;i++)
        {
            JCModel_StoreHouseInfoData *data = base.data[i];
            [_dataArray addObject:data.name];
        }
        if (intNum == 1)
        {
            //设置选择框  -1 是为了什么都不选
            [SGActionView showSheetWithTitle:@"选择仓库" itemTitles:_dataArray selectedIndex:-1 selectedHandle:^(NSInteger index) {
                
                InAndOutViewController *inAndOutVC = [[InAndOutViewController alloc]init];
                JCModel_StoreHouseInfoData *data = base.data[index];
                inAndOutVC.warehouseName = data.name;
                inAndOutVC.warehouseId = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
                inAndOutVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:inAndOutVC animated:YES];
                
            }];
            
        }
        else
        {
            //设置选择框  -1 是为了什么都不选
            [SGActionView showSheetWithTitle:@"选择仓库" itemTitles:_dataArray selectedIndex:-1 selectedHandle:^(NSInteger index) {
                
                DealerDeliveryViewController *inAndOutVC = [[DealerDeliveryViewController alloc]init];
                JCModel_StoreHouseInfoData *data = base.data[index];
                inAndOutVC.warehouseName = data.name;
                inAndOutVC.warehouseId = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
                inAndOutVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:inAndOutVC animated:YES];
                
            }];
            
        }
        
         _tableView.estimatedRowHeight = 0;
       
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_getStorehouseByid *request, NSError *error) {
        NSLog(@"失败获取仓库信息 %@",error);
    }];
}


#pragma mark - Notifying refresh control of scrolling

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.storeHouseRefreshControl scrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.storeHouseRefreshControl scrollViewDidEndDragging];
}

//#pragma mark - Listening for the user to trigger a refresh
//
//- (void)refreshTriggered:(id)sender
//{
//    [self performSelector:@selector(finishRefreshControl) withObject:nil afterDelay:3 inModes:@[NSRunLoopCommonModes]];
//
//    //刷新信息
//    [_commonWorkArray removeAllObjects];
//    [_personalWorkArray  removeAllObjects];
//    //界面配置
//    if([[JCTokenManager getUserType]  isEqual: @"franchiser"])
//    {
//        _commonWorkArray = @[@"经销商出库",@"商品套餐"].mutableCopy;
//        _personalWorkArray = @[@"经销商试用",@"经销商销售",@"经销商配送",@"申请支持",@"客户水量预警"].mutableCopy;
//        _tableView.estimatedRowHeight = 0;
//
//        [_tableView reloadData];
//    }
//    else
//    {
//        _commonWorkArray = @[@"洁澄公告",@"我的出入库",@"商品套餐",@"工作日志",@"消息",@"报销",@"出差",@"市场排名",@"缴款",@"采购"].mutableCopy;
//
//        [self readData];
//        [self readPermissionsData];
//         [_tableView reloadData];
//    }
//
//}

- (void)finishRefreshControl
{
    [self.storeHouseRefreshControl finishingLoading];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    [_personalWorkArray  removeAllObjects];
    //界面配置
    if([[JCTokenManager getUserType]  isEqual: @"franchiser"])
    {
        _commonWorkArray = @[@"经销商出库",@"商品套餐"].mutableCopy;
        _personalWorkArray = @[@"经销商试用",@"经销商销售",@"经销商配送",@"申请支持",@"客户水量预警"].mutableCopy;
        _tableView.estimatedRowHeight = 0;
        
        [_tableView reloadData];
    }
    else
    {
        _commonWorkArray = @[@"洁澄公告",@"我的出入库",@"商品套餐",@"工作日志",@"消息",@"报销",@"出差",@"市场排名",@"缴款",@"采购"].mutableCopy;
        
        [self readData];
        [self readPermissionsData];
        [_tableView reloadData];

    }
    
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
