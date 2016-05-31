//
//  PersonCenterViewController.m
//  decoration
//
//  Created by innke on 15/11/21.
//  Copyright © 2015年 find. All rights reserved.
//

#import "PersonCenterViewController.h"
#import "Utils.h"
#import "PCHeaderView.h"
#import "DesignDetailViewController.h"
#import "PersonCommentTableViewCell.h"
#import "MoreCommentViewController.h"

#define ButtomH     60
#define TopH        SCREEN_HEIGHT * 0.25


@interface PersonCenterViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PersonCenterViewController
{
    UIButton        *_shared;
    UIButton        *_star;
    UITableView     *_tableView;
    NSArray         *_dataArray;
    NSString        *_descript;
    NSArray         *_imageArray;
    PersonCommentTableViewCell *cacheCell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleText:@"大胡子"];
    [self setNavigateBar];
    [self initView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setNavigateBar
{
    _shared = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [_shared setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:_shared];
    
    _star = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [_star setBackgroundImage:[UIImage imageNamed:@"xing"] forState:UIControlStateNormal];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:_star];
    
    self.navigationItem.rightBarButtonItems = @[item1,item2];

}

#pragma mark fun

-(void)initView
{
    
    _dataArray = @[@"个人简介",@"个人作品",@"业主评价"];
    _descript = @"大家好，我从业20余年，现在有工人20多名，专业承包家装施工，对装修有着独特的了解，能够从不同角度去分析问题，看待问题，善于发现问题，并合理的指导工人去解决问题，在北京有众多的项目在施工，客户口碑良好，对施工工艺有独特见解";
    _imageArray = @[@"house5",@"house6",@"house7"];
    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    PCHeaderView *h = [[PCHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TopH)];
    _tableView.tableHeaderView = h;
    //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];
    [self.view addSubview:_tableView];
    
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(NAV_STATUS_HEIGHT(self), 0, ButtomH, 0));
    }];
    
    UIView *buttomV = [UIView new];
    buttomV.backgroundColor = LIGHT_LIGHT_GRAY;
    [self.view addSubview:buttomV];
    
    UIButton  *yuyue = [UIButton new];
    [yuyue setBackgroundColor:TOP_GREEN];
    [yuyue setTitle:@"网上预约" forState:UIControlStateNormal];
    [self.view addSubview:yuyue];
    
    
    UIButton  *phone = [UIButton new];
    [phone setBackgroundColor:TOP_GREEN];
    [phone setTitle:@"电话预约" forState:UIControlStateNormal];
    [self.view addSubview:phone];
    
    [buttomV makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.equalTo(ButtomH);
    }];
    
    [yuyue makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(buttomV.top).offset(10);
        make.bottom.equalTo(self.view).offset(-10);
        make.width.equalTo(SCREEN_WIDTH/2-15);
    }];
    
    [phone makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(buttomV.top).offset(10);
        make.bottom.equalTo(self.view).offset(-10);
        make.width.equalTo(SCREEN_WIDTH/2-15);
    }];
    
}

-(CGFloat)getTableHeight
{
    CGSize size = [_descript sizeWithAttributes:@{NSFontAttributeName:SYS_FONT_WITH_SIZE(14)}];
    return size.height*4+21;
}

#pragma mark selecter

-(void)toDetaile:(UIButton *)sender
{
    [self.navigationController pushViewController:[DesignDetailViewController new] animated:YES];
}

-(void)sectionTitleClicked:(UIButton *)sender
{
    [self.navigationController pushViewController:[MoreCommentViewController new] animated:YES];
}

#pragma mark delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            
            return [self getTableHeight];
        }
            break;
            case 1:
        {
            return [self getTableHeight];
        }
            break;
        case 2:
        {
            if (cacheCell == nil) {
                cacheCell = [PersonCommentTableViewCell new];
            }
            
            CGSize size = [cacheCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
            
            return size.height + 1;
        }
            break;
        default:{
            return 40;
        }
            break;
    }
    return 40;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
            case 1:
            return 1;
            break;
        default:
            break;
    }
    return 20;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    
    
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
        [btn addTarget:self action:@selector(sectionTitleClicked:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
    }
    label.text = _dataArray[section];
    [btn setTitle:@"更多..." forState:UIControlStateNormal];
    view.contentView.backgroundColor = COLOR(188, 188, 188);
    return view;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section) {
        case 0:
        {
            UITableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"cell0" ];
            if (!cell0) {
                cell0 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell0"];
            }
            cell0.textLabel.numberOfLines = 4;
            cell0.textLabel.text = _descript;
            cell0.textLabel.font = SYS_FONT_WITH_SIZE(14);
            cell0.textLabel.textColor = LIGHT_GRAY;
            return cell0;
        }
            break;
        case 1:
        {
            UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1" ];
            if (!cell1) {
                cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            }
            CGFloat x = 10;
            CGFloat y = 10;
            CGFloat btnW = (SCREEN_WIDTH-40)/3;
            CGFloat btnH = [self getTableHeight]-21;
            for (int i = 0; i < 3; i ++) {
                UIButton *iamge = [[UIButton alloc] initWithFrame:CGRectMake(x, y, btnW, btnH)];
                [iamge setBackgroundImage:[UIImage imageNamed:_imageArray[i]] forState:UIControlStateNormal];
                [iamge addTarget:self action:@selector(toDetaile:) forControlEvents:UIControlEventTouchUpInside];
                [cell1.contentView addSubview:iamge];
                x += btnW+10;
            }
            return cell1;
        }
            break;
        case 2:
        {
            PersonCommentTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2" ];
            if (!cell2) {
                cell2 = [[PersonCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
            }
            
            return cell2;
        }
            break;
        default:
        {
            
        }
            
            break;
    }
    
    return nil;
}

@end
