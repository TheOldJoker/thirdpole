//
//  MessageTableViewCell.h
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/12.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MessageTableViewCell : UITableViewCell
@property (nonatomic, strong)MessageModel *model;
@end

NS_ASSUME_NONNULL_END
