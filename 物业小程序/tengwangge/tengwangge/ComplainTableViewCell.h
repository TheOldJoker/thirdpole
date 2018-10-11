//
//  ComplainTableViewCell.h
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/11.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComplaintsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ComplainTableViewCell : UITableViewCell
@property (nonatomic, strong)ComplaintsModel *model;
@end

NS_ASSUME_NONNULL_END
