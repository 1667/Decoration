//
//  DesignViewController.m
//  decoration
//
//  Created by innke on 15/11/20.
//  Copyright © 2015年 find. All rights reserved.
//

#import "DesignViewController.h"
#import "Utils.h"
#import "CHButton.h"
#import "Utils.h"
#import "UIImage+Image.h"
#import "DesignNavViewBottomView.h"
#import "DesignTableViewCell.h"
#import "RootViewController.h"
#import "PersonCenterViewController.h"

@interface DesignViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation DesignViewController
{
    UITableView *_tableView;
    CHButton    *_leftBtn;
    UILabel     *_titleLbl;
    UIButton    *_rightBtn;
    NSArray     *_data;
    DesignNavViewBottomView *_db1;
    DesignNavViewBottomView *_db2;
    CALayer     *_midLayer;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITE_COLOR;
    
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
    
    _titleLbl = (UILabel *)[[Utils instance] createTitleViewWithTitle:@"找设计"];
    [_titleLbl setTextColor:[UIColor colorWithWhite:1 alpha:1]];
    self.navigationItem.titleView = _titleLbl;
    
    _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [_rightBtn setBackgroundImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
    
}

-(void)initView
{
    _db1 = [[DesignNavViewBottomView alloc] initWithTitle:@"全城"];
    _db2 = [[DesignNavViewBottomView alloc] initWithTitle:@"综合排名"];
    [self.view addSubview:_db1];
    [self.view addSubview:_db2];
    
    [_db1 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left);
        make.top.equalTo(self.view.top).offset(NAV_STATUS_HEIGHT(self));
        make.height.equalTo(SCREEN_HEIGHT*0.06);
        make.width.equalTo(SCREEN_WIDTH*0.5);
    }];
    
    
    [_db2 makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.right);
        make.top.equalTo(self.view.top).offset(NAV_STATUS_HEIGHT(self));
        make.height.equalTo(SCREEN_HEIGHT*0.06);
        make.width.equalTo(SCREEN_WIDTH*0.5);
    }];
    
    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[DesignTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(NAV_STATUS_HEIGHT(self)+SCREEN_HEIGHT*0.06, 0, kDockViewHeight, 0));
    }];
    
    
}

-(void)viewDidLayoutSubviews
{
    if (!_midLayer) {
        _midLayer = [CALayer layer];
        _midLayer.backgroundColor = LAYER_LIGHT_GRAY.CGColor;
        [self.view.layer addSublayer:_midLayer];
    }
    _midLayer.frame = CGRectMake(SCREEN_WIDTH/2, NAV_STATUS_HEIGHT(self), 1, SCREEN_HEIGHT*0.06);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DesignTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController.parentViewController.navigationController pushViewController:[PersonCenterViewController new] animated:YES];
    
}

@end
