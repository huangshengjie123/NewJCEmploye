//
//  TotalViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/6.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//   1 是水  2是设备 3是配件
// 屏幕尺寸 ScreenRect
#define ScreenRectHeight [UIScreen mainScreen].applicationFrame.size.height
#define ScreenRectWidth [UIScreen mainScreen].applicationFrame.size.width

#import "TotalViewController.h"
#import "JCSelectView.h"
#import "Macro.h"
#import "YUFoldingTableView.h"
#import "YUCustomHeaderView.h"
#import "JCRequest_ReadAllTotalOutOrder.h"
#import "DataModels.h"
#import "HZQDatePickerView.h"
#import "InventoryWarningTableViewCell.h"
@interface TotalViewController ()<JCSelectViewDelegate,YUFoldingTableViewDelegate,HZQDatePickerViewDelegate>
{
    
    HZQDatePickerView *_pikerView;
}
@property (nonatomic, weak) YUFoldingTableView *foldingTableView;
@property (nonatomic,strong) NSArray *dataArray; //水
@property (nonatomic,strong) NSArray *dataArray2; //设备
@property (nonatomic,strong) NSArray *dataArray3; //配件

@property (nonatomic,strong) UILabel *startLabel; //开始时间
@property (nonatomic,strong) UILabel *endLabel; //结束时间

@property (nonatomic,strong) NSString *stringType;// 类型切换

@end

@implementation TotalViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    _stringType = @"0";
    self.title = @"出入库统计";
    [self readData];
}

-(void)addViews {
  
    NSString *str1=@"";
    NSString *str2 = @"";
    
    if ([_inoutSring  isEqual: @"in"])
    {
        str1 = @"待入库统计";
        str2 = @"已入库总计";
    }
    else
    {
        str1 = @"待出库总计";
        str2 = @"已出库总计";
    }
    
    JCSelectView *jcselectView = [[JCSelectView alloc]initWithFrame:CGRectMake(0, JCNew64 + 10, JCScreen_Width, 40) withTitleArray:@[str1,str2]];
    jcselectView.delegate = self;
    [self.view addSubview:jcselectView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIView *midView = [[UIView alloc]init];
    midView.backgroundColor= JCColorWithe;
    [self.view addSubview:midView];
    [midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(jcselectView.mas_bottom);
        make.height.equalTo(@(50));
    }];

    UILabel *label = [[UILabel alloc]init];
    label.text = @"开始:";
    label.textColor = JCColorMidGray;
    label.font = JCFont13;
    [midView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(midView).offset(10);
        make.centerY.equalTo(midView);
    }];


    _startLabel = [[UILabel alloc]init];
    _startLabel.textColor = JCColorBlack;
    _startLabel.font = JCFont14;
    _startLabel.text = @"请选择";
    [midView addSubview:_startLabel];
    [_startLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).offset(10);
        make.centerY.equalTo(midView);
        make.width.equalTo(@(80));
    }];

    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"结束:";
    label2.textColor = JCColorMidGray;
    label2.font = JCFont13;
    [midView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_startLabel.mas_right).offset(10);
        make.centerY.equalTo(midView);
    }];
    
    _endLabel = [[UILabel alloc]init];
    _endLabel.textColor = JCColorBlack;
    _endLabel.font = JCFont14;
    _endLabel.text =@"请选择";
    [midView addSubview:_endLabel];
    [_endLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2.mas_right).offset(10);
        make.centerY.equalTo(midView);
        make.width.equalTo(@(80));
    }];

    UIButton *button = [[UIButton alloc]init];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [midView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(50));
        make.height.equalTo(@(30));
        make.centerY.equalTo(midView);
        make.right.equalTo(midView).offset(-10);
    }];
    button.titleLabel.font = JCFont13;
    button.backgroundColor = JCColorBlue;
    [button setTitleColor:JCColorWithe forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction3) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton *button1 = [[UIButton alloc]init];
    button1.backgroundColor = [UIColor clearColor];
    [midView addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.equalTo(midView);
        make.left.right.equalTo(_startLabel);

    }];
    [button1 addTarget:self action:@selector(buttonAction1) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.backgroundColor = [UIColor clearColor];
    [midView addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(midView);
        make.left.right.equalTo(_endLabel);
    }];
    [button2 addTarget:self action:@selector(buttonAction2) forControlEvents:UIControlEventTouchUpInside];

    
    YUFoldingTableView *foldingTableView = [[YUFoldingTableView alloc] init];
    [self.view addSubview:foldingTableView];
    [foldingTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(midView.mas_bottom);
    }];
    _foldingTableView = foldingTableView;
    [self.view addSubview:foldingTableView];
    foldingTableView.foldingDelegate = self;
    // 可以设置cell默认展开，不设置的话，默认折叠
    //foldingTableView.foldingState = YUFoldingSectionStateShow;
}

//出库入库 切换
-(void)buttonAction:(int)buttonNum {
    
    NSLog(@"切换 到了 %d",buttonNum);
    _stringType = [NSString stringWithFormat:@"%d",buttonNum];
    [self readNUmData];
}

#pragma mark - YUFoldingTableViewDelegate / required（必须实现的代理）
- (NSInteger )numberOfSectionForYUFoldingTableView:(YUFoldingTableView *)yuTableView
{
    return 3;
}
- (NSInteger )yuFoldingTableView:(YUFoldingTableView *)yuTableView numberOfRowsInSection:(NSInteger )section
{
    if (section == 1)
    {
        return _dataArray.count;
    }
    else if (section == 0)
    {
        return _dataArray2.count;
    }
    else
    {
        return _dataArray3.count;
    }
}
- (CGFloat )yuFoldingTableView:(YUFoldingTableView *)yuTableView heightForHeaderInSection:(NSInteger )section
{
    return 50;
}
- (CGFloat )yuFoldingTableView:(YUFoldingTableView *)yuTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)yuFoldingTableView:(YUFoldingTableView *)yuTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"InventoryWarningTableViewCell";
    InventoryWarningTableViewCell *cell = [yuTableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[InventoryWarningTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Row %ld",indexPath.row];

    if (indexPath.section == 1) {
        JCModel_inAndOutTotalData *data = _dataArray[indexPath.row];
        cell.textLabel.text = data.name;
        cell.contentLabel.text = [NSString stringWithFormat:@"X  %d",(int)data.total];
    }
    if (indexPath.section == 0) {
        JCModel_inAndOutTotalData *data = _dataArray2[indexPath.row];
        cell.textLabel.text = data.name;
         cell.contentLabel.text = [NSString stringWithFormat:@"X  %d",(int)data.total];
    }
    if (indexPath.section == 2) {
        JCModel_inAndOutTotalData *data = _dataArray3[indexPath.row];
        cell.textLabel.text = data.name;
         cell.contentLabel.text = [NSString stringWithFormat:@"X  %d",(int)data.total];
    }
    
    
    
    
    
    return cell;
}
#pragma mark - YUFoldingTableViewDelegate / optional （可选择实现的）

- (NSString *)yuFoldingTableView:(YUFoldingTableView *)yuTableView titleForHeaderInSection:(NSInteger)section
{
    
    if (section == 0) {
        return @"设备";
    }else  if (section == 1){
   
        return @"水";
    }else {
        return @"配件";
    }
    
}

- (void )yuFoldingTableView:(YUFoldingTableView *)yuTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [yuTableView deselectRowAtIndexPath:indexPath animated:YES];
}

// 返回箭头的位置
- (YUFoldingSectionHeaderArrowPosition)perferedArrowPositionForYUFoldingTableView:(YUFoldingTableView *)yuTableView
{
    // 没有赋值，默认箭头在左
    return self.arrowPosition ? :YUFoldingSectionHeaderArrowPositionLeft;
}

- (NSString *)yuFoldingTableView:(YUFoldingTableView *)yuTableView descriptionForHeaderInSection:(NSInteger )section
{
    if (section == 1) {
        return [NSString stringWithFormat:@"%lu",(unsigned long)_dataArray.count];
    }else if (section == 0) {
        return [NSString stringWithFormat:@"%lu",(unsigned long)_dataArray2.count];
    }else {
        return [NSString stringWithFormat:@"%lu",(unsigned long)_dataArray3.count];
    }
}

//读取数据
-(void)readData {
    
//    JCRequest_ReadAllTotalOutOrder *request = [[JCRequest_ReadAllTotalOutOrder alloc]init];
//
//    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
//    [request addAccessory:requestAccessory];
//    NSString *token = [JCTokenManager getToken];
////    request.requestArgument = @{
////                                @"isAppLogin":@"true",
////                                @"jc4login":token,
////                                @"status":@"output_code_check",
////                                @"ptype":@"0",
////                                @"createTime":@"2018-09-01",
////                                @"type":@"1",
////                                @"endTime":@"2018-11-01",
////                                @"storeHouse":_warehouseId
////                                };
//    request.requestArgument = @{
//                                @"isAppLogin":@"true",
//                                @"jc4login":token,
//                                @"ptype":@"0",
//                                @"createTime":@"2018-09-01",
//                                @"endTime":@"2018-11-01",
//                                @"storeHouse":_warehouseId
//                                };
//
//
//    [request startWithBlockSuccess:^(__kindof JCRequest_ReadAllTotalOutOrder *request) {
//        //
//        NSLog(@"成功");
//
//        NSDictionary *dic = request.responseJSONObject;
//        JCModel_inAndOutTotalBase *base = [[JCModel_inAndOutTotalBase alloc]initWithDictionary:dic];
//
//        _dataArray = base.data;
//
//
//        [_foldingTableView reloadData];
//        NSLog(@"%@",dic);
//
//    } failure:^(__kindof JCRequest_ReadAllTotalOutOrder *request, NSError *error) {
//        NSLog(@"失败 %@",error);
//    }];
}

- (void)getSelectDate:(NSString *)date type:(DateType)type {
    NSLog(@"%d - %@", type, date);
    
    switch (type) {
        case DateTypeOfStart:
            _startLabel.text = [NSString stringWithFormat:@"%@", date];
            
            break;
            
        case DateTypeOfEnd:
            _endLabel.text = [NSString stringWithFormat:@"%@", date];
            
            break;
            
        default:
            break;
    }
}

-(void)buttonAction1 {
    //选择开始
     [self setupDateView:DateTypeOfStart];
}

-(void)buttonAction2 {
    //选择结束
     [self setupDateView:DateTypeOfEnd];
}

-(void)buttonAction3 {
    //确定按钮
    [self readNUmData];
    
}
-(void)readNUmData {
    
    JCRequest_ReadAllTotalOutOrder *request = [[JCRequest_ReadAllTotalOutOrder alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    NSString *str = @"";
    if ([_inoutSring  isEqual: @"in"]) {
        str = @"1";
    }else {
        str = @"0";
    }
  
    if ([_stringType  isEqual: @"0"]) {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"ptype":str,
                                    @"createTime":_startLabel.text,
                                    @"endTime":_endLabel.text,
                                    @"storeHouse":_warehouseId,
                                    };
    }
    
    if ([_stringType  isEqual: @"1"]){
   
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"ptype":@"0",
                                    @"createTime":_startLabel.text,
                                    @"endTime":_endLabel.text,
                                    @"storeHouse":_warehouseId,
                                    @"status":@"completed",
                                    };
    }
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadAllTotalOutOrder *request) {
        //
        NSLog(@"成功");
        
        NSDictionary *dic = request.responseJSONObject;
        JCModel_inAndOutTotalBase *base = [[JCModel_inAndOutTotalBase alloc]initWithDictionary:dic];
        NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:20];
        NSMutableArray *mArray2 = [NSMutableArray arrayWithCapacity:20];
        NSMutableArray *mArray3 = [NSMutableArray arrayWithCapacity:20];

        for (int i = 0; i < base.data.count; i++) {
            JCModel_inAndOutTotalData *data = base.data[i];
            if (data.type == 1) {
                [mArray addObject:data];
            }
            if (data.type == 2) {
                [mArray2 addObject:data];
            }
            if (data.type == 3) {
                [mArray3 addObject:data];
            }
        }
        _dataArray = mArray;
        _dataArray2 = mArray2;
        _dataArray3 = mArray3;

        
        [_foldingTableView reloadData];
        NSLog(@"%@",dic);
        
    } failure:^(__kindof JCRequest_ReadAllTotalOutOrder *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
}

- (void)setupDateView:(DateType)type {
    
    _pikerView = [HZQDatePickerView instanceDatePickerView];
    _pikerView.frame = CGRectMake(0, 0, JCScreen_Width, JCScreen_Height + 20);
    [_pikerView setBackgroundColor:[UIColor clearColor]];
    _pikerView.delegate = self;
    _pikerView.type = type;
    // 今天开始往后的日期
//    [_pikerView.datePickerView setMinimumDate:[NSDate date]];
    // 在今天之前的日期
        [_pikerView.datePickerView setMaximumDate:[NSDate date]];
    [self.view addSubview:_pikerView];
    
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
