//
//  ComplaintsModel.h
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/11.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ComplaintsModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) double price;
@property (nonatomic, assign) BOOL selected;
@end

NS_ASSUME_NONNULL_END
