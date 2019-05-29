//
//  NewBusinesstripViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/20.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewBusinesstripViewController.h"
#import "Macro.h"
#import "PersonDetailsTableViewCell.h"
#import "SGActionView.h"
#import "HZQDatePickerView.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"
@interface NewBusinesstripViewController ()<UITableViewDelegate,UITableViewDataSource,HZQDatePickerViewDelegate>
{
    
    HZQDatePickerView *_pikerView;
}
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *reasonlabel;
@property (nonatomic,strong) UILabel *starttimelabel;
@property (nonatomic,strong) UILabel *endtimelabel;
@property (nonatomic,strong) UITextField *fromTextField;
@property (nonatomic,strong) UITextField *toTextField;
@property (nonatomic,strong) UITextField *commentTextField;
@end

@implementation NewBusinesstripViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addViews];
    self.view.backgroundColor = JCBackgroundColor;
}

-(void)addViews {
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).offset(0);
        make.top.equalTo(self.view.mas_top).offset(JCNew64);
        make.bottom.equalTo(self.view.mas_bottom).offset(-90);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 100;  //  随便设个不那么离谱的值
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-10);
        make.height.equalTo(@(40));
    }];
    
    UILabel *label= [[UILabel alloc]init];
    label.text = @"提交";
    label.textColor = JCColorWithe;
    label.font = JCFont14;
    [button addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(button);
    }];
    
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)buttonAction {

    NSString *accessPath = [NSString stringWithFormat:@"%@/finance/businessTrip/create.do?isAppLogin=true&jc4login=%@",BASEURL,[JCTokenManager getToken]];
    
    JCModel_newbusinesstripBase *base = [[JCModel_newbusinesstripBase alloc]init];

    if (![_starttimelabel.text  isEqual: @"请选择"])
    {
        base.start = [NSString stringWithFormat:@"%@ 00:00:00",_starttimelabel.text];
    }
    else
    {
        [self showInfo:@"请选择出发时间"];
        return;
    }
    
    if (![_endtimelabel.text  isEqual: @"请选择"])
    {
        base.endProperty = [NSString stringWithFormat:@"%@ 00:00:00",_endtimelabel.text];
    }
    else
    {
        [self showInfo:@"请选择返回时间"];
        return;
    }
    
    if (![_reasonlabel.text isEqualToString:@"请选择"])
    {
        if ([_reasonlabel.text  isEqual: @"学习"])
        {
            base.type = @"study";
        }
        
        if ([_reasonlabel.text  isEqual: @"销售"])
        {
            base.type = @"business";
        }
        
        if ([_reasonlabel.text  isEqual: @"培训"])
        {
            base.type = @"train";
        }
        
        if ([_reasonlabel.text  isEqual: @"工作支持"])
        {
            base.type = @"work";
        }
    
    }
    else
    {
        [self showInfo:@"请选择事由"];
        return;
    }
    
    if (_fromTextField.text.length > 0)
    {
        base.from = _fromTextField.text;
    }
    else
    {
        [self showInfo:@"请填写出发地"];
        return;
    }
    
    if (_toTextField.text.length > 0)
    {
        base.to = _toTextField.text;
    }
    else
    {
        [self showInfo:@"请填写目的地"];
        return;
    }
   
    base.comment = _commentTextField.text;
    NSDictionary *params = base.dictionaryRepresentation;
    
    [HttpTool postRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
        
        if ([responseDic[@"code"] integerValue] == 0)
        {
            [self showInfo:@"提交成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            [self showInfo:responseDic[@"msg"]];
        }
    } failure:^(NSError *error) {
        
    }];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"PersonDetailsTableViewCell";
    PersonDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[PersonDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (indexPath.row == 0)
    {
        cell.titleLabel.text =@"出差事由";
        cell.contentLabel.text =@"请选择";
        _reasonlabel = cell.contentLabel;
    }
    
    if (indexPath.row == 1)
    {
        cell.titleLabel.text =@"出发地点";
        cell.textField.placeholder =@"请填写出发地";
        cell.textField.hidden = NO;
        cell.arrowImageView.hidden = YES;
        _fromTextField = cell.textField;
    }
    
    if (indexPath.row == 2)
    {
        cell.titleLabel.text =@"出发日期";
        cell.contentLabel.text =@"请选择";
        _starttimelabel = cell.contentLabel;
    }
    
    if (indexPath.row == 3)
    {
        cell.titleLabel.text =@"到达地点";
        cell.textField.placeholder =@"请填写到达地";
        cell.textField.hidden = NO;
        cell.arrowImageView.hidden = YES;
        _toTextField = cell.textField;
    }
    
    if (indexPath.row == 4)
    {
        cell.titleLabel.text =@"返回日期";
        cell.contentLabel.text =@"请选择";
        _endtimelabel = cell.contentLabel;
    }
    if (indexPath.row == 5)
    {
        cell.titleLabel.text =@"备注";
        cell.textField.placeholder =@"请填写备注";
        cell.textField.hidden = NO;
        cell.arrowImageView.hidden = YES;
        _commentTextField = cell.textField;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0)
    {
        NSArray *array = @[@"学习",@"销售",@"培训",@"工作支持"];
        
        [SGActionView showSheetWithTitle:@"选择收入类别" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            _reasonlabel.text = array[index];
        }];
        
    }
    
    if (indexPath.row == 2)
    {
        [self setupDateView:DateTypeOfStart];
    }
    
    if (indexPath.row == 4)
    {
        [self setupDateView:DateTypeOfEnd];
    }
    
}

- (void)getSelectDate:(NSString *)date type:(DateType)type {
    
    NSLog(@"%d - %@", type, date);
    
    switch (type) {
            
        case DateTypeOfStart:
        {
            _starttimelabel.text = [NSString stringWithFormat:@"%@", date];
        }
            break;
        case DateTypeOfEnd:
        {
            _endtimelabel.text = [NSString stringWithFormat:@"%@", date];
        }
            break;
    
        default:
            break;
    }
}


- (void)setupDateView:(DateType)type {
    
    _pikerView = [HZQDatePickerView instanceDatePickerView];
    _pikerView.frame = CGRectMake(0, 0, JCScreen_Width, JCScreen_Height + 20);
    [_pikerView setBackgroundColor:[UIColor clearColor]];
    _pikerView.delegate = self;
    _pikerView.type = type;
//     今天开始往后的日期
//        [_pikerView.datePickerView setMinimumDate:[NSDate date]];
//    // 在今天之前的日期
//    [_pikerView.datePickerView setMaximumDate:[NSDate date]];
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
