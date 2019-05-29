//
//  SearchDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/14.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "SearchDetailsViewController.h"
#import "Macro.h"
#import "PersonDetailsTableViewCell.h"
#import "DataModels.h"
@interface SearchDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *departmentLabel;
@property (nonatomic,strong) UILabel *positionLabel;
@property (nonatomic,strong) UILabel *phoneLabel;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong) UILabel *wxLabel;

@end

@implementation SearchDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"详细资料";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void)addViews {
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64);
        make.bottom.equalTo(self.view);
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 7;
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
        cell.titleLabel.text = @"头像";
        cell.kImageView.hidden = NO;
        cell.arrowImageView.hidden = YES;
        if ([_infoData.sex  isEqual: @"0"])
        {
            cell.kImageView.image = [UIImage imageNamed:@"默认头像男"];
        }
        else
        {
            cell.kImageView.image = [UIImage imageNamed:@"默认头像女"];
        }
    }
    
    if (indexPath.row == 1)
    {
        cell.titleLabel.text = @"姓名";
        cell.arrowImageView.hidden = YES;
        cell.contentLabel.text = _infoData.name;
    }
    
    if (indexPath.row == 2)
    {
        cell.titleLabel.text = @"部门";
        cell.arrowImageView.hidden = YES;
        cell.contentLabel.text = _infoData.orgName;
        if (_infoData.orgName == nil)
        {
            
        };
    }
    if (indexPath.row == 3)
    {
        cell.titleLabel.text = @"qq";
        cell.arrowImageView.hidden = YES;
        cell.contentLabel.text = _infoData.qq;
    }
    if (indexPath.row == 4)
    {
        cell.titleLabel.text = @"手机";
        cell.arrowImageView.hidden = YES;
        cell.contentLabel.text = _infoData.mbPhone;
    }
    if (indexPath.row == 5)
    {
        cell.titleLabel.text = @"邮箱";
        cell.arrowImageView.hidden = YES;
        cell.contentLabel.text = _infoData.email;
    }
    if (indexPath.row == 6)
    {
        cell.titleLabel.text = @"微信";
        cell.arrowImageView.hidden = YES;
        cell.contentLabel.text = _infoData.weChat;
    }
    return  cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0)
    {
        return 66.0;
    }
    else
    {
        return 44;
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
