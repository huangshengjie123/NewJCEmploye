//
//  AppDelegate.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/1/24.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "IQKeyboardManager.h"
#import "LCNetwork.h"
#import "LCNetworkConfig.h"
#import "AddressListViewController.h"
#import "WorkViewController.h"
#import "PersonViewController.h"
#import "HomeViewController.h"
#import "BaseNavigationViewController.h"
#import "Macro.h"
#import "JCTokenManager.h"
#import "LoginViewController.h"
#import <UMCommon/UMCommon.h>
#import <UMPush/UMessage.h>
#import <UserNotifications/UserNotifications.h>
#import <UMCommonLog/UMCommonLogHeaders.h>
#import "JCRequset_ReadinAndOutOrder.h"
#import "DataModels.h"
#import "OutboundViewController.h"
#import "JCRequest_ReadAllSell.h"
#import "SellDetailsViewController.h"
#import "JCRequest_searchPurchaserOrders.h"
#import "StockDetailsViewController.h"

@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@property (nonatomic,strong)  LoginViewController       *loginVC;
@property (nonatomic,strong)  HomeViewController        *homeVC;
@property (nonatomic,strong)  WorkViewController        *workVC;
@property (nonatomic,strong)  PersonViewController      *personVC;
@property (nonatomic,strong)  AddressListViewController *addressListVC;
@property (nonatomic,strong)  UINavigationController    *navigationController;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //设置导航控制器
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UITabBarController *tb = [[UITabBarController alloc]init];
    self.window.rootViewController = tb;
    
    self.personVC = [[PersonViewController alloc]init];
    self.homeVC = [[HomeViewController alloc]init];
    self.workVC = [[WorkViewController alloc]init];
    self.addressListVC = [[AddressListViewController alloc]init];
    
    BaseNavigationViewController *nav1 = [[BaseNavigationViewController alloc]initWithRootViewController:self.homeVC];
    BaseNavigationViewController *nav2 = [[BaseNavigationViewController alloc]initWithRootViewController:self.personVC];
    BaseNavigationViewController *nav3 = [[BaseNavigationViewController alloc]initWithRootViewController:self.workVC];
    BaseNavigationViewController *nav4 = [[BaseNavigationViewController alloc]initWithRootViewController:self.addressListVC];
    
    nav1.tabBarItem.title =  @"首页";
    nav1.tabBarItem.image = [UIImage imageNamed:@"Tab_home"];
    nav1.tabBarItem.selectedImage = [[UIImage imageNamed:@"Tab_home2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [nav1.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:BlueColor} forState:UIControlStateSelected];
    
    nav2.tabBarItem.title = @"我的";
    nav2.tabBarItem.image = [UIImage imageNamed:@"Tab_person"];
    nav2.tabBarItem.selectedImage = [[UIImage imageNamed:@"Tab_person2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [nav2.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:BlueColor} forState:UIControlStateSelected];
    
    nav3.tabBarItem.title =  @"工作";
    nav3.tabBarItem.image = [UIImage imageNamed:@"Tab_work"];
    nav3.tabBarItem.selectedImage = [[UIImage imageNamed:@"Tab_work2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [nav3.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:BlueColor} forState:UIControlStateSelected];
    
    nav4.tabBarItem.title =  @"通讯录";
    nav4.tabBarItem.image = [UIImage imageNamed:@"Tab_addressList"];
    nav4.tabBarItem.selectedImage = [[UIImage imageNamed:@"Tab_addressList2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [nav4.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:BlueColor} forState:UIControlStateSelected];
    
    tb.viewControllers = @[nav1,nav3,nav4,nav2];

    //设置键盘管理
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager]; // 获取类库的单例变量
    keyboardManager.enable = YES; // 控制整个功能是否启用
    keyboardManager.shouldResignOnTouchOutside = YES; // 控制点击背景是否收起键盘
    keyboardManager.shouldToolbarUsesTextFieldTintColor = YES; // 控制键盘上的工具条文字颜色是否用户自定义
    keyboardManager.toolbarManageBehaviour = IQAutoToolbarBySubviews; // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
    
    keyboardManager.enableAutoToolbar = YES; // 控制是否显示键盘上的工具条
//    keyboardManager.shouldShowTextFieldPlaceholder = NO; // 是否显示占位文字
    keyboardManager.placeholderFont = [UIFont boldSystemFontOfSize:17]; // 设置占位文字的字体
    keyboardManager.keyboardDistanceFromTextField = 10.0f; // 输入框距离键盘的距离

    //设置网络配置
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        config.mainBaseUrl = @"https://www.ejiecheng.com/oa/";// 测试服务器,
        config.viceBaseUrl = @"https://www.ejiecheng.com/finance/";// 财务测试服务器
//        config.mainBaseUrl = @"http://192.168.0.156:8080/oa/";// 小丁服务器
//
    
//    config.mainBaseUrl = @"https://www.ejiecheng.com/oa/";// 正式服务器
//    config.viceBaseUrl = @"https://www.ejiecheng.com/finance/";// 财务测试服务器
    
    NSLog(@"getUID:::::::::::%@",[JCTokenManager getUserID]);
    
    [UMConfigure initWithAppkey:@"5993ff0575ca3548e60006a2" channel:@"App Store"];
    
    // Push功能配置
    UMessageRegisterEntity * entity = [[UMessageRegisterEntity alloc] init];
    entity.types = UMessageAuthorizationOptionBadge|UMessageAuthorizationOptionAlert|UMessageAuthorizationOptionSound;
    
    
    //如果你期望使用交互式(只有iOS 8.0及以上有)的通知，请参考下面注释部分的初始化代码
    if (([[[UIDevice currentDevice] systemVersion]intValue]>=8)&&([[[UIDevice currentDevice] systemVersion]intValue]<10))
    {
        UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc] init];
        action1.identifier = @"action1_identifier";
        action1.title=@"打开应用";
        action1.activationMode = UIUserNotificationActivationModeForeground;//当点击的时候启动程序
        
        UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];  //第二按钮
        action2.identifier = @"action2_identifier";
        action2.title=@"忽略";
        action2.activationMode = UIUserNotificationActivationModeBackground;//当点击的时候不启动程序，在后台处理
        action2.authenticationRequired = YES;//需要解锁才能处理，如果action.activationMode = UIUserNotificationActivationModeForeground;则这个属性被忽略；
        action2.destructive = YES;
        UIMutableUserNotificationCategory *actionCategory1 = [[UIMutableUserNotificationCategory alloc] init];
        actionCategory1.identifier = @"category1";//这组动作的唯一标示
        [actionCategory1 setActions:@[action1,action2] forContext:(UIUserNotificationActionContextDefault)];
        NSSet *categories = [NSSet setWithObjects:actionCategory1, nil];
        entity.categories=categories;
    }
    //如果要在iOS10显示交互式的通知，必须注意实现以下代码
   if (@available(iOS 10.0, *))
   {
        UNNotificationAction *action1_ios10 = [UNNotificationAction actionWithIdentifier:@"action1_identifier" title:@"打开应用" options:UNNotificationActionOptionForeground];
        UNNotificationAction *action2_ios10 = [UNNotificationAction actionWithIdentifier:@"action2_identifier" title:@"忽略" options:UNNotificationActionOptionForeground];
        UNNotificationCategory *category1_ios10 = [UNNotificationCategory categoryWithIdentifier:@"category1" actions:@[action1_ios10,action2_ios10]   intentIdentifiers:@[] options:UNNotificationCategoryOptionCustomDismissAction];
        NSSet *categories = [NSSet setWithObjects:category1_ios10, nil];
        entity.categories=categories;
       [UNUserNotificationCenter currentNotificationCenter].delegate=self;

    }
    
    [UMessage registerForRemoteNotificationsWithLaunchOptions:launchOptions Entity:entity completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
        NSLog(@"granted::::::%d",granted);
        
        if (granted)
        {
            
        }
        else
        {
            
        }
    }];

    [UMCommonLogManager setUpUMCommonLogManager];
    [UMConfigure setLogEnabled:YES];

    return YES;
}

//iOS10以下使用这两个方法接收通知，
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    [UMessage setAutoAlert:NO];
    if([[[UIDevice currentDevice] systemVersion]intValue] < 10)
    {
        [UMessage didReceiveRemoteNotification:userInfo];
        completionHandler(UIBackgroundFetchResultNewData);
    }
}

//iOS10新增：处理前台收到通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler API_AVAILABLE(ios(10.0)){
    
    NSDictionary * userInfo = notification.request.content.userInfo;
    
    if (@available(iOS 10.0, *))
    {
        if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]])
        {
            //应用处于前台时的远程推送接受
            //关闭U-Push自带的弹出框
            [UMessage setAutoAlert:NO];
            //必须加这句代码
            [UMessage didReceiveRemoteNotification:userInfo];
        }
        else
        {
            //应用处于前台时的本地推送接受
        }
    }
    else
    {
        // Fallback on earlier versions
    }
    //当应用处于前台时提示设置，需要哪个可以设置哪一个
    if (@available(iOS 10.0, *))
    {
    completionHandler(UNNotificationPresentationOptionSound|UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionAlert);
    }
    else
    {
        // Fallback on earlier versions
    }
}

//iOS10新增：处理后台点击通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler API_AVAILABLE(ios(10.0)){
    
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    NSDictionary *aps = [userInfo objectForKey:@"aps"];
    NSString *tag = [aps objectForKey:@"tag"];
    NSString *idSring = [aps objectForKey:@"id"];
    
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]])
    {
        //应用处于后台时的远程推送接受
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
        // 出入库 inout  销售 sale   进货 虚拟充值 recharge   进货 实体进货 send
        if([tag  isEqual: @"inout"])
        {
            JCRequset_ReadinAndOutOrder *request = [[JCRequset_ReadinAndOutOrder alloc]init];
            LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self.window.rootViewController];
            [request addAccessory:requestAccessory];
            NSString *token = [JCTokenManager getToken];
            NSString  *pageNum = [NSString stringWithFormat:@"1"];
            NSString  *pageSize = [NSString stringWithFormat:@"100"];
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"pageNum":pageNum,
                                        @"pageSize":pageSize,
                                        @"id":idSring,
                                        };
            [request startWithBlockSuccess:^(__kindof JCRequset_ReadinAndOutOrder *request) {
                //
                NSLog(@"成功获取出库单");
                NSDictionary *dic = request.responseJSONObject;
                JCModel_InAndOutBase * base = [[JCModel_InAndOutBase alloc]initWithDictionary:dic];
                JCModel_InAndOutData * data = base.data;
                
                if (data.list.count > 0)
                {
                    JCModel_InAndOutList *list = data.list[0];
                    UITabBarController *tab = (UITabBarController *)_window.rootViewController;
                    UINavigationController *nav = tab.viewControllers[tab.selectedIndex];
                    OutboundViewController *outVC =[[OutboundViewController alloc]init];
                    outVC.hidesBottomBarWhenPushed = YES;
                    outVC.listData = list;
                    outVC.vcString = @"all";
                    [nav pushViewController:outVC animated:YES];
                }
            
            } failure:^(__kindof JCRequset_ReadinAndOutOrder *request, NSError *error) {
                
                NSLog(@"失败出库单 %@",error);
            }];
        }
        
        
        if([tag  isEqual: @"sale"])
        {
            //去根据ID 查询销售单
            JCRequest_ReadAllSell *request = [[JCRequest_ReadAllSell alloc]init];
            LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self.window.rootViewController];
            [request addAccessory:requestAccessory];
            NSString *token = [JCTokenManager getToken];
            NSString  *pageNum = [NSString stringWithFormat:@"1"];
            NSString  *pageSize = [NSString stringWithFormat:@"100"];
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"pageNum" :pageNum,
                                        @"pageSize":pageSize,
                                        @"id":idSring,
                                        };
            
            NSLog(@">>>>%@",request.requestArgument);
            
            [request startWithBlockSuccess:^(__kindof JCRequest_ReadAllSell *request) {
                //
                NSLog(@"成功");
                NSDictionary *dic = request.responseJSONObject;
                JCModel_SellOrderBase *base = [[JCModel_SellOrderBase alloc]initWithDictionary:dic];
                JCModel_SellOrderData *data =  [[JCModel_SellOrderData alloc]init];
                data = base.data;
                if (data.list.count > 0)
                {
                    UITabBarController *tab = (UITabBarController *)_window.rootViewController;
                    UINavigationController *nav = tab.viewControllers[tab.selectedIndex];
                    SellDetailsViewController *sellDetailsVc = [[SellDetailsViewController alloc]init];
                    sellDetailsVc.sellOrderList = data.list[0];
                    sellDetailsVc.signString = @"1";
                    sellDetailsVc.hidesBottomBarWhenPushed = YES;
                    [nav pushViewController:sellDetailsVc animated:YES];
                }
                
            } failure:^(__kindof JCRequest_ReadAllSell *request, NSError *error) {
                
                NSLog(@"失败 %@",error);
            }];
        }
        
        
        if([tag  isEqual: @"send"])
        {
            JCRequest_searchPurchaserOrders *request = [[JCRequest_searchPurchaserOrders alloc]init];
            LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self.window.rootViewController];
            [request addAccessory:requestAccessory];
            NSString *token = [JCTokenManager getToken];
            NSString  *pageNum = [NSString stringWithFormat:@"1"];
            NSString  *pageSize = [NSString stringWithFormat:@"100"];
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"pageNum":pageNum,
                                        @"pageSize":pageSize,
                                        @"id":idSring,
                                        };
            [request startWithBlockSuccess:^(__kindof JCRequest_searchPurchaserOrders *request) {
                //
                NSDictionary *dic = request.responseJSONObject;
                NSLog(@"dic >>>>%@",dic);
                JCModel_searchPurchaserstabelBase *base = [[JCModel_searchPurchaserstabelBase alloc]initWithDictionary:dic];
                JCModel_searchPurchaserstabelData *data = base.data;
                
                if (data.list.count > 0)
                {
                    UITabBarController *tab = (UITabBarController *)_window.rootViewController;
                    UINavigationController *nav = tab.viewControllers[tab.selectedIndex];
                    JCModel_searchPurchaserstabelList *list = data.list[0];
                    StockDetailsViewController *outVC =[[StockDetailsViewController alloc]init];
                    outVC.listData = list;
                    outVC.hidesBottomBarWhenPushed = YES;
                    [nav pushViewController:outVC animated:YES];
                    
                }
                
            } failure:^(__kindof JCRequest_searchPurchaserOrders *request, NSError *error) {
                NSLog(@"失败出库单 %@",error);
            }];
            
        }
    }
    else
    {
        //应用处于后台时的本地推送接受
    }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSLog(@"DeviceToken: %@",deviceToken);
    //这里进行的操作，是将Device Token发送到服务端
    [UMessage registerDeviceToken:deviceToken];
    if ([JCTokenManager getUserID])
    {
        [UMessage addTags:[JCTokenManager getUserID] response:^(id  _Nullable responseObject, NSInteger remain, NSError * _Nullable error) {
            
        }];
    }
    
    NSLog(@"%@",[[[[deviceToken description] stringByReplacingOccurrencesOfString: @"<" withString: @""]
                  stringByReplacingOccurrencesOfString: @">" withString: @""]
                 stringByReplacingOccurrencesOfString: @" " withString: @""]);
    
}

/* 互联网 */
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer  API_AVAILABLE(ios(10.0)){
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        
        if (_persistentContainer == nil)
        {
            if (@available(iOS 10.0, *))
            {
                _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"NewJCEmploye"];
            }
            else
            {
                // Fallback on earlier versions
            }
            if (@available(iOS 10.0, *))
            {
                [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error)
                {
                    if (error != nil)
                    {
                        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                        abort();
                    }
                }];
            }
            else
            {
                // Fallback on earlier versions
            }
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
