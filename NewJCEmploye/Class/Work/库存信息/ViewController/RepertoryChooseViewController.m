//
//  RepertoryChooseViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/21.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "RepertoryChooseViewController.h"
#import "Macro.h"
#import "RepertoryChooseTableViewCell.h"
#import "DataModels.h"
#import "Request_readMyWarehouse.h"
#import "Request_readItemClasesify.h"
#import "JCRequest_ReadMyItems.h"
#import "SGActionView.h"
#import "JCRequest_getFranchiserByIdAndMtype.h"

@interface RepertoryChooseViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) UISearchBar     *searchBar;
@property (nonatomic,strong) UITableView     *tableView;
@property (nonatomic,strong) NSArray         *warehouseArray;
@property (nonatomic,strong) NSArray         *classifyArray;
@property (nonatomic,strong) NSArray         *myArray;
@property (nonatomic,strong) NSMutableArray  *cellofMyArray;
@property (nonatomic,strong) NSMutableArray  *cellofRepertoryArray;


@end

static NSString *identifier = @"RepertoryChooseTableViewCell";


@implementation RepertoryChooseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"商品选择";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readMywarehouse];
    [self readItemClassify];
    [self readMyItems];
}

-(void)addViews {
    
    self.cellofMyArray = [NSMutableArray arrayWithCapacity:100];
    self.cellofRepertoryArray = [NSMutableArray arrayWithCapacity:100];
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"确认"] forState:UIControlStateNormal];
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.placeholder = @"搜索商品";
    [self.view addSubview:_searchBar];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 + 10);
        make.height.equalTo(@(36));
    }];
    
    _tableView = [[UITableView alloc]init];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_searchBar.mas_bottom).offset(10);
        make.bottom.equalTo(self.view);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([_inputString isEqualToString:@"1"])
    {
        return _myArray.count;
    }
    else
    {
        if (_isSimpleOutbound == YES)
        {
            return _classifyArray.count;
        }
        else
        {
            if (section == 0)
            {
                return _myArray.count;
            }
            else
            {
                return _classifyArray.count;
            }
        }
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    //如果等于 1 就是只从自己身上出的
    if ([_inputString isEqualToString:@"1"])
    {
        return 1;
    }
    else
    {
        if (_isSimpleOutbound == YES)
        {
            return 1;
        }
        else
        {
            return 2;
        }
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%ld%ld", (long)[indexPath section], (long)[indexPath row]];//以indexPath来唯一确定cell
    RepertoryChooseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; //出列可重用的cell
    if (cell == nil)
    {
        cell = [[RepertoryChooseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (_isSimpleOutbound == YES)
    {
        JCModel_ItemsClassifyData * data = _classifyArray[indexPath.row];
        cell.titleLabel.text = data.name;
        cell.idDouble = data.dataIdentifier;
        [self.cellofRepertoryArray addObject:cell];
        
    }
    else
    {
        
        if (indexPath.section == 1)
        {
            JCModel_ItemsClassifyData * data = _classifyArray[indexPath.row];
            cell.titleLabel.text = data.name;
            cell.idDouble = data.dataIdentifier;
            [self.cellofRepertoryArray addObject:cell];
        }
        if (indexPath.section ==0)
        {
            if ([_selfItemString  isEqual: @"franchiser"])
            {
                JCModel_franchiserItemsData *data = _myArray[indexPath.row];
                cell.titleLabel.text = data.name;
                cell.maxNum = (int)data.num;
                cell.contentLabel.text = [NSString stringWithFormat:@"X  %d",(int)data.num];
                cell.idDouble = data.item;
                [self.cellofMyArray addObject:cell];
            }
            else
            {
                JCModel_ItemsData *data = _myArray[indexPath.row];
                NSArray *array = data.itemOne;
                if (array.count > 0)
                {
                    JCModel_ItemsItemOne *itemOne = array[0];
                    cell.titleLabel.text = itemOne.name;
                    cell.maxNum = (int)data.num;
                    cell.contentLabel.text = [NSString stringWithFormat:@"X  %d",(int)data.num];
                    cell.idDouble = itemOne.itemOneIdentifier;
                    [self.cellofMyArray addObject:cell];
                    
                }
            }
        }
    }

    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0)
    {
        return 25;
    }
    else
    {
        return 25;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    UIView* view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = JCBackgroundColor;
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont boldSystemFontOfSize:14];
    label.textColor = JCColorMidGray;
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(10);
        make.centerY.equalTo(view);
    }];
    
    if (_isSimpleOutbound == YES)
    {
        label.text = _warehouseString;

    }
    else
    {
    
        if (section == 0)
        {
            label.text = @"本地";
        }
        if (section == 1)
        {
            label.text = _warehouseString;
        }
    }
    
    return view ;
}

-(void)buttonAction {
    
    [SGActionView showAlertWithTitle:@"是否确定" message:nil leftButtonTitle:@"确定" rightButtonTitle:@"取消" selectedHandle:^(NSInteger index) {
        
        if (index == 0)
        {
            //确定
            NSMutableArray *array = [NSMutableArray arrayWithCapacity:100];
            for (int i = 0; i <self.cellofMyArray.count ; i ++)
            {
                RepertoryChooseTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:identifier];
                cell = self.cellofMyArray[i];
                if (cell.isSelected == YES)
                {
                    JCModel_NewProbationOrderJsonCostsSelf * jsonCostsSelf = [[JCModel_NewProbationOrderJsonCostsSelf alloc]init];
                    jsonCostsSelf.item = cell.idDouble;
                    jsonCostsSelf.num = cell.num;
                    jsonCostsSelf.name = cell.titleLabel.text;

                    [array addObject:jsonCostsSelf];
                    
                }
            }
            NSMutableArray *array2 = [NSMutableArray arrayWithCapacity:100];

            for (int i = 0; i < self.cellofRepertoryArray.count; i ++)
            {
                RepertoryChooseTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:identifier];
                cell = self.cellofRepertoryArray[i];
        
                if (cell.isSelected == YES)
                {
                    JCModel_NewProbationOrderJsonCosts *jsonCosts = [[JCModel_NewProbationOrderJsonCosts alloc]init];
                    jsonCosts.item = cell.idDouble;
                    jsonCosts.num = cell.num;
                    jsonCosts.name = cell.titleLabel.text;
                    [array2 addObject:jsonCosts];
                }

            }
            [self.delegate selectItemsReturn:array withTypestring:_typeString];
            JCModel_MyWarehouseData *data = _warehouseArray[0];
            [self.delegate selectRepertoryItems:array2 withTypestring:_typeString withStoreHourse:data.name];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
     
}

//读取自己身上可用的商品
-(void)readMyItems {
   
    if ([_selfItemString  isEqual: @"franchiser"])
    {
        JCRequest_getFranchiserByIdAndMtype *request = [[JCRequest_getFranchiserByIdAndMtype alloc]init];
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        NSString *userID = [JCTokenManager getUserID];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"id":userID,
                                    @"mtype":_typeString,
                                    };
        
        [request startWithBlockSuccess:^(__kindof JCRequest_getFranchiserByIdAndMtype *request) {
           
            NSLog(@":::::%@",request.responseJSONObject);
            NSDictionary *dic = request.rawJSONObject;
            JCModel_franchiserItemsBase *base = [[JCModel_franchiserItemsBase alloc]initWithDictionary:dic];
            _myArray = base.data;
            //在刷新前清空 所有储存的cell
            [_cellofMyArray removeAllObjects];
            [_cellofRepertoryArray removeAllObjects];
            [self.tableView reloadData];
            
        } failure:^(__kindof JCRequest_getFranchiserByIdAndMtype *request, NSError *error) {
            
           
        }];
        
    }
    else
    {
        
        JCRequest_ReadMyItems *request = [[JCRequest_ReadMyItems alloc]init];
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        NSString *userID = [JCTokenManager getUserID];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"user":userID,
                                    @"type":_typeString,
                                    @"state":@"1",
                                    };
        
        [request startWithBlockSuccess:^(__kindof JCRequest_ReadMyItems *request) {
            
            NSLog(@"%@",request.responseJSONObject);
            NSDictionary *dic = request.rawJSONObject;
            JCModel_ItemsBase *base = [[JCModel_ItemsBase alloc]initWithDictionary:dic];
            _myArray = base.data;
            [_cellofMyArray removeAllObjects];
            [_cellofRepertoryArray removeAllObjects];
            [self.tableView reloadData];
            
        } failure:^(__kindof JCRequest_ReadMyItems *request, NSError *error) {
          
        }];
    }
}

//先查自己所在仓库
-(void)readMywarehouse {
    
    Request_readMyWarehouse *request = [[Request_readMyWarehouse alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token
                                };
    
    [request startWithBlockSuccess:^(__kindof Request_readMyWarehouse *request) {
        
        NSDictionary *dic = request.responseJSONObject;
        JCModel_MyWarehouseBase *base = [[JCModel_MyWarehouseBase alloc]initWithDictionary:dic];
        _warehouseArray = base.data;
        
        [_cellofMyArray removeAllObjects];
        [_cellofRepertoryArray removeAllObjects];
        [_tableView reloadData];
        
    } failure:^(__kindof Request_readMyWarehouse *request, NSError *error) {
        
        
    }];

}

//读取商品总类
-(void)readItemClassify {
    
    Request_readItemClasesify *request = [[Request_readItemClasesify alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    if ([_typeString  isEqual: @"-1"])
    {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"type":@""
                                    };
    }
    else
    {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"type":_typeString
                                    };
    }
    [request startWithBlockSuccess:^(__kindof Request_readItemClasesify *request) {
        
        NSDictionary *dic = request.responseJSONObject;
        JCModel_ItemsClassifyBase *base = [[JCModel_ItemsClassifyBase alloc]initWithDictionary:dic];
        _classifyArray = base.data;
        
        [_cellofMyArray removeAllObjects];
        [_cellofRepertoryArray removeAllObjects];
        [_tableView reloadData];
        
    } failure:^(__kindof Request_readItemClasesify *request, NSError *error) {
        
        
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
