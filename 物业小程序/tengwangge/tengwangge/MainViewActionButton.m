//
//  MainViewActionButton.m
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/11.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import "MainViewActionButton.h"
#import "YHBaseCategroy.h"
@interface MainViewActionButton()
@property (nonatomic, strong) UILabel *topTitleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@end
@implementation MainViewActionButton

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.topTitleLabel.frame = CGRectMake(0, 0, self.width, 22);
    self.topTitleLabel.bottom = self.height / 2 - 5;
    
    self.subTitleLabel.frame = CGRectMake(0, 0, self.width, 14);
    self.subTitleLabel.top = self.height / 2 + 5;
}
- (UILabel *)topTitleLabel{
    if (!_topTitleLabel) {
        _topTitleLabel = [[UILabel alloc] init];
        [_topTitleLabel configWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:22.f] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
        [self addSubview:_topTitleLabel];
    }
    return _topTitleLabel;
}
- (UILabel *)subTitleLabel{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        [_subTitleLabel configWithTextColor:[UIColor lightGrayColor] font:[UIFont systemFontOfSize:12.f] textAlignment:(NSTextAlignmentCenter) backgroundColor:nil];
        [self addSubview:_subTitleLabel];
    }
    return _subTitleLabel;
}
- (void)setTopTitle:(NSString *)topTitle{
    _topTitle = topTitle;
    self.topTitleLabel.text = topTitle;
}
- (void)setSubTitle:(NSString *)subTitle{
    _subTitle = subTitle;
    self.subTitleLabel.text = subTitle;
}
@end
