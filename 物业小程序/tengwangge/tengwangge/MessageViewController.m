//
//  MessageViewController.m
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/11.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import "MessageViewController.h"
#import "UIViewController+YHViewControllerBaseCategory.h"
#import "YHBaseCategroy.h"
#import "MessageModel.h"
#import "MessageInfoViewController.h"
@interface MessageViewController ()
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDatasource];
    [self setBackButton];
    [self.mainTableView normalConfig];
    self.mainTableView.estimatedRowHeight = 80.f;
    self.mainTableView.rowHeight = UITableViewAutomaticDimension;
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)initDatasource {
    NSArray * titles = @[@"停水通知(10月8日)",@"停电停气通知(9月2日)"];
    NSArray * contents = @[
                           @"接成都市自来水有限公司供水部通知，白沙洲水厂主供水管迁改施工，定于2017年3月26日22：00至27日21：00停水。届时，滕王阁一期全部停水，二期降压或无水可用。请受影响用户提前作好停水准备，储水备用，由此来带的不便敬请谅解。详情请咨询市水务集团供水热线：96510。",
                           @"因崇州市政府35KV崇南线迁改，造成部分区域停电，时间为18日6：30-21：30，19日6：30-21：30。受此影响我公司公交加气站18、19日停电期间停止加气，通电期间是否供气另行安排，我公司崇双路加气站按照供气通知进行供气，请各用户在停电期间注意我公司崇双路加气站对外售气情况，造成不便敬请谅解。"
                           ];
    for (int i = 0; i < titles.count; i++) {
        MessageModel * message = [[MessageModel alloc] init];
        message.title = titles[i];
        message.content = contents[i];
        [self.dataArray addObject:message];
    }
    [self.mainTableView reloadData];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MES_CELL"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:@"MES_CELL"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.clipsToBounds = YES;
    MessageModel * message = self.dataArray[indexPath.row];
    cell.textLabel.text = message.title;
    cell.detailTextLabel.text = message.content;
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageModel * message = self.dataArray[indexPath.row];
    MessageInfoViewController * info = [[MessageInfoViewController alloc] init];
    info.message = message;
    [self.navigationController pushViewController:info animated:YES];
}

@end
