//
//  SettingViewController.m
//  decoration
//
//  Created by innke on 15/11/21.
//  Copyright © 2015年 find. All rights reserved.
//

#import "SettingViewController.h"
#import "Utils.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SettingViewController
{
    UITableView         *_tableView;
    NSMutableArray      *_data;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleText:@"设置"];
    [self initData];
    [self initView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initView
{
    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = COLOR(236, 236, 236);
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(NAV_STATUS_HEIGHT(self), 0, 0, 0));
    }];
    
}

-(void)initData
{
    NSArray *array1 = @[@"去评价一把",@"分享给朋友"];
    NSArray *array2 = @[@"服务协议",@"当前版本"];
    NSArray *array3 = @[@"清理缓存"];
    
    _data = [NSMutableArray new];
    [_data addObject:array1];
    [_data addObject:array2];
    [_data addObject:array3];
    
}

#pragma mark delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 10;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 2;
            break;
            case 1:
            return 2;
            case 2:
            return 1;
        default:
            break;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (indexPath.section == 3) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        [btn setBackgroundColor:[UIColor redColor]];
        [btn setTitle:@"退出登录" forState:UIControlStateNormal];
        [cell.contentView addSubview:btn];
    }
    else
    {
        NSArray *array = [_data objectAtIndex:indexPath.section];
        cell.textLabel.text = [array objectAtIndex:indexPath.row];
        
    }
    return cell;
    
}

@end
