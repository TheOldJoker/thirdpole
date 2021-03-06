//
//  UIViewController+YHViewControllerBaseCategory.h
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/11.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (YHViewControllerBaseCategory)
- (void)showWeakAlert:(NSString *)weakAlert;
- (void)showHUDwithString:(NSString *)hudString;
- (void)hiddenHUD;
- (void)setBackButton;
@end

NS_ASSUME_NONNULL_END
