//
//  UIViewController+YHViewControllerBaseCategory.m
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/11.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import "UIViewController+YHViewControllerBaseCategory.h"
#import "MBProgressHUD.h"
#import "YHBaseCategroy.h"
@implementation UIViewController (YHViewControllerBaseCategory)
- (void)setBackButton
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initBackButtonWithTarget:self action:@selector(popViewController)];
}
- (void)showWeakAlert:(NSString *)weakAlert {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:1];
    if (weakAlert == nil) {
        hud.label.text = @"error...";
    }else{
        hud.label.text = weakAlert;
    }
}
- (void)showHUDwithString:(NSString *)hudString {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if (hudString == nil) {
        hud.label.text = @"loading...";
    }else{
        hud.label.text = hudString;
    }
}
- (void)hiddenHUD {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
