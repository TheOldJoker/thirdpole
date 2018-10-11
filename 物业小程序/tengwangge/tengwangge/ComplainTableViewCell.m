//
//  ComplainTableViewCell.m
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/11.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import "ComplainTableViewCell.h"
@interface ComplainTableViewCell()
@property (strong, nonatomic) IBOutlet UILabel *nameTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UIButton *selectButton;
@end
@implementation ComplainTableViewCell
- (void)setModel:(ComplaintsModel *)model{
    _model = model;
    self.nameTitleLabel.text = model.title;
    if (model.price == 0) {
        if (![model.title isEqualToString:@"其它"]) {
            self.contentLabel.text = @"免费";
            self.contentLabel.textColor = [UIColor grayColor];
        }else{
            self.contentLabel.text = @"根据实际业务评估";
            self.contentLabel.textColor = [UIColor grayColor];
        }
    }else{
        self.contentLabel.text = [NSString stringWithFormat:@"%.1f元/次",model.price];
    }
    self.selectButton.selected = model.selected;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
