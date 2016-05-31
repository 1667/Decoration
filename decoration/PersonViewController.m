//
//  PersonViewController.m
//  decoration
//
//  Created by innke on 15/11/21.
//  Copyright © 2015年 find. All rights reserved.
//

#import "PersonViewController.h"
#import "UIImage+ImageEffects.h"
#import "UIImage+Image.h"
#import "Utils.h"
#import "PerHeaderBottomView.h"
#import "CommeonTableViewCell.h"
#import "CHButton.h"
#import "SettingViewController.h"
#import "PersonCenterViewController.h"

@interface PersonViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PersonViewController
{
    UITableView     *_tableView;
    UIImageView     *_perHeader;
    UILabel         *_titleLbl;
    UIButton        *_header;
    UILabel         *_name;
    UILabel         *_peroint;
    NSArray         *_data;
    CGFloat         _btnW;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:COLOR_A(133, 192, 6, 1)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.navigationItem.rightBarButtonItem = [[Utils instance] createRightItemWithIcon:@"sheji" selecter:@selector(right:) target:self];
    [self setTitleText:@"我的"];
    _titleLbl = (UILabel *)self.titleView;
    [_titleLbl setTextColor:[UIColor clearColor]];
    
    [self initDate];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark fun

-(void)initView
{

    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView setContentInset:UIEdgeInsetsMake(PersonHeaderH, 0, 0, 0)];
    [_tableView registerClass:[CommeonTableViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView setContentOffset:CGPointMake(0, -PersonHeaderH)];
    
    _perHeader = [[UIImageView alloc] initWithFrame:CGRectMake(0, -PersonHeaderH, SCREEN_WIDTH, PersonHeaderH)];
    [_perHeader setImage:[[UIImage imageNamed:@"personH"] applyBlurWithRadius:5 tintColor:[UIColor colorWithWhite:1 alpha:0.2] saturationDeltaFactor:1.8 maskImage:nil]];

    _perHeader.contentMode = UIViewContentModeScaleAspectFill;
    _perHeader.backgroundColor = [UIColor redColor];
    _perHeader.layer.masksToBounds = YES;
    
    [_tableView addSubview:_perHeader];
    
    PerHeaderBottomView *pbview = [PerHeaderBottomView new];
    [_tableView addSubview:pbview];
    
    _header = [[UIButton alloc] init];
    [_header setBackgroundImage:[UIImage imageNamed:@"personH"] forState:UIControlStateNormal];
    _header.layer.masksToBounds = YES;
    _header.layer.cornerRadius = SCREEN_WIDTH*0.15*0.5;
    [_header addTarget:self action:@selector(headerClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_tableView addSubview:_header];
    
    _name = [UILabel new];
    [_name setTextColor:WHITE_COLOR];
    _name.font = SYS_FONT_WITH_SIZE(20);
    _name.text = @"大胡子";
    _name.textAlignment = NSTextAlignmentCenter;
    [_tableView addSubview:_name];
    
    _peroint = [UILabel new];
    [_peroint setTextColor:WHITE_COLOR];
    _peroint.font = SYS_FONT_WITH_SIZE(12);
    _peroint.text = @"积分：56";
    _peroint.textAlignment = NSTextAlignmentCenter;
    [_tableView addSubview:_peroint];
    
    
    [self.view addSubview:_tableView];
    
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    [pbview makeConstraints:^(MASConstraintMaker *make) {
       
        make.bottom.left.right.equalTo(_perHeader);
        make.height.equalTo(PersonHeaderH*0.2);
    }];
    
    [_header makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_perHeader.centerX);
        make.bottom.equalTo(pbview.top).offset(-PersonHeaderH*0.3);
        make.size.equalTo(CGSizeMake(SCREEN_WIDTH*0.15, SCREEN_WIDTH*0.15));
    }];
    
    [_name makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_header.bottom).offset(3);
        make.left.right.equalTo(_perHeader);
    }];
    
    [_peroint makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_name.bottom).offset(3);
        make.left.right.equalTo(_perHeader);
    }];
 
    
}

-(void)initDate
{
    _btnW = SCREEN_WIDTH/4;
    _data = @[@"订单",@" ",@"钱包",@"优惠",@"团购",@"意见反馈",@"积分"];
}

-(UIView *)createHandlerView
{
    
    UIView *handlerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, _btnW+10)];
    NSArray *btnTitle = @[@"预约",@"待支付",@"待评价",@"售后"];
    
    CGFloat x = 0;
    
    for (int i = 0 ; i < 4; i++) {
        CHButton *tmpBtn = [[CHButton alloc] initWithStyle:TitleOnDown titlePersent:0.5];
        tmpBtn.frame = CGRectMake(x, 8, _btnW, _btnW);
        [tmpBtn setImage:[UIImage imageNamed:@"sheji"] forState:UIControlStateNormal];
        [tmpBtn setTitleColor:LIGHT_GRAY forState:UIControlStateNormal];
        [tmpBtn setTitle:btnTitle[i] forState:UIControlStateNormal];
        [tmpBtn.titleLabel setFont:SYS_FONT_WITH_SIZE(14)];
        [handlerView addSubview:tmpBtn];
        
        x += _btnW;
    }
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = COLOR(187, 187, 187).CGColor;
    layer.frame = CGRectMake(0, _btnW, SCREEN_WIDTH, 10);
    [handlerView.layer addSublayer:layer];
    
    return handlerView;
}

#pragma mark selector

-(void)left:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)right:(id)sender
{
    [self.navigationController pushViewController:[SettingViewController new] animated:YES];
}

-(void)headerClicked:(UIButton *)sender
{
    [self.navigationController pushViewController:[PersonCenterViewController new] animated:YES];
}

#pragma mark delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_data count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        return _btnW+9;
    }
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CommeonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (indexPath.row == 1) {
        cell.imageV.hidden = YES;
        [cell hiddenLayer:YES];
        [cell.contentView addSubview:[self createHandlerView]];
    }
    else
    {
        [cell hiddenLayer:NO];
        cell.title.text = [_data objectAtIndex:indexPath.row];
    }
    
    return cell;
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY < -PersonHeaderH ) {
        CGRect frame = _perHeader.frame;
        frame.origin.y = offsetY;
        frame.size.height  = -offsetY;
        _perHeader.frame = frame;
    }
    
    CGFloat delta = offsetY + PersonHeaderH;
    
    CGFloat headH = NAV_STATUS_HEIGHT(self) - delta;
    
    if (headH < NAV_STATUS_HEIGHT(self)) {
        headH = NAV_STATUS_HEIGHT(self);
    }
    
    // 计算透明度，刚好拖动200 - 64 136，透明度为1
    
    CGFloat alpha = delta / (HeadViewH - NAV_STATUS_HEIGHT(self));
    //[_titleLbl setTextColor:[UIColor colorWithWhite:1 alpha:alpha]];
    // 设置导航条背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:COLOR_A(133, 192, 6, alpha)] forBarMetrics:UIBarMetricsDefault];
    
}


@end
