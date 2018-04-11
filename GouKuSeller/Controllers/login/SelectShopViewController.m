//
//  SelectShopViewController.m
//  GouKuSeller
//
//  Created by 窦建斌 on 2018/4/8.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "SelectShopViewController.h"
#import "TabBarViewController.h"


@interface SelectShopViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)UITableView     *tb_shopList;

@end

@implementation SelectShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择门店";
}

- (void)onCreate{
    self.tb_shopList = [[UITableView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHeight + 10, SCREEN_WIDTH, self.arr_shop.count * 44) style:UITableViewStylePlain];
    [self.view addSubview:self.tb_shopList];
    self.tb_shopList.delegate = self;
    self.tb_shopList.dataSource = self;
    self.tb_shopList.rowHeight = 44;
    self.tb_shopList.tableFooterView = [UIView new];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr_shop.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"TableViewCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [[self.arr_shop objectAtIndex:indexPath.row] objectForKey:@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [LoginStorage saveShopId:[[self.arr_shop objectAtIndex:indexPath.row] objectForKey:@"sid"]];
    [LoginStorage savePhoneNum:[[self.arr_shop objectAtIndex:indexPath.row] objectForKey:@"phone"]];
    [LoginStorage saveIsLogin:YES];
    TabBarViewController *vc = [[TabBarViewController alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
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