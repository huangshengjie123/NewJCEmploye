//
//  PackageViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/11.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "PackageViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "JCRequest_ReadPackage.h"
#import "PackageTableViewCell.h"
@interface PackageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *data2Array;
@property (nonatomic,strong) NSArray *data3Array;
@end

@implementation PackageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"商品套餐";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readData];
}

-(void)addViews {
    
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 + 10);
        make.bottom.equalTo(self.view).offset(0);
    }];
    _tableView.backgroundColor = JCBackgroundColor;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0)
    {
        return _dataArray.count;
    }
    else if (section == 1)
    {
        return  _data2Array.count;
    }
    else
    {
        return _data3Array.count;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"PackageTableViewCell";
    // 1.缓存中取
    PackageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[PackageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.section == 0) {
        
        
        JCModel_PackageData *data = _dataArray[indexPath.row];
        cell.titleLabel.text = data.name;
        cell.totalLabel.text = [NSString stringWithFormat:@"%d ",(int)data.price];
        NSString * str = @"";
        
        for (int i = 0; i < data.items.count; i ++) {
            JCModel_PackageItems *item = data.items[i];
            
            str = [NSString stringWithFormat:@"%@ %@ x %d",str,item.name,(int)item.num];
        }
        cell.contentLabel.text = str;
        
        
        return  cell;
        
    }else if (indexPath.section == 1) {
        JCModel_PackageData *data = _data2Array[indexPath.row];
        cell.titleLabel.text = data.name;
        cell.totalLabel.text = [NSString stringWithFormat:@"%d ",(int)data.price];
        NSString * str = @"";
        
        for (int i = 0; i < data.items.count; i ++) {
            JCModel_PackageItems *item = data.items[i];
            
            str = [NSString stringWithFormat:@"%@ %@ x %d",str,item.name,(int)item.num];
        }
        cell.contentLabel.text = str;
        
        
        return  cell;
    }else {
        JCModel_PackageData *data = _data3Array[indexPath.row];
        cell.titleLabel.text = data.name;
        cell.totalLabel.text = [NSString stringWithFormat:@"%d ",(int)data.price];
        NSString * str = @"";
        
        for (int i = 0; i < data.items.count; i ++) {
            JCModel_PackageItems *item = data.items[i];
            
            str = [NSString stringWithFormat:@"%@ %@ x %d",str,item.name,(int)item.num];
        }
        cell.contentLabel.text = str;
        
        
        return  cell;
    }
    
    
    
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        JCModel_PackageData *data = _dataArray[indexPath.row];
        
        if ([_fromString  isEqual: @"newCustomer"]) {
            //新建返回
            [self.delegate selectPackageReturn:data];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    if (indexPath.section == 1) {
        JCModel_PackageData *data = _data2Array[indexPath.row];
        
        if ([_fromString  isEqual: @"newCustomer"]) {
            //新建返回
            [self.delegate selectPackageReturn:data];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    if (indexPath.section == 2) {
        JCModel_PackageData *data = _data3Array[indexPath.row];
        
        if ([_fromString  isEqual: @"newCustomer"]) {
            //新建返回
            [self.delegate selectPackageReturn:data];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
 
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(void)readData {
    
    JCRequest_ReadPackage *request = [[JCRequest_ReadPackage alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token
                                };
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadPackage *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_PackageBase *base =  [[JCModel_PackageBase alloc]initWithDictionary:dic];
        _dataArray = base.data;
        NSMutableArray *mArray1 = [NSMutableArray arrayWithCapacity:20];
        NSMutableArray *mArray2 = [NSMutableArray arrayWithCapacity:20];
        NSMutableArray *mArray3 = [NSMutableArray arrayWithCapacity:20];
        for (int i = 0; i <base.data.count; i++)
        {
            JCModel_PackageData *data = base.data[i];
            if (data.type == 0)
            {
                [mArray1 addObject:data];
            }
            else if (data.type == 1)
            {
                [mArray2 addObject:data];
            }
            else
            {
                 [mArray3 addObject:data];
            }
            
        }
        
        _dataArray = mArray1;
        _data2Array = mArray2;
        _data3Array = mArray3;
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_ReadPackage *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView* view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = JCBackgroundColor;
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont boldSystemFontOfSize:14];
    label.textColor = JCColorBlack;
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(10);
        make.centerY.equalTo(view);
    }];
    
    if (section == 0)
    {
        label.text = @"设备套餐";
    }
    else if (section == 1)
    {
        label.text = @"水票套餐";
    }
    else
    {
        label.text = @"分期套餐";
    }
    
    return view ;
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
