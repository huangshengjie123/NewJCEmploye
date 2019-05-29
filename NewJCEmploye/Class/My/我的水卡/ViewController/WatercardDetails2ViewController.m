//
//  WatercardDetails2ViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/23.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WatercardDetails2ViewController.h"
#import "Macro.h"
#import "WatercardDetail2TableViewCell.h"
#import "JCRequest_ReadCusWaterCardInfo.h"
#import "DataModels.h"
#import "WatercardRecordsViewController.h"
#import "WatercardtopupViewController.h"

@interface WatercardDetails2ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,strong) NSArray     *dataArray;
@property (nonatomic,strong) NSString    *idString2;
@property (nonatomic,strong) UILabel     *namaLabel;
@property (nonatomic,strong) UILabel     *cardLabel;
@end

@implementation WatercardDetails2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"水卡详情";
    self.view.backgroundColor = JCBackgroundColor;
    
    for (NSObject * item in _itemDataArray) {
        NSLog(@"_itemDataArray:::::::%@",item);
    }
//    NSLog(@"%@", );
    if(_itemDataArray.count >0)
    {
        
    }
    else
    {
        [self readData];
    }
    UIButton *informationCardBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    informationCardBtn2.tag = 2;
    [informationCardBtn2 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn2 setTitle:@"记录" forState:UIControlStateNormal];
    [informationCardBtn2 setTitleColor:JCColorBlue forState:UIControlStateNormal];
    [informationCardBtn2 sizeToFit];
    UIBarButtonItem *informationCardItem2 = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn2];
    self.navigationItem.rightBarButtonItems  = @[informationCardItem2,];
    [self addViews];
    
}


-(void)addViews {
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = JCColorWithe;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 + 10);
        make.height.equalTo(@(50));
    }];
    
    _namaLabel = [[UILabel alloc]init];
    _namaLabel.font = JCFont15;
    _namaLabel.textColor = JCColorBlack;
    
    [view addSubview:_namaLabel];
    [_namaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(10);
        make.top.equalTo(view).offset(7);
    }];
    
    _cardLabel = [[UILabel alloc]init];
    _cardLabel.font = JCFont15;
    _cardLabel.textColor = JCColorBlack;
    [view addSubview:_cardLabel];
    [_cardLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_namaLabel.mas_bottom).offset(7);
        make.left.equalTo(view).offset(10);
    }];

   
    self.tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(view.mas_bottom).offset( 10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-100);
    }];
    
    
    if (_numstring != nil)
    {
        UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        returnBtn.backgroundColor = JCColorBlue;
        [returnBtn setTitle:@"回收" forState:UIControlStateNormal];
        [self.view addSubview:returnBtn];
        [returnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(10);
            make.width.mas_equalTo(150);
            make.height.equalTo(@(44));
            make.bottom.equalTo(self.view).offset(-10);
        }];
        returnBtn.titleLabel.font = JCFont14;
        [returnBtn addTarget:self action:@selector(returnBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIButton *topupButton = [UIButton buttonWithType:UIButtonTypeCustom];
        topupButton.backgroundColor = JCColorBlue;
        [topupButton setTitle:@"充值" forState:UIControlStateNormal];
        [self.view addSubview:topupButton];
        [topupButton mas_makeConstraints:^(MASConstraintMaker *make) {

            make.right.equalTo(self.view).offset(-10);
            make.height.equalTo(@(44));
            make.width.mas_equalTo(150);
            make.bottom.equalTo(self.view).offset(-10);
        }];
        topupButton.titleLabel.font = JCFont14;
        [topupButton addTarget:self action:@selector(topupButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self myPurchaser];
    }
}
/* 获得进货单位 */
- (void)myPurchaser {
    
    [HttpTool getRequestWithURLStr:getMyPurchaser params:nil success:^(NSDictionary *responseDic) {
        
        NSLog(@"responseDic:::::::%@",responseDic);
        
        
    } failure:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}
/* 回收 */
- (void)returnBtnClick {
    
    [HttpTool postRequestWithURLStr:doRecoveryFromWaterCard params:@{@"purid":@"",@"waterCardId":self.waterCardID} success:^(NSDictionary *responseDic) {
        
        
    } failure:^(NSError *error) {
        
    }];

}

/* 充值 */
-(void)topupButtonClick  {
    
    WatercardtopupViewController *vc  =[[WatercardtopupViewController alloc]init];
    vc.numstring = _numstring;
    vc.groupId = _groupId;
    vc.isFinancial = _isFinancial;
    vc.idString33 = _idSring;
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(_itemDataArray.count >0)
    {
        return  _itemDataArray.count;
    }
    else
    {
        return _dataArray.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"WatercardDetail2TableViewCell";
    WatercardDetail2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil)
    {
        cell = [[WatercardDetail2TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if(_itemDataArray.count >0)
    {
        JCModel_MyWaterCardInformationWaterCardItems *items = _itemDataArray[indexPath.row];
        cell.titleLabel.text = items.itemName;
        cell.contenLabel.text = [NSString stringWithFormat:@"x  %d",(int)items.num];
        _idString2 = items.waterCardItemsIdentifier;
        _idString2 = _idSring;
    }
    else
    {
        JCModel_CusWaterInfoWaterCardItems *items = _dataArray[indexPath.row];
        cell.titleLabel.text = items.itemName;
        cell.contenLabel.text = [NSString stringWithFormat:@"x  %d",(int)items.num];
        _idString2 = items.waterCardItemsIdentifier;
        _idString2 = _idSring;
    }

    return cell;
}

-(void)readData {
    
    JCRequest_ReadCusWaterCardInfo *request = [[JCRequest_ReadCusWaterCardInfo alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"owner":_userId,
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadCusWaterCardInfo *request) {
        
        NSDictionary *dic = request.responseJSONObject;
        
        JCModel_CusWaterInfoBase *base = [[JCModel_CusWaterInfoBase alloc]initWithDictionary:dic];
        if (base.data.count > 0)
        {
            JCModel_CusWaterInfoData *data = base.data[0];
            _dataArray = data.waterCardItems;
            _namaLabel.text = data.username;
            _cardLabel.text = _idSring;
        }
        [_tableview reloadData];
        
    } failure:^(__kindof JCRequest_ReadCusWaterCardInfo *request, NSError *error) {
        
        NSLog(@"失败 %@",error);
    }];
}

//跳到水卡记录
-(void)buttonAction {
    
    WatercardRecordsViewController *vc = [[WatercardRecordsViewController alloc]init];
    vc.idString = _idString2;
    [self.navigationController pushViewController:vc animated:YES];
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
