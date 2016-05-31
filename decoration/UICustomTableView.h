//
//  UICustomTableView.h
//  MTTCompany
//
//  Created by 无线盈 on 15/9/14.
//  Copyright (c) 2015年 无线盈. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICustomTableView : UIView

@property (nonatomic,strong)UITableView *tableView;

-(instancetype)initWithFrame:(CGRect)frame SuperVC:(UIViewController *)superVC Tag:(NSInteger)tag;

@end
