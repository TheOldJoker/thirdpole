//
//  MessageInfoViewController.m
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/11.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import "MessageInfoViewController.h"
#import "UIViewController+YHViewControllerBaseCategory.h"
#import "YHBaseCategroy.h"
@interface MessageInfoViewController ()
@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation MessageInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackButton];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.message.title;
    self.contentLabel.text = self.message.content;
    [self.contentLabel reSetHeight];
}
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 74, self.view.width, 0)];
        [_contentLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:22.f] textAlignment:(NSTextAlignmentJustified) backgroundColor:nil];
        _contentLabel.numberOfLines = 0;
        [self.view addSubview:_contentLabel];
    }
    return _contentLabel;
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
