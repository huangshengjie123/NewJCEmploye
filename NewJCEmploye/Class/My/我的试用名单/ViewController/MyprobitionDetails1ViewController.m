//
//  MyprobitionDetails1ViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/31.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "MyprobitionDetails1ViewController.h"
#import "Macro.h"
#import "PersonDetailsTableViewCell.h"

@interface MyprobitionDetails1ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel     *namaLabel;
@property (nonatomic,strong) UILabel     *phoneLabel;

@end

@implementation MyprobitionDetails1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"试用客户详情";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readData];
}

-(void)addViews {
    
    UIView *topView = [[UIView alloc]init];
    [self.view addSubview:topView];
    topView.backgroundColor = JCColorWithe;
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(66));
        make.top.equalTo(self.view).offset(JCNew64 + 10);
    }];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"默认头像男"];
    [topView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView);
        make.left.equalTo(topView.mas_left).offset(10);
        make.height.equalTo(@(50));
        make.width.equalTo(@(50));
    }];
    
    _namaLabel = [[UILabel alloc]init];
    _namaLabel.font = JCFont16;
    _namaLabel.textColor = JCColorBlack;
    [topView addSubview:_namaLabel];
    [_namaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView).offset(9);
        make.left.equalTo(imageView.mas_right).offset(10);
    }];
    
    _phoneLabel = [[UILabel alloc]init];
    _phoneLabel.font = JCFont14;
    _phoneLabel.textColor = JCColorBlue;
    [topView addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_namaLabel.mas_bottom).offset(10);
        make.left.equalTo(_namaLabel);
    }];
    
    _namaLabel.text = _listdata.name;
    _phoneLabel.text = _listdata.phone;
    
    UIButton *button1 = [[UIButton alloc]init];
    button1.backgroundColor = [UIColor clearColor];
    [topView addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_phoneLabel);
        make.top.equalTo(_phoneLabel.mas_top).offset(-10);
        make.bottom.equalTo(_phoneLabel.mas_bottom).offset(10);
    }];

    [button1 addTarget:self action:@selector(button1Action) forControlEvents:UIControlEventTouchUpInside];

    
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(10);
        make.bottom.equalTo(self.view);
    }];
    
}

-(void)button1Action {
    NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",_listdata.phone];[[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
  
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
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
    
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"性别";
        if ([_listdata.sex  isEqual: @"0"]) {
            cell.contentLabel.text = @"男";

        }
        if ([_listdata.sex  isEqual: @"1"]) {
            cell.contentLabel.text = @"女";
            
        }
//        cell.contentLabel.text = @"查看经销商商品";
        cell.arrowImageView.hidden = YES;
    }
    
//    if (indexPath.row == 1) {
//        cell.titleLabel.text = @"微信";
//        cell.arrowImageView.hidden = YES;
//        cell.contentLabel.text = _listdata.weChat;
//        //        _positionLabel =  cell.contentLabel;
//    }
    if (indexPath.row == 1) {
        cell.titleLabel.text = @"来源";
        cell.arrowImageView.hidden = YES;
        cell.contentLabel.text = [NSString stringWithFormat:@"%d",(int)_listdata.from];
        //        _phoneLabel = cell.contentLabel;
        
        if ((int)_listdata.from == 0 ) {
            cell.contentLabel.text = @"客户回馈";
        }
        if ((int)_listdata.from == 1 ) {
            cell.contentLabel.text = @"外部活动";
        }
        if ((int)_listdata.from == 2 ) {
            cell.contentLabel.text = @"合作点";
        }
        if ((int)_listdata.from == 3 ) {
            cell.contentLabel.text = @"陌拜";
        }
        if ((int)_listdata.from == 4 ) {
            cell.contentLabel.text = @"转介绍";
        }
        if ((int)_listdata.from == 5 ) {
            cell.contentLabel.text = @"其他";
        }

    }
    if (indexPath.row == 2) {
        cell.titleLabel.text = @"地址";
        cell.arrowImageView.hidden = YES;
        cell.contentLabel.text = _listdata.address;
        //        _addressLabel =  cell.contentLabel;
    }
    if (indexPath.row == 3) {
        cell.titleLabel.text = @"备注";
        cell.arrowImageView.hidden = YES;
        cell.contentLabel.text = _listdata.listDescription;
        //        _wxLabel  =cell.contentLabel;
    }
  
    
    return  cell;
    
}


-(void)readData {
    
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
