//
//  MainViewController.m
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/11.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import "MainViewController.h"
#import "YHBaseNavigationController.h"
#import "YHBaseCategroy.h"
#import "MainViewActionButton.h"
#import "UIViewController+YHViewControllerBaseCategory.h"
@interface MainViewController ()
@property (strong, nonatomic) IBOutlet MainViewActionButton *button1;
@property (strong, nonatomic) IBOutlet MainViewActionButton *button2;
@property (strong, nonatomic) IBOutlet MainViewActionButton *button3;
@property (strong, nonatomic) IBOutlet MainViewActionButton *button4;
@property (strong, nonatomic) IBOutlet MainViewActionButton *button5;
@property (strong, nonatomic) IBOutlet MainViewActionButton *button6;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navConfig];
    [self uiconfig];
}
- (void)navConfig {
    YHBaseNavigationController * nav = (YHBaseNavigationController *)self.navigationController;
    nav.backgroundColor = [UIColor colorWithHexString:@"0d9e59"];
    [self.navigationController.navigationBar setTitleTextAttributes:
  @{NSFontAttributeName:[UIFont systemFontOfSize:18],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
}
- (void)uiconfig {
    self.button1.topTitle = @"物业缴费";
    self.button1.subTitle = @"各项缴费金额及缴费记录";
    
    self.button2.topTitle = @"报修&投诉";
    self.button2.subTitle = @"物业报修和投诉建议";
    
    self.button3.topTitle = @"信息通知";
    self.button3.subTitle = @"停水停电停气重要公告";
    
    self.button4.topTitle = @"便民服务";
    self.button4.subTitle = @"业主便民生活服务";
    
    self.button5.topTitle = @"社区运营工具";
    self.button5.subTitle = @"业主问卷及活动福利";
    
    self.button6.topTitle = @"更多";
    self.button6.subTitle = @"coming soon";
}
//开门
- (IBAction)openTheDoorAciton:(UIButton *)sender {
    [self showHUDwithString:@"正在开门..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hiddenHUD];
        [self showWeakAlert:@"开门成功"];
    });
}
////物业缴费
//- (IBAction)button1Aciton:(MainViewActionButton *)sender {
//}
////报修&投诉
//- (IBAction)button2Action:(MainViewActionButton *)sender {
//}
////信息通知
//- (IBAction)button3Aciton:(MainViewActionButton *)sender {
//}
////便民服务
//- (IBAction)button4Aciton:(MainViewActionButton *)sender {
//}
////社区
//- (IBAction)button5Action:(MainViewActionButton *)sender {
//}
////更多
//- (IBAction)button6Action:(MainViewActionButton *)sender {
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
