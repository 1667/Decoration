//
//  ForumViewController.m
//  decoration
//
//  Created by innke on 15/11/20.
//  Copyright © 2015年 find. All rights reserved.
//

#import "ForumViewController.h"
#import "CHButton.h"
#import "Utils.h"
#import "UIImage+Image.h"
#import "RootViewController.h"
#import "ForumTableViewCell.h"
#import "ForumViewHeader.h"
#import "DesignAndComViewController.h"

@interface ForumViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ForumViewController
{
    UITableView *_tableView;
    CHButton    *_leftBtn;
    UILabel     *_titleLbl;
    UIButton    *_rightBtn;
    NSArray     *_data;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    _data = @[@"设计交流",@"装修材料",@"装修经验",@"装修日记",@"我秀我家"];
    
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
    
    _titleLbl = (UILabel *)[[Utils instance] createTitleViewWithTitle:@"找论坛"];
    [_titleLbl setTextColor:[UIColor colorWithWhite:1 alpha:1]];
    self.navigationItem.titleView = _titleLbl;
    
    _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [_rightBtn setBackgroundImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
    
    
    
}

-(void)initView
{
    
    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView setContentInset:UIEdgeInsetsMake(ForumHeadViewH, 0, 0, 0)];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[ForumTableViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView setContentOffset:CGPointMake(0, -ForumHeadViewH)];
    ForumViewHeader *h = [ForumViewHeader new];
    h.frame = CGRectMake(0, -ForumHeadViewH, SCREEN_WIDTH, ForumHeadViewH);
    [_tableView addSubview:h];
    [self.view addSubview:_tableView];
    
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(NAV_STATUS_HEIGHT(self), 0, kDockViewHeight,0));
    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_data count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ForumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.title.text = [_data objectAtIndex:indexPath.row];
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        [self.navigationController.parentViewController.navigationController pushViewController:[DesignAndComViewController new] animated:YES];
    }
}

@end
