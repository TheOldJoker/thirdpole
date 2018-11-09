//
//  PayTableViewCell.m
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/12.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import "PayTableViewCell.h"
#import "YHBaseCategroy.h"
@interface PayTableViewCell()
@property (strong, nonatomic) IBOutlet UILabel *monthLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *realPriceLabel;
@property (strong, nonatomic) IBOutlet UIImageView *selectedImageView;

@end
@implementation PayTableViewCell
- (void)setModel:(PayModel *)model{
    self.monthLabel.text = model.month;
    self.priceLabel.text = [NSString stringWithFormat:@"原价:%@",model.totalPrice];
    self.realPriceLabel.text = [NSString stringWithFormat:@"%.f元",model.price];
    
    NSString *imageString = model.selected == YES ? @"selected" : @"unSelected";
    UIImage * image = [UIImage imageNamed:imageString];
    self.selectedImageView.image = image;
    
    [self setNeedsLayout];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.monthLabel reSetWidth];
    self.monthLabel.width = self.monthLabel.width + 20;
    
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
