//
//  PayViewController.m
//  tengwangge
//
//  Created by 赵一欢 on 2018/10/11.
//  Copyright © 2018年 Joker. All rights reserved.
//

#import "PayViewController.h"
#import "UIViewController+YHViewControllerBaseCategory.h"
#import "YHBaseCategroy.h"
#import "PayTableViewCell.h"
@interface PayViewController ()
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) IBOutlet UILabel *priceLable;
@property (strong, nonatomic) IBOutlet UILabel *balancePrice;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) PayModel *selectPayModel;
@property (assign, nonatomic) double myBalancePrice;
@property (assign, nonatomic) double needPayPrice;
@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myBalancePrice = -1567.f;
    self.needPayPrice = 1567.f;
    [self setBackButton];
    [self.mainTableView normalConfig];
    [self initDatasource];
}
- (void)initDatasource{
    NSArray *monthes = @[@"6个月",@"12个月",@"18个月",@"24个月",@"36个月"];
    NSArray *totalPrice = @[@"1200",@"2400",@"3600",@"4800",@"7200"];
    NSArray *price = @[@(1190),@(2350),@(3500),@(4500),@(6600)];
    for (int i = 0; i < monthes.count; i++) {
        PayModel *model = [[PayModel alloc] init];
        model.month = monthes[i];
        model.totalPrice = totalPrice[i];
        model.price = [price[i] doubleValue];
        [self.dataArray addObject:model];
    }
    [self.mainTableView reloadData];
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)totalMoney {
    double totalMoney = self.selectPayModel.price + self.needPayPrice;
    self.priceLable.text = [NSString stringWithFormat:@"¥:%.f",totalMoney];
}
- (IBAction)payAciton:(UIButton *)sender {
    [self showHUDwithString:@"正在缴费..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hiddenHUD];
        [self showWeakAlert:@"缴费成功"];
        [self balanceMoney];
    });
}
- (void)balanceMoney {
    
    self.myBalancePrice = self.selectPayModel.price + self.myBalancePrice + self.needPayPrice;
    self.balancePrice.text = [NSString stringWithFormat:@"%.f元",self.myBalancePrice];
    self.needPayPrice = 0.f;
    self.priceLable.text = [NSString stringWithFormat:@"¥:%.f",self.needPayPrice];
    self.selectPayModel = nil;
    for (PayModel *tempModel in self.dataArray) {
        tempModel.selected = NO;
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
    PayTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PAY_CELL"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"PayTableViewCell" owner:self options:nil].firstObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.clipsToBounds = YES;
    PayModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (PayModel *tempModel in self.dataArray) {
        tempModel.selected = NO;
    }
    PayModel *model = self.dataArray[indexPath.row];
    if (self.selectPayModel != nil && self.selectPayModel == model) {
        model.selected = NO;
        self.selectPayModel = nil;
    }else{
        model.selected = YES;
        self.selectPayModel = model;
    }
    [self totalMoney];
    [tableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
