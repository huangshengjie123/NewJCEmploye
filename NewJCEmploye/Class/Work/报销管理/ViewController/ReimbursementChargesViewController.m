//
//  ReimbursementChargesViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/15.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "ReimbursementChargesViewController.h"
#import "Macro.h"
#import "PersonDetailsTableViewCell.h"
#import "DataModels.h"
@interface ReimbursementChargesViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UITextField *textField1;
@property (nonatomic,strong) UITextField *textField2;
@property (nonatomic,strong) UITextField *textField3;
@property (nonatomic,strong) UITextField *textField4;
@property (nonatomic,strong) UITextField *textField5;
@property (nonatomic,strong) UITextField *textField6;
@property (nonatomic,strong) UITextField *textField7;
@property (nonatomic,strong) UITextField *textField8;
@property (nonatomic,strong) UITextField *textField9;
@property (nonatomic,strong) UITextField *textField10;
@property (nonatomic,strong) UITextField *textField11;
@property (nonatomic,strong) UITextField *textField12;

@property (nonatomic,strong) NSArray *dataArray1;
@property (nonatomic,strong) NSArray *nameArray1;

@property (nonatomic,strong) NSArray *dataArray2;
@property (nonatomic,strong) NSArray *nameArray2;

@property (nonatomic,strong) NSArray *dataArray3;
@property (nonatomic,strong) NSArray *nameArray3;

@end

@implementation ReimbursementChargesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新增其他收入";
    [self addViews];
    self.view.backgroundColor = JCBackgroundColor;
}
-(void)addViews {
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(JCNew64);
        make.height.equalTo(@(200));
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
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
    
       if ([_typeString  isEqual: @"车辆费用"]) {
           
           NSMutableArray *array = [NSMutableArray arrayWithCapacity:20];
           NSMutableArray *nameArray = [NSMutableArray arrayWithCapacity:20];

           
           if (![_textField1.text  isEqual: @""]) {
               JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
               item.type = @"car_oil";
               item.amount = _textField1.text.doubleValue;
               [array addObject:item];
               
               NSString *str = [NSString stringWithFormat:@"油费(￥%@)",_textField1.text];
               [nameArray addObject:str];
           }
           
           if (![_textField2.text  isEqual: @""]) {
               JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
               item.type = @"car_insu";
               item.amount = _textField2.text.doubleValue;
               [array addObject:item];
               
               NSString *str = [NSString stringWithFormat:@"保险费(￥%@)",_textField2.text];
               [nameArray addObject:str];
           }
           
           if (![_textField3.text  isEqual: @""]) {
               JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
               item.type = @"car_pass";
               item.amount = _textField3.text.doubleValue;
               [array addObject:item];
               
               NSString *str = [NSString stringWithFormat:@"过路费(￥%@)",_textField3.text];
               [nameArray addObject:str];
           }
           
           if (![_textField4.text  isEqual: @""]) {
               JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
               item.type = @"car_park";
               item.amount = _textField4.text.doubleValue;
               [array addObject:item];
               
               NSString *str = [NSString stringWithFormat:@"停车费(￥%@)",_textField4.text];
               [nameArray addObject:str];
           }
           
           if (![_textField5.text  isEqual: @""]) {
               JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
               item.type = @"car_rep";
               item.amount = _textField5.text.doubleValue;
               [array addObject:item];
               
               NSString *str = [NSString stringWithFormat:@"修理费(￥%@)",_textField5.text];
               [nameArray addObject:str];
           }
           
           if (![_textField6.text  isEqual: @""]) {
               JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
               item.type = @"car_break";
               item.amount = _textField6.text.doubleValue;
               [array addObject:item];
               
               NSString *str = [NSString stringWithFormat:@"违章(￥%@)",_textField6.text];
               [nameArray addObject:str];
           }
           
           
           _dataArray1 = array;
           _nameArray1 = nameArray;
           
           [self.delegate SelectReimbursementDetailsSuccess:_dataArray1 andName:_nameArray1 andtype:@"车辆费用"];
           [self.navigationController popViewControllerAnimated:YES];
       }
    
    
    
    
    
    if ([_typeString  isEqual: @"销售费用"]) {
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:20];
        NSMutableArray *nameArray = [NSMutableArray arrayWithCapacity:20];
        
        
        if (![_textField1.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"busi_acti";
            item.amount = _textField1.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"活动费(￥%@)",_textField1.text];
            [nameArray addObject:str];
        }
        
        if (![_textField2.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"busi_gen";
            item.amount = _textField2.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"推广费(￥%@)",_textField2.text];
            [nameArray addObject:str];
        }
        
        if (![_textField3.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"busi_serve";
            item.amount = _textField3.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"招待费(￥%@)",_textField3.text];
            [nameArray addObject:str];
        }
        
        if (![_textField4.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"busi_trip";
            item.amount = _textField4.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"差旅费(￥%@)",_textField4.text];
            [nameArray addObject:str];
        }
        
        if (![_textField5.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"busi_trans";
            item.amount = _textField5.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"运输费(￥%@)",_textField5.text];
            [nameArray addObject:str];
        }
        
        if (![_textField6.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"busi_load";
            item.amount = _textField6.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"装卸费(￥%@)",_textField6.text];
            [nameArray addObject:str];
        }
        
        if (![_textField7.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"busi_rebate";
            item.amount = _textField7.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"返利(￥%@)",_textField7.text];
            [nameArray addObject:str];
        }
        
        if (![_textField8.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"busi_other";
            item.amount = _textField8.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"其他(￥%@)",_textField8.text];
            [nameArray addObject:str];
        }
        
        
        [self.delegate SelectReimbursementDetailsSuccess:array andName:nameArray andtype:@"销售费用"];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
    
    if ([_typeString  isEqual: @"管理费用"]) {
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:20];
        NSMutableArray *nameArray = [NSMutableArray arrayWithCapacity:20];
        
        
        if (![_textField1.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"mgr_buy";
            item.amount = _textField1.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"购置费(￥%@)",_textField1.text];
            [nameArray addObject:str];
        }
        
        if (![_textField2.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"mgr_rent";
            item.amount = _textField2.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"租赁费(￥%@)",_textField2.text];
            [nameArray addObject:str];
        }
        
        if (![_textField3.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"mgr_phone";
            item.amount = _textField3.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"电话费(￥%@)",_textField3.text];
            [nameArray addObject:str];
        }
        
        if (![_textField4.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"mgr_ele";
            item.amount = _textField4.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"水电费(￥%@)",_textField4.text];
            [nameArray addObject:str];
        }
        
        if (![_textField5.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"mgr_rec";
            item.amount = _textField5.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"招聘费(￥%@)",_textField5.text];
            [nameArray addObject:str];
        }
        
        if (![_textField6.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"mgr_train";
            item.amount = _textField6.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"培训费(￥%@)",_textField6.text];
            [nameArray addObject:str];
        }
        
        if (![_textField7.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"mgr_expr";
            item.amount = _textField7.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"快递费(￥%@)",_textField7.text];
            [nameArray addObject:str];
        }
        
        if (![_textField8.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"mgr_board";
            item.amount = _textField8.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"伙食(￥%@)",_textField8.text];
            [nameArray addObject:str];
        }
        
        if (![_textField9.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"mgr_serve";
            item.amount = _textField9.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"招待费(￥%@)",_textField9.text];
            [nameArray addObject:str];
        }
        
        
        if (![_textField10.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"mgr_trip";
            item.amount = _textField10.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"差旅费(￥%@)",_textField10.text];
            [nameArray addObject:str];
        }
        
        
        if (![_textField11.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"mgr_items";
            item.amount = _textField11.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"易耗品(￥%@)",_textField11.text];
            [nameArray addObject:str];
        }
        
        if (![_textField12.text  isEqual: @""]) {
            JCModel_reimbursementCreateReimbursementItems *item = [[JCModel_reimbursementCreateReimbursementItems alloc]init];
            item.type = @"mgr_other";
            item.amount = _textField12.text.doubleValue;
            [array addObject:item];
            
            NSString *str = [NSString stringWithFormat:@"其他(￥%@)",_textField12.text];
            [nameArray addObject:str];
        }
        
        
        
        [self.delegate SelectReimbursementDetailsSuccess:array andName:nameArray andtype:@"管理费用"];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     if ([_typeString  isEqual: @"车辆费用"]) {
         return 6;
     }else if ([_typeString isEqualToString:@"销售费用"]){
         return 8;
     }else {
         return 12;
     }
   
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"PersonDetailsTableViewCell";
    PersonDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[PersonDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if ([_typeString  isEqual: @"车辆费用"]) {
        if (indexPath.row == 0) {
            
            cell.titleLabel.text = @"油费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            cell.textField.keyboardType = UIKeyboardTypeNumberPad;
            cell.textField.placeholder = @"请填写油费金额";
            _textField1 = cell.textField;
        }
        
        if (indexPath.row == 1) {
            
            cell.titleLabel.text = @"保险费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField2 = cell.textField;
            _textField2.keyboardType =UIKeyboardTypeNumberPad;
            _textField2.placeholder = @"请填写保险费金额";
            
        }
        
        
        if (indexPath.row == 2) {
            
            cell.titleLabel.text = @"过路费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField3 = cell.textField;
            _textField3.keyboardType =UIKeyboardTypeNumberPad;
            _textField3.placeholder = @"请填写过路费金额";
        }
        
        if (indexPath.row == 3) {
            cell.titleLabel.text = @"停车费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField4 = cell.textField;
            _textField4.keyboardType =UIKeyboardTypeNumberPad;
            _textField4.placeholder = @"请填写过停车费金额";
            
        }
        
        if (indexPath.row == 4) {
            cell.titleLabel.text = @"修理费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField5 =  cell.textField;
            _textField5.keyboardType =UIKeyboardTypeNumberPad;
            _textField5.placeholder = @"请填写过修理费金额";
        }
        
        if (indexPath.row == 5) {
            cell.titleLabel.text = @"违章";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField6 = cell.textField;
            _textField6.keyboardType =UIKeyboardTypeNumberPad;
            _textField6.placeholder = @"请填写过违章金额";
        }
    }
    
    
    
    if ([_typeString  isEqual: @"销售费用"]) {
        if (indexPath.row == 0) {
            
            cell.titleLabel.text = @"活动费用";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            cell.textField.keyboardType = UIKeyboardTypeNumberPad;
            cell.textField.placeholder = @"请填写活动费用金额";
            _textField1 = cell.textField;
        }
        
        if (indexPath.row == 1) {
            
            cell.titleLabel.text = @"推广费用";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField2 = cell.textField;
            _textField2.keyboardType =UIKeyboardTypeNumberPad;
            _textField2.placeholder = @"请填写推广费用金额";
            
        }
        
        
        if (indexPath.row == 2) {
            
            cell.titleLabel.text = @"招待费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField3 = cell.textField;
            _textField3.keyboardType =UIKeyboardTypeNumberPad;
            _textField3.placeholder = @"请填写招待费金额";
        }
        
        if (indexPath.row == 3) {
            cell.titleLabel.text = @"差旅费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField4 = cell.textField;
            _textField4.keyboardType =UIKeyboardTypeNumberPad;
            _textField4.placeholder = @"请填写过差旅费金额";
            
        }
        
        if (indexPath.row == 4) {
            cell.titleLabel.text = @"运输费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField5 =  cell.textField;
            _textField5.keyboardType =UIKeyboardTypeNumberPad;
            _textField5.placeholder = @"请填写过运输费金额";
        }
        
        if (indexPath.row == 5) {
            cell.titleLabel.text = @"装卸费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField6 = cell.textField;
            _textField6.keyboardType =UIKeyboardTypeNumberPad;
            _textField6.placeholder = @"请填写过装卸费金额";
        }
        if (indexPath.row == 6) {
            cell.titleLabel.text = @"返利";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField7 = cell.textField;
            _textField7.keyboardType =UIKeyboardTypeNumberPad;
            _textField7.placeholder = @"请填写过返利金额";
        }

        if (indexPath.row == 7) {
            cell.titleLabel.text = @"其他";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField8 = cell.textField;
            _textField8.keyboardType =UIKeyboardTypeNumberPad;
            _textField8.placeholder = @"请填写过其他金额";
        }

    }
    
    
    if ([_typeString  isEqual: @"管理费用"]) {
        if (indexPath.row == 0) {
            
            cell.titleLabel.text = @"购置费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            cell.textField.keyboardType = UIKeyboardTypeNumberPad;
            cell.textField.placeholder = @"请填写购置费金额";
            _textField1 = cell.textField;
        }
        
        if (indexPath.row == 1) {
            
            cell.titleLabel.text = @"租赁费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField2 = cell.textField;
            _textField2.keyboardType =UIKeyboardTypeNumberPad;
            _textField2.placeholder = @"请填写租赁费金额";
            
        }
        
        
        if (indexPath.row == 2) {
            
            cell.titleLabel.text = @"电话费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField3 = cell.textField;
            _textField3.keyboardType =UIKeyboardTypeNumberPad;
            _textField3.placeholder = @"请填写电话费金额";
        }
        
        if (indexPath.row == 3) {
            cell.titleLabel.text = @"水电费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField4 = cell.textField;
            _textField4.keyboardType =UIKeyboardTypeNumberPad;
            _textField4.placeholder = @"请填写过水电费金额";
            
        }
        
        if (indexPath.row == 4) {
            cell.titleLabel.text = @"招聘费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField5 =  cell.textField;
            _textField5.keyboardType =UIKeyboardTypeNumberPad;
            _textField5.placeholder = @"请填写过招聘费金额";
        }
        
        if (indexPath.row == 5) {
            cell.titleLabel.text = @"培训费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField6 = cell.textField;
            _textField6.keyboardType =UIKeyboardTypeNumberPad;
            _textField6.placeholder = @"请填写过培训费金额";
        }
        if (indexPath.row == 6) {
            cell.titleLabel.text = @"快递费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField7 = cell.textField;
            _textField7.keyboardType =UIKeyboardTypeNumberPad;
            _textField7.placeholder = @"请填写过快递费金额";
        }
        
        if (indexPath.row == 7) {
            cell.titleLabel.text = @"伙食费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField8 = cell.textField;
            _textField8.keyboardType =UIKeyboardTypeNumberPad;
            _textField8.placeholder = @"请填写过伙食费金额";
        }
        
        if (indexPath.row == 8) {
            cell.titleLabel.text = @"招待费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField9 = cell.textField;
            _textField9.keyboardType =UIKeyboardTypeNumberPad;
            _textField9.placeholder = @"请填写过招待费金额";
        }
        
        if (indexPath.row == 9) {
            cell.titleLabel.text = @"差旅费";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField10 = cell.textField;
            _textField10.keyboardType =UIKeyboardTypeNumberPad;
            _textField10.placeholder = @"请填写过差旅费金额";
        }
        
        if (indexPath.row == 10) {
            cell.titleLabel.text = @"易耗品";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField11 = cell.textField;
            _textField11.keyboardType =UIKeyboardTypeNumberPad;
            _textField11.placeholder = @"请填写过易耗品金额";
        }
        
        if (indexPath.row == 11) {
            cell.titleLabel.text = @"其他";
            cell.textField.hidden = NO;
            cell.arrowImageView.hidden = YES;
            _textField12 = cell.textField;
            _textField12.keyboardType =UIKeyboardTypeNumberPad;
            _textField12.placeholder = @"请填写过其他金额";
        }
        
    }
    
    
    return cell;
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
