//
//  MyItemsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/4/28.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "MyItemsViewController.h"
#import "JCSelectView.h"
#import "Macro.h"
#import "JCRequest_ReadMyItems.h"
#import "MyItemsTableViewCell.h"
#import "DataModels.h"
#import "JCRequest_getFranchiserByIdAndMtype.h"
#import "JCRequest_getUserItemsByGuide.h"
#import "JCRequest_getUserItemsGroup.h"
@interface MyItemsViewController ()<JCSelectViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation MyItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.title = @"我的物品";
    self.view.backgroundColor = JCBackgroundColor;
    [self readData];
    [self addViews];
}

-(void)addViews {
    
    JCSelectView *jcselectView = [[JCSelectView alloc]initWithFrame:CGRectMake(0, JCNew64 + 10, JCScreen_Width, 40) withTitleArray:@[@"设备",@"水",@"配件"]];
    jcselectView.delegate = self;
    [self.view addSubview:jcselectView];

    _tableView = [[UITableView alloc]init];
    _tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(jcselectView.mas_bottom).offset(10);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"MyItemsTableViewCell";
    MyItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[MyItemsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

     if ([_sting  isEqual: @"franchiser"])
     {
         JCModel_franchiserItemsData *data = _dataArray[indexPath.row];
         cell.titelLabel.text = data.name;
         cell.contentLabel.text = [NSString stringWithFormat:@"X  %d",(int)data.num];
     }
     else
     {
         JCModel_NewItemModelNData *data = _dataArray[indexPath.row];
      
         if (_dataArray.count > 0)
         {
             if (data.state == 1)
             {
                 cell.titelLabel.text = [NSString stringWithFormat:@"%@(在本地)",data.name];
             }
             else if (data.state == 2)
             {
                 cell.titelLabel.text = [NSString stringWithFormat:@"%@(在试用)",data.name];
             }
             else if (data.state == 3)
             {
                 cell.titelLabel.text = [NSString stringWithFormat:@"%@(在合作点)",data.name];
             }
             else
             {
                 cell.titelLabel.text = [NSString stringWithFormat:@"%@(未知状态)",data.name];
             }
             cell.contentLabel.text = [NSString stringWithFormat:@"X  %d",(int)data.num];
         }
     }
    return  cell;
    
}

//读取设备数据
-(void)readData {
    
    if ([_sting  isEqual: @"franchiser"])
    {
        JCRequest_getFranchiserByIdAndMtype *request = [[JCRequest_getFranchiserByIdAndMtype alloc]init];
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        NSString *userID = [JCTokenManager getUserID];
        
        if (_guiID != nil)
        {
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"id":_guiID,
                                        @"mtype":@"2"
                                        };
        }
        else
        {
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"id":userID,
                                        @"mtype":@"2"
                                        };
        }
      
        
        [request startWithBlockSuccess:^(__kindof JCRequest_getFranchiserByIdAndMtype *request) {
            //
            NSLog(@"成功");
//            NSLog(@"%@",request.responseJSONObject);
            NSDictionary *dic = request.rawJSONObject;
            JCModel_franchiserItemsBase *base = [[JCModel_franchiserItemsBase alloc]initWithDictionary:dic];
            _dataArray = base.data;
            [self.tableView reloadData];
            
        } failure:^(__kindof JCRequest_getFranchiserByIdAndMtype *request, NSError *error) {
            
            NSLog(@"失败 %@",error);
            
        }];
        
        
    }else if ([_sting  isEqual: @"工作组"]) {
        
        JCRequest_getUserItemsGroup *request = [[JCRequest_getUserItemsGroup alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
//        NSString *userID = [JCTokenManager getUserID];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"groupId":_groupId,
                                    @"type":@"2"
                                    };

        [request startWithBlockSuccess:^(__kindof JCRequest_getUserItemsGroup *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.rawJSONObject;
            
            JCModel_NewItemModelNBase *base = [[JCModel_NewItemModelNBase alloc]initWithDictionary:dic];
            
            _dataArray = base.data;
            
            [self.tableView reloadData];
            
        } failure:^(__kindof JCRequest_getUserItemsGroup *request, NSError *error) {
            
            NSLog(@"失败 %@",error);
            
        }];
    
        
        
    }else if ([_sting  isEqual: @"工作组组员"]) {
        
        JCRequest_getUserItemsGroup *request = [[JCRequest_getUserItemsGroup alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"guide":_guideSring,
                                    @"groupId":_groupId,
                                    @"type":@"2"
                                    };
        
        [request startWithBlockSuccess:^(__kindof JCRequest_getUserItemsGroup *request) {
            //
            NSLog(@"成功");
//            NSLog(@"%@",request.responseJSONObject);
            NSDictionary *dic = request.rawJSONObject;
            
            JCModel_NewItemModelNBase *base = [[JCModel_NewItemModelNBase alloc]initWithDictionary:dic];
            
            _dataArray = base.data;
            
            [self.tableView reloadData];
            
        } failure:^(__kindof JCRequest_getUserItemsGroup *request, NSError *error) {
            
            NSLog(@"失败 %@",error);
            
        }];
        
        
    }
    else
    {
        JCRequest_getUserItemsByGuide *request = [[JCRequest_getUserItemsByGuide alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        NSString *userID = [JCTokenManager getUserID];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"guide":userID,
                                    @"type":@"2"
                                    };
        
        [request startWithBlockSuccess:^(__kindof JCRequest_getUserItemsByGuide *request) {
            //
            NSLog(@"成功");
//            NSLog(@"%@",request.responseJSONObject);
            NSDictionary *dic = request.rawJSONObject;
            
            JCModel_NewItemModelNBase *base = [[JCModel_NewItemModelNBase alloc]initWithDictionary:dic];
            
            _dataArray = base.data;
            
            [self.tableView reloadData];
            
        } failure:^(__kindof JCRequest_getUserItemsByGuide *request, NSError *error) {
            
            NSLog(@"失败 %@",error);
            
        }];
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

- (void)buttonAction:(int)buttonNum {
  
    
    if ([_sting  isEqual: @"franchiser"]) {
        
        
        NSString *type = [[NSString alloc]init];
        
        if (buttonNum == 0) {
            type = @"2";
        }
        if (buttonNum == 1) {
            type = @"1";
        }
        if (buttonNum == 2) {
            type = @"3";
        }
        
        
        JCRequest_getFranchiserByIdAndMtype *request = [[JCRequest_getFranchiserByIdAndMtype alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        NSString *userID = [JCTokenManager getUserID];
        
        if (_guiID != nil) {
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"id":_guiID,
                                        @"mtype":@"2"
                                        };
        }else{
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"id":userID,
                                        @"mtype":@"2"
                                        };
        }
        
        [request startWithBlockSuccess:^(__kindof JCRequest_getFranchiserByIdAndMtype *request) {
            //
            NSLog(@"成功");
//            NSLog(@"%@",request.responseJSONObject);
            NSDictionary *dic = request.rawJSONObject;
            
           JCModel_franchiserItemsBase *base = [[JCModel_franchiserItemsBase alloc]initWithDictionary:dic];
            
            _dataArray = base.data;
            
            [self.tableView reloadData];
            
        } failure:^(__kindof JCRequest_getFranchiserByIdAndMtype *request, NSError *error) {
            
            NSLog(@"失败 %@",error);
            
        }];
        
    }else if ([_sting  isEqual: @"工作组"]) {
     
        NSString *type = [[NSString alloc]init];
        
        if (buttonNum == 0) {
            type = @"2";
        }
        if (buttonNum == 1) {
            type = @"1";
        }
        if (buttonNum == 2) {
            type = @"3";
        }
        
        
        JCRequest_getUserItemsGroup *request = [[JCRequest_getUserItemsGroup alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        NSString *userID = [JCTokenManager getUserID];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"groupid":_groupId,
                                    @"type":type
                                    };
        
        [request startWithBlockSuccess:^(__kindof JCRequest_getUserItemsGroup *request) {
            //
            NSLog(@"成功");
//            NSLog(@"%@",request.responseJSONObject);
            NSDictionary *dic = request.rawJSONObject;
            
            JCModel_NewItemModelNBase *base = [[JCModel_NewItemModelNBase alloc]initWithDictionary:dic];
            
            _dataArray = base.data;
            
            [self.tableView reloadData];
            
        } failure:^(__kindof JCRequest_getUserItemsGroup *request, NSError *error) {
            
            NSLog(@"失败 %@",error);
            
        }];
    
        
        
    }else if ([_sting  isEqual: @"工作组组员"]) {
        NSString *type = [[NSString alloc]init];
        
        if (buttonNum == 0) {
            type = @"2";
        }
        if (buttonNum == 1) {
            type = @"1";
        }
        if (buttonNum == 2) {
            type = @"3";
        }
        
        
        JCRequest_getUserItemsGroup *request = [[JCRequest_getUserItemsGroup alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"guide":_guideSring,
                                    @"groupId":_groupId,
                                    @"type":type
                                    };
        
        [request startWithBlockSuccess:^(__kindof JCRequest_getUserItemsGroup *request) {
            //
            NSLog(@"成功");
//            NSLog(@"%@",request.responseJSONObject);
            NSDictionary *dic = request.rawJSONObject;
            
            JCModel_NewItemModelNBase *base = [[JCModel_NewItemModelNBase alloc]initWithDictionary:dic];
            
            _dataArray = base.data;
            
            [self.tableView reloadData];
            
        } failure:^(__kindof JCRequest_getUserItemsGroup *request, NSError *error) {
            
            NSLog(@"失败 %@",error);
            
        }];
        
    }else {
        NSString *type = [[NSString alloc]init];
        
        if (buttonNum == 0) {
            type = @"2";
        }
        if (buttonNum == 1) {
            type = @"1";
        }
        if (buttonNum == 2) {
            type = @"3";
        }
        
        
        JCRequest_getUserItemsByGuide *request = [[JCRequest_getUserItemsByGuide alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        NSString *userID = [JCTokenManager getUserID];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"guide":userID,
                                    @"type":type
                                    };
        
        [request startWithBlockSuccess:^(__kindof JCRequest_getUserItemsByGuide *request) {
            //
            NSLog(@"成功");
//            NSLog(@"%@",request.responseJSONObject);
            NSDictionary *dic = request.rawJSONObject;
            
            JCModel_NewItemModelNBase *base = [[JCModel_NewItemModelNBase alloc]initWithDictionary:dic];
            
            _dataArray = base.data;
            
            [self.tableView reloadData];
            
        } failure:^(__kindof JCRequest_getUserItemsByGuide *request, NSError *error) {
            
            NSLog(@"失败 %@",error);
            
        }];
    }
    

}



@end
