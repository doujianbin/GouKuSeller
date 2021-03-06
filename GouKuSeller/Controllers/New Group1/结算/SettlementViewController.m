//
//  SettlementViewController.m
//  GouKuSeller
//
//  Created by 窦建斌 on 2018/3/28.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "SettlementViewController.h"
#import "SettlementView.h"
#import "BankCardInformationViewController.h"
#import "TiXianiewController.h"
#import "YueDetailViewController.h"
#import "AccountCashEntity.h"
#import "SettlementHandler.h"
#import "BankCardDetailViewController.h"
@interface SettlementViewController ()
@property (nonatomic ,strong)SettlementView         *v_settlementBack;
@property (nonatomic ,strong)AccountCashEntity      *accountCashEntity;

@end

@implementation SettlementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"结算";
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithTitle:@"银行卡" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarAction)];
    [btn_right setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#ffffff"]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = btn_right;
}

- (void)onCreate{
    self.v_settlementBack = [[SettlementView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:self.v_settlementBack];
    [self.v_settlementBack.btn_tixian addTarget:self action:@selector(btn_tixianAction) forControlEvents:UIControlEventTouchUpInside];
    [self.v_settlementBack.btn_mingxi addTarget:self action:@selector(yuemingxiAction) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)loadData{
    [SettlementHandler accountshowWithshopId:[LoginStorage GetShopId] prepare:^{
        
    } success:^(id obj) {
        self.accountCashEntity = (AccountCashEntity *)obj;
        [self.v_settlementBack.lab_price_balance setText:[NSString stringWithFormat:@"%.2f",self.accountCashEntity.money]];
        [self.v_settlementBack.lab_jiesuanPrice setText:[NSString stringWithFormat:@"%.2f",self.accountCashEntity.moneyNeedCheck]];
    } failed:^(NSInteger statusCode, id json) {
        [MBProgressHUD showErrorMessage:[NSString stringWithFormat:@"%ld:%@",statusCode,json]];
    }];
}


- (void)btn_tixianAction{
    if (self.accountCashEntity.bankCard.bankName.length > 0) {
    
        TiXianiewController *vc = [[TiXianiewController alloc]init];
        vc.cardNum = [NSString stringWithFormat:@"%@",self.accountCashEntity.bankCard.cardNum];
        vc.cardName = self.accountCashEntity.bankCard.bankName;
        vc.lowPrice = self.accountCashEntity.lowMoney;
        vc.tixianCount = self.accountCashEntity.toCashNum;
        vc.ketixianPrice = self.accountCashEntity.money;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        BankCardInformationViewController *vc = [[BankCardInformationViewController alloc]init];
        vc.enterFromType = EnterFormJieSuan;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)yuemingxiAction{
    YueDetailViewController *vc = [[YueDetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)rightBarAction{
    if (self.accountCashEntity.bankCard.bankName.length > 0) {
        //添加过银行卡
        BankCardDetailViewController *vc = [[BankCardDetailViewController alloc]init];
        vc.entity= self.accountCashEntity.bankCard;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        BankCardInformationViewController *vc = [[BankCardInformationViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIColor imageWithColor:[UIColor colorWithHexString:COLOR_Main] size:CGSizeMake(self.view.frame.size.width, 0.5)]];
    self.navigationController.navigationBar.translucent = NO;
    [self loadData];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self changeNavigationOriginal];
    self.navigationController.navigationBar.translucent = YES;
    
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
