//
//  MyCustomerDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/6.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "MyCustomerDetailsViewController.h"
#import "Macro.h"
#import "MyCustomer2TableViewCell.h"
#import "JCRequest_readWatercard.h"
#import "DataModels.h"
#import "NewMyCustomerViewController.h"
#import "WatercardDetails2ViewController.h"
#import "CustomerAddressListViewController.h"
#import "JCRequest_ReadCusWaterCardInfo.h"
#import "SellViewController.h"
#import "JCRequest_getVisitsBySearchWithPage.h"
#import "CustomersReturnVisitTableViewCell.h"
#import "JCRequest_ReadAllSell.h"
#import "SellTableViewCell.h"
#import "JCRequest_readmoreMycustomer.h"

@interface MyCustomerDetailsViewController () <UITableViewDelegate,UITableViewDataSource,NewMyCustomerDelegate>

@property (nonatomic,strong) UITableView          *tableView;
@property (nonatomic,strong) NSMutableDictionary  *heightAtIndexPath;//缓存高度所用字典
@property (nonatomic,strong) NSString             *cardIdString;
@property (nonatomic,strong) UIView               *topView;
@property (nonatomic,strong) UITableView          *returnVisitTableView;
@property (nonatomic,strong) NSArray              *returnVisitArray;
@property (nonatomic,strong) NSArray              *saleArray;
@property (nonatomic,strong) JCmodel_newCustomer2List *listData;
@property (nonatomic,strong) UILabel                  *waterContentLabel;
@property (nonatomic,assign) int                      all;

@end

@implementation MyCustomerDetailsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"客户详情";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readRetrunVisitData];
    [self readData];
    [self readData2];
    [self readSaleData];
    
    NSLog(@"_data::::::::::%@",_data);
    
}

-(void)addViews {
    
    UIButton *informationCardBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    informationCardBtn2.tag = 2;
    [informationCardBtn2 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn2 setTitle:@"编辑" forState:UIControlStateNormal];
    [informationCardBtn2 setTitleColor:JCColorBlue forState:UIControlStateNormal];
    [informationCardBtn2 sizeToFit];
    UIBarButtonItem *informationCardItem2 = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn2];
    self.navigationItem.rightBarButtonItems  = @[informationCardItem2];
    
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = JCColorWithe;
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 +10);
        make.height.equalTo(@(60));
    }];
    _topView = topView;
    
    UIImageView *imageView = [[UIImageView alloc]init];
    if (_data.customerDetail.sex ==0)
    {
        [imageView setImage:[UIImage imageNamed:@"默认头像男"]];
    }
    else
    {
        [imageView setImage:[UIImage imageNamed:@"默认头像女"]];
    }
    
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView).offset(10);
        make.height.equalTo(@(50));
        make.width.equalTo(@(50));
        make.centerY.equalTo(topView);
    }];
    
    UILabel *nameLabal = [[UILabel alloc]init];
    nameLabal.textColor = JCColorBlack;
    nameLabal.font = JCFont16;
    [topView addSubview:nameLabal];
    [nameLabal mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).offset(10);
        make.top.equalTo(topView).offset(10);
    }];
    nameLabal.text = _data.name;
    
    UIButton *phoneButton = [[UIButton alloc]init];
    [topView addSubview:phoneButton];
    [phoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabal);
        make.top.equalTo(nameLabal.mas_bottom).offset(7);
        make.height.equalTo(@(16));
        make.width.equalTo(@(100));
    }];
    
    UILabel *phone = [[UILabel alloc]init];
    phone.text = _data.customerDetail.mobile;
    phone.textColor = JCColorBlue;
    phone.font = JCFont15;
    [phoneButton addSubview:phone];
    [phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(phoneButton);
        make.left.equalTo(phoneButton);
    }];
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(10);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0)
    {
//        if (_listData.introduceMbPhone != nil || _listData.introduceMbPhone)
//        {
//            return 16;
//        }
//        else
//        {
//            return 14;
//        }
      
        if (_data.introducer)
        {
            return 16;
        }
        else
        {
            return 14;
        }
    
    }
    else if (section == 1)
    {
        return _returnVisitArray.count;
    }
    else
    {
        return _saleArray.count;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 2)
    {
        static NSString *identifier = @"SellTableViewCell";
        SellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil)
        {
            cell = [[SellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        JCModel_SellOrderList *list = _saleArray[indexPath.row];
        cell.nameLabel.text = list.customer.name;
        cell.stateLabel.text = [JCTool determinesSellStatusSringWith:list.status];
        cell.phoneLabel.text = list.customer.customerDetail.mobile;
        cell.timeLabel.text = list.createTime;
        JCModel_SellOrderCustomerAddressList *address = [[JCModel_SellOrderCustomerAddressList alloc]init];
        if (list.customer.customerAddressList.count > 0)
        {
            address = list.customer.customerAddressList[0];
        }
        cell.addressLabel.text = address.xpath;
        NSString *itemString = @"";
        
        for (int i = 0; i< list.orderCosts.count; i ++)
        {
            JCModel_probationOrderProbationCosts *cost  = list.orderCosts[i];
            itemString = [NSString stringWithFormat:@" %@  %@ x  %d",itemString,cost.name,(int)cost.num];
        }
        for (int i = 0; i < list.orderPresents.count; i ++)
        {
            JCModel_SellOrderOrderPresents *present = list.orderPresents[i];
            itemString = [NSString stringWithFormat:@" %@  %@ x  %d",itemString,present.name,(int)present.num];
        }
        cell.itemsLabel.text = itemString;
        return  cell;
    }
    
    if (indexPath.section == 1)
    {
        static NSString *identifier = @"CustomersReturnVisitTableViewCell";
        CustomersReturnVisitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil)
        {
            cell = [[CustomersReturnVisitTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        JCModel_ReturnVisitList *listData = _returnVisitArray[indexPath.row];
        cell.nameLabel.text = listData.customer.name;
        if (listData.customer.customerAddressList.count >0)
        {
            JCModel_ReturnVisitCustomerAddressList *adr = listData.customer.customerAddressList[0];
            cell.addressLabel.text = [NSString stringWithFormat:@"%@%@",adr.xpath,adr.address];
        }
       
        [cell.phoneButton setTitle:[NSString stringWithFormat:@"%@",listData.customer.customerDetail.mobile] forState:UIControlStateNormal];
        cell.contentLabel.text = [NSString stringWithFormat:@"物品:%@",listData.myItem];
        if (listData.items.count > 0)
        {
            NSString *itemString = cell.contentLabel.text;
            for (int i = 0; i< listData.items.count; i ++)
            {
                JCModel_ShowReturnVisitItems *cost  = listData.items[i];
                itemString = [NSString stringWithFormat:@"%@ %@x%d",itemString,cost.name,(int)cost.num];
            }
            cell.contentLabel.text = [NSString stringWithFormat:@"%@",itemString];
        }
        
        return cell;
    }
    
    if (indexPath.section == 0)
    {
        static NSString *identifier = @"MyCustomer2TableViewCell";
        MyCustomer2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil)
        {
            cell = [[MyCustomer2TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        if (indexPath.row == 0)
        {
            cell.titleLabel.text = @"地址";
            cell.contentLabel.text = @"点击查看地址列表";
            if (_listData.customerAddressList.count > 0)
            {
                for (int i= 0; i < _listData.customerAddressList.count; i++)
                {
                    JCModel_GetCustmerCustomerAddressList *adList = _listData.customerAddressList[i];
                    
                    NSLog(@"%@",adList);
                    
                    if ([adList.type  isEqual: @"main"])
                    {
                        cell.contentLabel.text = [NSString stringWithFormat:@"%@%@",adList.xpath,adList.address];
                    }
                }
            }
            else
            {
                if (_data.customerAddressList.count > 0)
                {
                    JCModel_GetCustmerCustomerAddressList *adList = _data.customerAddressList[0];
                    cell.contentLabel.text = [NSString stringWithFormat:@"%@%@",adList.xpath,adList.address];
                }
            }
            
            cell.contentLabel.textColor = JCColorBlue;
            
        }
        if (indexPath.row == 1)
        {
            cell.titleLabel.text = @"水卡";
            if ([_cardIdString isEqualToString:@"暂无绑定水卡"])
            {
                cell.contentLabel.text = _cardIdString;
                cell.contentLabel.textColor = JCColorMidGray;
            }
            else
            {
                _waterContentLabel = cell.contentLabel;
                _waterContentLabel.text = [NSString stringWithFormat:@"%@    剩余水量 %d 袋",_cardIdString,_all];
                _waterContentLabel.textColor = JCColorBlue;
            }
        }
        if (indexPath.row == 2)
        {
            cell.titleLabel.text = @"套餐优惠券";
            cell.contentLabel.text = @"查看客户有的优惠券";
            cell.contentLabel.textColor = JCColorBlue;
            [cell.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(cell.titleLabel.mas_right).offset(10);
                make.centerY.equalTo(cell.contentView);
            }];
        }
        
        if (indexPath.row == 3)
        {
            cell.titleLabel.text = @"性别";
            if (_data.customerDetail == NULL)
            {
                cell.contentLabel.text = @"暂无信息";
                cell.contentLabel.textColor = JCColorMidGray;
            }
            else
            {
                if (_data.customerDetail.sex == 0)
                {
                    cell.contentLabel.text = @"男";
                }
                if (_data.customerDetail.sex == 1)
                {
                    cell.contentLabel.text = @"女";
                }
                
                cell.contentLabel.textColor = JCColorBlack;
            }
        }
        if (indexPath.row == 4)
        {

            cell.titleLabel.text = @"服务人员";
            cell.contentLabel.text = _data.staffName;
            [cell.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(cell.titleLabel.mas_right).offset(10);
                make.centerY.equalTo(cell.contentView);
            }];

        }
        
        if (indexPath.row == 5)
        {
             cell.titleLabel.text = @"微信";
             if ([_data.customerDetail.weChat  isEqual: @""] || _data.customerDetail.weChat == nil)
             {
                 cell.contentLabel.text = @"暂无信息";
                 cell.contentLabel.textColor = JCColorMidGray;
             }
             else
             {
                 cell.contentLabel.text = _data.customerDetail.weChat;
                 cell.contentLabel.textColor = JCColorBlack;
             }
        }
        if (indexPath.row == 6)
        {
            cell.titleLabel.text = @"Q Q";
            if ([_data.customerDetail.qq  isEqual: @""] ||_data.customerDetail.qq == NULL)
            {
                cell.contentLabel.text = @"暂无信息";
                cell.contentLabel.textColor = JCColorMidGray;
            }
            else
            {
                cell.contentLabel.text = _data.customerDetail.qq;
                cell.contentLabel.textColor = JCColorBlack;
            }
        }
        if (indexPath.row == 7)
        {
            cell.titleLabel.text = @"邮箱";
            
            if ([_data.customerDetail.email  isEqual: @""] || _data.customerDetail.email == NULL) {
                cell.contentLabel.text = @"暂无信息";
                cell.contentLabel.textColor = JCColorMidGray;
            }else {
                cell.contentLabel.text = _data.customerDetail.email;
                cell.contentLabel.textColor = JCColorBlack;
            }
        }
        if (indexPath.row == 8) {
            cell.titleLabel.text = @"公司";
            if ([_data.customerDetail.company  isEqual: @""]|| _data.customerDetail.company == NULL) {
                cell.contentLabel.text = @"暂无信息";
                cell.contentLabel.textColor = JCColorMidGray;
            }else {
                cell.contentLabel.text = _data.customerDetail.company;
                cell.contentLabel.textColor = JCColorBlack;
            }
        }
        if (indexPath.row == 9) {
            cell.titleLabel.text = @"收入";
            if ([_data.customerDetail.income  isEqual: @""]|| _data.customerDetail.income == NULL) {
                cell.contentLabel.text = @"暂无信息";
                cell.contentLabel.textColor = JCColorMidGray;
            }else {
                cell.contentLabel.text = _data.customerDetail.income;
                cell.contentLabel.textColor = JCColorBlack;
            }
        }
        if (indexPath.row == 10) {
            cell.titleLabel.text = @"兴趣";
            if ([_data.customerDetail.interest  isEqual: @""]|| _data.customerDetail.interest == NULL) {
                cell.contentLabel.text = @"暂无信息";
                cell.contentLabel.textColor = JCColorMidGray;
            }else {
                cell.contentLabel.text = _data.customerDetail.interest;
                cell.contentLabel.textColor = JCColorBlack;
            }
        }
        if (indexPath.row == 11) {
            cell.titleLabel.text = @"备注";
            if ([_data.customerDetail.customerDetailDescription  isEqual: @""]|| _data.customerDetail.customerDetailDescription == NULL ) {
                cell.contentLabel.text = @"暂无信息";
                cell.contentLabel.textColor = JCColorMidGray;
            }else {
                cell.contentLabel.text = _data.customerDetail.customerDetailDescription;
                cell.contentLabel.textColor = JCColorBlack;
            }
            
        }
        if (indexPath.row == 12) {
            cell.titleLabel.text = @"生日";
            if ([_data.customerDetail.birthday  isEqual: @""]|| _data.customerDetail.birthday == NULL ) {
                cell.contentLabel.text = @"暂无信息";
                cell.contentLabel.textColor = JCColorMidGray;
            }else {
                cell.contentLabel.text = _data.customerDetail.birthday;
                cell.contentLabel.textColor = JCColorBlack;
            }
        }
        if (indexPath.row == 13) {
            cell.titleLabel.text = @"创建时间";
            cell.contentLabel.text = _data.createTime;
            [cell.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(cell.titleLabel.mas_right).offset(10);
                make.centerY.equalTo(cell.contentView);
            }];
        }
        if (indexPath.row == 14)
        {
            cell.titleLabel.text = @"介绍人:";
            cell.contentLabel.text = _data.staffName;
//            cell.contentLabel.text = _listData.introducerName;
            [cell.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(cell.titleLabel.mas_right).offset(10);
                make.centerY.equalTo(cell.contentView);
            }];
        }
        
        if (indexPath.row == 15)
        {
            cell.titleLabel.text = @"介绍人电话:";
//            cell.contentLabel.text = _listData.introduceMbPhone;
            cell.contentLabel.text = _data.account;
            [cell.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(cell.titleLabel.mas_right).offset(10);
                make.centerY.equalTo(cell.contentView);
            }];
        }
        return cell;
    }
    return 0;
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 1) {
        //进入水卡详情界面
        if (_cardIdString.length > 0)
        {
            WatercardDetails2ViewController *vc = [[WatercardDetails2ViewController alloc]init];
            vc.userId = [NSString stringWithFormat:@"%d",(int)_data.dataIdentifier];
            vc.idSring = _cardIdString;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
    if (indexPath.row == 2)
    {
        //进入回访界面
        
    }
    
    if (indexPath.row == 3) {
        //销售记录
        SellViewController *vc = [[SellViewController alloc]init];
        vc.searchString =_data.customerDetail.mobile;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 0) {
        //进入地址列表
        CustomerAddressListViewController *vc = [[CustomerAddressListViewController alloc]init];
        vc.userID = [NSString stringWithFormat:@"%d",(int)_data.dataIdentifier];
        vc.type = @"我的客户";
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return 110;
    }else if (indexPath.section == 0) {
        return 44;
    }else {
        return  125;
    }

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView* view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = JCBackgroundColor;
    
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont boldSystemFontOfSize:16];
    label.textColor = [UIColor darkGrayColor];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(10);
        make.centerY.equalTo(view);
    }];
    
    if (section == 0)
    {
        label.text = @"客户简介";
    }
    
    if (_returnVisitArray.count != 0)
    {
        if (section == 1)
        {
            label.text = @"回访记录";
        }
    }
    
    if (_saleArray.count != 0 )
    {
        if (section == 2)
        {
            label.text = @"消费记录";
        }
    }
    return view ;
}
-(void)readData {
 
    JCRequest_readmoreMycustomer *request = [[JCRequest_readmoreMycustomer alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString  *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    NSString  *str = [NSString stringWithFormat:@"%d",(int)_data.dataIdentifier];//dataIdentifier
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum" :pageNum,
                                @"pageSize":pageSize,
                                @"id": str,
                                };
    NSLog(@"水卡：：：%@",request.urlString);
    [request startWithBlockSuccess:^(__kindof JCRequest_readmoreMycustomer *request) {
        //
        NSLog(@"成功查询绑定水卡");
        NSDictionary *dic = request.responseJSONObject;
//        NSLog(@"dic水卡:::::::::::%@",dic);
        JCmodel_newCustomer2Base *base = [[JCmodel_newCustomer2Base alloc]initWithDictionary:dic];
        JCmodel_newCustomer2Data *data = [[JCmodel_newCustomer2Data alloc]init];
        data = base.data;
        if (data.list.count > 0)
        {
            JCmodel_newCustomer2List *listData = data.list[0];
            _listData = listData;
            if (listData.cardId.length >0)
            {
                _cardIdString = listData.cardId;
                [_tableView reloadData];
            }
            else
            {
                _cardIdString = @"暂无绑定水卡";
            }
        }
        else
        {
            _cardIdString = @"暂无绑定水卡";
        }

    } failure:^(__kindof JCRequest_readmoreMycustomer *request, NSError *error) {
        NSLog(@"失败查询绑定水卡 %@",error);
    }];

}
/* 修改用户的*/
-(void)buttonAction {
    
    NewMyCustomerViewController *new = [[NewMyCustomerViewController alloc]init];
    new.data = _data;
    new.typeString = @"修改";
    new.delegate = self;
    [self.navigationController pushViewController:new animated:YES];
    
}

-(void)NewMyCustomerSuccuss2 {
    
    [self.delegate takeSuccussDeetails2];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)readData2 {
    
    JCRequest_ReadCusWaterCardInfo *request = [[JCRequest_ReadCusWaterCardInfo alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"owner":[NSString stringWithFormat:@"%d",(int)_data.dataIdentifier],
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadCusWaterCardInfo *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
//        NSLog(@"dic::::::::::::%@",dic);
        JCModel_CusWaterInfoBase *base = [[JCModel_CusWaterInfoBase alloc]initWithDictionary:dic];
        if (base.data.count > 0)
        {
            JCModel_CusWaterInfoData *data = base.data[0];
            NSArray *array = data.waterCardItems;
            int a =0 ;
            int b =0 ;
            for (int i = 0; i < array.count; i ++)
            {
                JCModel_CusWaterInfoWaterCardItems *items = array[i];
                if ([items.itemName  isEqual: @"吉善泉袋装水"])
                {
                    a = (int)items.num;
                }
                if ([items.itemName  isEqual: @"吉善甘泉袋装水"])
                {
                    b = (int)items.num;
                }
            }
            _all = a + b;
            [_tableView reloadData];
            
        }
        
    } failure:^(__kindof JCRequest_ReadCusWaterCardInfo *request, NSError *error) {
        
        NSLog(@"失败 %@",error);
        
    }];
        
    
}
-(void)readRetrunVisitData {
    
    JCRequest_getVisitsBySearchWithPage *request = [[JCRequest_getVisitsBySearchWithPage alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString  *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"200"];
    NSString  *userID = [JCTokenManager getUserID];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                @"cusId":[NSString stringWithFormat:@"%d",(int)_data.dataIdentifier],
                                @"guide":userID
                                };
    
//    NSLog(@"%@",request.requestArgument);
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getVisitsBySearchWithPage *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic =request.responseJSONObject;
//        NSLog(@"dic2::::::%@",dic);
        NSDictionary *data = [dic objectForKey:@"data"];
        JCModel_ReturnVisitBase *base = [[JCModel_ReturnVisitBase alloc]initWithDictionary:dic];
        _returnVisitArray = base.data.list;
        [_tableView reloadData];
        NSLog(@"%@",data);
        
    } failure:^(__kindof JCRequest_getVisitsBySearchWithPage *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];

}

-(void)readSaleData {
    
    JCRequest_ReadAllSell *request = [[JCRequest_ReadAllSell alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"200"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum" :pageNum,
                                @"pageSize":pageSize,
                                @"searchString":_data.customerDetail.mobile
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadAllSell *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
//        NSLog(@"dic3::::::%@",dic);
        JCModel_SellOrderBase *base = [[JCModel_SellOrderBase alloc]initWithDictionary:dic];
        JCModel_SellOrderData *data =  [[JCModel_SellOrderData alloc]init];
        data = base.data;
        NSArray *array = data.list;
        NSMutableArray *array1 = [[NSMutableArray alloc]initWithArray:array];
        
        if (array.count >0)
        {
            for (int i = 0; i <array.count; i++)
            {
                JCModel_SellOrderList *list = array[i];
                if ( [[JCTool determinesSellStatusSringWith:list.status] isEqualToString:@"已结束"])
                {
                    [array1 removeObject:list];
                }
            }
        }
        
        _saleArray = array1;
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_ReadAllSell *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
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
