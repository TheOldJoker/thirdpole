//
//  ComplaintsPutViewController.m
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/11.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import "ComplaintsPutViewController.h"
#import "UIViewController+YHViewControllerBaseCategory.h"
#import "YHBaseCategroy.h"
@interface ComplaintsPutViewController ()

@end

@implementation ComplaintsPutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackButton];
}
- (IBAction)inputAction:(UIButton *)sender {
    [self showHUDwithString:@"正在提交..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hiddenHUD];
        [self showWeakAlert:@"已提交到物业管理中心"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        });
    });
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
