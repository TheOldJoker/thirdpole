//
//  PayModel.h
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/12.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PayModel : NSObject
@property (nonatomic, copy) NSString *month;
@property (nonatomic, copy) NSString *totalPrice;
@property (nonatomic, copy) NSString *preferentialPrice;
@property (nonatomic, assign) double price;
@property (nonatomic, assign) BOOL selected;
@end

NS_ASSUME_NONNULL_END
