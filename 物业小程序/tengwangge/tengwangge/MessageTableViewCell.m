//
//  MessageTableViewCell.m
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/12.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import "MessageTableViewCell.h"
@interface MessageTableViewCell()
@property (strong, nonatomic) IBOutlet UILabel *mainTitle;
@property (strong, nonatomic) IBOutlet UILabel *mainSubTitle;
@property (strong, nonatomic) IBOutlet UIImageView *redPoint;
@end
@implementation MessageTableViewCell
- (void)setModel:(MessageModel *)model{
    self.mainTitle.text = model.title;
    self.mainSubTitle.text = model.content;
    self.redPoint.hidden = model.read;
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
