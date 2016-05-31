//
//  DesignAndComViewController.m
//  decoration
//
//  Created by innke on 15/11/27.
//  Copyright © 2015年 find. All rights reserved.
//

#import "DesignAndComViewController.h"
#import "Utils.h"
#import "UIImage+Image.h"
#import "DesignAndcomTableViewCell.h"
#import "DesignAndComDetailViewController.h"

@interface DesignAndComViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIView         *topView;
@property (nonatomic,strong) UITableView    *tableView;

@end

@implementation DesignAndComViewController
{
    UIButton    *leftBtn;
    UIButton    *midBtn;
    UIButton    *rightBtn;
    CALayer     *topLeftLayer;
    CALayer     *topRightLayer;
    DesignAndcomTableViewCell *cacheCell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitleText:@"设计交流"];
    
    [self initView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews
{
    if (topLeftLayer == nil) {
        topLeftLayer = [CALayer layer];
        topLeftLayer.backgroundColor = TOP_GREEN.CGColor;
        [self.topView.layer addSublayer:topLeftLayer];
    }
    topLeftLayer.frame = CGRectMake(self.topView.frame.size.width/3, 0, 1, self.topView.frame.size.height);
    
    if (topRightLayer == nil) {
        topRightLayer = [CALayer layer];
        topRightLayer.backgroundColor = TOP_GREEN.CGColor;
        [self.topView.layer addSublayer:topRightLayer];
    }
    topRightLayer.frame = CGRectMake(rightBtn.frame.origin.x, 0, 1, self.topView.frame.size.height);
    
    
}

#pragma mark initPro

-(UIView *)topView
{
    if (!_topView) {
        _topView = [UIView new];
        _topView.layer.borderWidth = 1;
        _topView.layer.borderColor = TOP_GREEN.CGColor;
        [self.view addSubview:_topView];
        
    }
    return _topView;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[DesignAndcomTableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark fun

-(void)initView
{
    [self.topView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(NAV_STATUS_HEIGHT(self)+10);
        make.left.equalTo(self.view.left).offset(10);
        make.right.equalTo(self.view.right).offset(-10);
        make.height.equalTo(self.view.height).multipliedBy(0.06);
        
    }];
    leftBtn = [self createTopBtnWithTitle:@"最新回复" withTag:1];
    midBtn = [self createTopBtnWithTitle:@"最新发布" withTag:2];
    rightBtn = [self createTopBtnWithTitle:@"精华帖" withTag:3];
    
    [self.topView addSubview:leftBtn];
    [self.topView addSubview:midBtn];
    [self.topView addSubview:rightBtn];
    
    [leftBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topView.left);
        make.top.bottom.equalTo(self.topView);
        make.width.equalTo(self.topView.width).dividedBy(3);
    }];
    
    [midBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftBtn.right);
        make.top.bottom.equalTo(self.topView);
        make.width.equalTo(self.topView.width).dividedBy(3);
    }];
    
    [rightBtn makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.topView.right);
        make.top.bottom.equalTo(self.topView);
        make.width.equalTo(self.topView.width).dividedBy(3);
    }];
    
    [self.tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(NAV_STATUS_HEIGHT(self)+SCREEN_HEIGHT*0.06+20, 0, 0, 0));
    }];
    
}

-(void)cleanClor
{
    leftBtn.selected = NO;
    midBtn.selected = NO;
    rightBtn.selected = NO;
    
}

-(UIButton *)createTopBtnWithTitle:(NSString *)title withTag:(NSInteger)tag
{
    UIButton *btn = [UIButton new];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.tag = tag;
    if (tag == 1) {
        btn.selected = YES;
    }
    else
    {
        btn.selected = NO;
    }
    [btn addTarget:self action:@selector(topBtnClciked:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:[UIImage imageWithColor:WHITE_COLOR] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithColor:TOP_GREEN] forState:UIControlStateSelected];
    [btn setTitleColor:LIGHT_GRAY forState:UIControlStateNormal];
    [btn setTitleColor:WHITE_COLOR forState:UIControlStateSelected];
    [btn.titleLabel setFont:SYS_FONT_WITH_SIZE(14)];
    return btn;
    
}

#pragma mark selecter

-(void)topBtnClciked:(UIButton *)sender
{
    [self cleanClor];
    sender.selected = YES;
}

#pragma mark delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (cacheCell == nil) {
        cacheCell = [DesignAndcomTableViewCell new];
    }
    
    CGSize size = [cacheCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return size.height + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DesignAndcomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:[DesignAndComDetailViewController new] animated:YES];
}

@end
