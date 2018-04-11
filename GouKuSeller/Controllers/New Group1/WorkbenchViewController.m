//
//  WorkbenchViewController.m
//  GouKuSeller
//
//  Created by 窦建斌 on 2018/3/25.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "WorkbenchViewController.h"
#import "SalesViewController.h"
#import "WorkBenchView.h"
#import "CommodityViewController.h"
#import "SettlementViewController.h"
#import "CashierViewController.h"

@interface WorkbenchViewController ()
@property (nonatomic ,strong)WorkBenchView        *v_workBench;

@end

@implementation WorkbenchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    
    
}

- (void)onCreate{
    self.v_workBench = [[WorkBenchView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.v_workBench];
    [self.v_workBench.btn_active addTarget:self action:@selector(actiona) forControlEvents:UIControlEventTouchUpInside];
    [self.v_workBench.btn_commodity addTarget: self action:@selector(commodityAction) forControlEvents:UIControlEventTouchUpInside];
    [self.v_workBench.btn_jiesuan addTarget:self action:@selector(jiesuanAction) forControlEvents:UIControlEventTouchUpInside];
    [self.v_workBench.btn_shouyin addTarget:self action:@selector(shouyinAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)commodityAction{
    CommodityViewController *vc = [[CommodityViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)actiona{
    SalesViewController *vc = [[SalesViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)jiesuanAction{
    SettlementViewController *vc = [[SettlementViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)shouyinAction{
    CashierViewController *vc = [[CashierViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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