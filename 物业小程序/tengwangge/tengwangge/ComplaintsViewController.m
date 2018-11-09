//
//  ComplaintsViewController.m
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/11.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import "ComplaintsViewController.h"
#import "UIViewController+YHViewControllerBaseCategory.h"
#import "ComplainTableViewCell.h"
#import "YHBaseCategroy.h"
@interface ComplaintsViewController ()
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) IBOutlet UIButton *inputButton;
@property (strong, nonatomic) NSMutableArray *dataArray;
@end

@implementation ComplaintsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackButton];
    [self.mainTableView normalConfig];
    [self initDatasource];
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)initDatasource {
    NSArray * titles = @[@"电梯报修",@"门窗维修",@"水电维修",@"建筑维修",@"通讯设备维修",@"其它"];
    NSArray * prices = @[@(0),@(0),@(200),@(998),@(1000),@(0)];
    for (int i = 0; i < titles.count; i++) {
        ComplaintsModel * model = [[ComplaintsModel alloc] init];
        model.title = titles[i];
        model.price = [prices[i] doubleValue];
        [self.dataArray addObject:model];
    }
    [self.mainTableView reloadData];
}
- (IBAction)callAction:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",@"02885636621"]]];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ComplainTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"ComplainTableViewCell" owner:self options:nil].firstObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.clipsToBounds = YES;
    ComplaintsModel * model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ComplaintsModel * model = self.dataArray[indexPath.row];
    model.selected = !model.selected;
    [tableView reloadData];
    
    if ([model.title isEqualToString:@"其它"]) {
        NSString *buttonTitle = model.selected == YES ? @"下一步":@"提交到物业管理中心";
        [self.inputButton setTitle:buttonTitle forState:(UIControlStateNormal)];
        
    }
}
@end
