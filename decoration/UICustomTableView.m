//
//  UICustomTableView.m
//  MTTCompany
//
//  Created by 无线盈 on 15/9/14.
//  Copyright (c) 2015年 无线盈. All rights reserved.
//

#import "UICustomTableView.h"
#import "Utils.h"
#import <MJRefresh.h>
#import "BaseViewController.h"
#import "PersonCommentTableViewCell.h"
#import "MoreCommentViewController.h"

@interface UICustomTableView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)PersonCommentTableViewCell *cacheCell;

@end

@implementation UICustomTableView
{
    
    UIViewController *_superVC;
    NSInteger       _tag;
    BOOL            bRefresh;
    UILabel         *noDataHolder;
    NSInteger       _totalCount;
    
    
}
-(instancetype)initWithFrame:(CGRect)frame SuperVC:(UIViewController *)superVC Tag:(NSInteger)tag
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _superVC = superVC;
        _tag = tag;
        
        _tableView = [[UITableView alloc] initWithFrame:frame];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tag = _tag;
        
        [_tableView registerClass:[PersonCommentTableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView setBackgroundColor:LIGHT_LIGHT_GRAY];
        [self addSubview:_tableView];
        [self initNoDataHolder];
    
    }
    return self;
}

-(void)initNoDataHolder
{
    noDataHolder = [UILabel new];
    [noDataHolder setTextColor:[UIColor colorWithRed:193.0f/255.0f green:193.0f/255.0f blue:193.0f/255.0f alpha:1]];
    [noDataHolder setFont:[UIFont systemFontOfSize:16]];
    [noDataHolder setText:@"还没有数据呢~~~"];
    [noDataHolder setTextAlignment:NSTextAlignmentCenter];
    noDataHolder.frame = CGRectMake(0, 0, self.frame.size.width, 40);
    [noDataHolder setCenter:self.center];
    [noDataHolder setHidden:YES];
    [self addSubview:noDataHolder];
    
}

-(void)showDataHolder:(BOOL)bshow
{
    [noDataHolder setHidden:!bshow];
    [_tableView setHidden:bshow];
}

-(void)showDataHolder:(BOOL)bshow WithStr:(NSString *)str
{
    if (bshow) {
        [noDataHolder setText:str];
    }
    [noDataHolder setHidden:!bshow];
    [_tableView setHidden:bshow];
}


-(void)showHolder:(BOOL)bShow
{
    
    [self showDataHolder:bShow];
    [_tableView setHidden:bShow];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    CGSize size = [self.cacheCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return size.height + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString  *cellid = @"cell";
    PersonCommentTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellid forIndexPath:indexPath];
    
    cell.layer.shouldRasterize = YES;//开启图层缓存
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;//抗锯齿
    return cell;
}

-(PersonCommentTableViewCell *)cacheCell
{
    if (!_cacheCell) {
        _cacheCell = [PersonCommentTableViewCell new];
    }
    return _cacheCell;
}

@end
