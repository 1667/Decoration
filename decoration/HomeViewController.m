//
//  HomeViewController.m
//  decoration
//
//  Created by innke on 15/11/11.
//  Copyright © 2015年 find. All rights reserved.
//

#import "HomeViewController.h"
#import "UIImage+Image.h"
#import "Utils.h"
#import "HomeHeaderView.h"
#import "RootViewController.h"
#import "CHButton.h"
#import "PersonViewController.h"
#import "HomeHeaderBottomView.h"
#import <MJRefresh.h>
#import "HomeTableViewCell.h"
#import "ArtListViewController.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HomeViewController
{
    UITableView *_tableView;
    CGFloat     _lastOffsetY;
    CHButton    *_leftBtn;
    UILabel     *_titleLbl;
    UIButton    *_rightBtn;
    HomeHeaderView      *_headerView;
    HomeHeaderBottomView    *_headerBottom;
    NSArray                 *_sectionArray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:COLOR_A(133, 192, 6, 0)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    [self setNavController];
    [self initView];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setNavController
{
    _leftBtn = [[CHButton alloc] initWithStyle:TitleOnLeft titlePersent:0.7];
    _leftBtn.frame = CGRectMake(0, 0, 50, 25);
    [_leftBtn setTitle:@"北京" forState:UIControlStateNormal];
    [_leftBtn.titleLabel setFont:SYS_FONT_WITH_SIZE(16)];
    [_leftBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    [_leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_leftBtn];
    [_leftBtn setBackgroundColor:[UIColor colorWithWhite:1 alpha:0]];
    
    _titleLbl = (UILabel *)[[Utils instance] createTitleViewWithTitle:@"首页"];
    [_titleLbl setTextColor:[UIColor colorWithWhite:1 alpha:1]];
    self.navigationItem.titleView = _titleLbl;
    
    _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [_rightBtn setBackgroundImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(personClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
    
    
    
    
    
}

-(void)hiddenNavBottom
{
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        NSArray *list=self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView=(UIImageView *)obj;
                NSArray *list2=imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2=(UIImageView *)obj2;
                        imageView2.hidden=YES;
                    }
                }
            }
        }
    }
}

-(void)initView
{
    
    _sectionArray = @[@"名家作品",@"装修日记"];
    _lastOffsetY = HeadViewH+HomeHeadBottomH;
    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];
    [_tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
        sleep(2);
        [_tableView.header endRefreshing];
    }];
    
    _headerView = [[HomeHeaderView alloc] initWithFrame:CGRectMake(0, -HeadViewH-HomeHeadBottomH, SCREEN_WIDTH, HeadViewH+HomeHeadBottomH)];
    
    _tableView.tableHeaderView = _headerView;
    [self.view addSubview:_tableView];
    
    
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-kDockViewHeight);
    }];
    
    
    
}

#pragma mark selecter
-(void)personClicked:(UIButton *)sender
{
    [self.navigationController.parentViewController.navigationController pushViewController:[PersonViewController new] animated:YES];
}

#pragma mark delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController.parentViewController.navigationController pushViewController:[ArtListViewController new] animated:YES];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    
    UIView *backView = [view viewWithTag:section + 165];
    if (backView == nil) {
        backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        [view addSubview:backView];
        backView.tag = section+165;
    }
    
    
    UILabel *label = [view viewWithTag:section + 166];
    if (!label) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 80, 30)];
        label.tag = section+166;
        label.font = SYS_FONT_WITH_SIZE(14);
        label.textColor = WHITE_COLOR;
        [view addSubview:label];
    }
    UIButton *btn = [view viewWithTag:section+167];
    if (!btn) {
        btn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-80, 0, 60, 30)];
        btn.tag = section+167;
        btn.titleLabel.font = SYS_FONT_WITH_SIZE(14);
        [view addSubview:btn];
    }
    label.text = _sectionArray[section];
    [btn setTitle:@"更多..." forState:UIControlStateNormal];
    backView.backgroundColor = COLOR(188, 188, 188);
    return view;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    // 获取偏移量差值
    CGFloat delta = offsetY;
    
    CGFloat headH = NAV_STATUS_HEIGHT(self) - delta;
    
    if (headH < NAV_STATUS_HEIGHT(self)) {
        headH = NAV_STATUS_HEIGHT(self);
    }

    // 计算透明度，刚好拖动200 - 64 136，透明度为1
    
    CGFloat alpha = delta / (HeadViewH+HomeHeadBottomH+ NAV_STATUS_HEIGHT(self));
    
    [_titleLbl setTextColor:[UIColor colorWithWhite:1 alpha:alpha]];
    // 设置导航条背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:COLOR_A(133, 192, 6, alpha)] forBarMetrics:UIBarMetricsDefault];
}




@end
