//
//  MoreCommentViewController.m
//  decoration
//
//  Created by innke on 15/11/29.
//  Copyright © 2015年 find. All rights reserved.
//

#import "MoreCommentViewController.h"
#import "ScrollTitltView.h"
#import "Utils.h"
#import "UICustomTableView.h"

@interface MoreCommentViewController ()


@end

@implementation MoreCommentViewController
{
    ScrollTitltView         *_scrollTitleView;
    NSMutableArray          *_customTableArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleText:@"大胡子的评价"];
    [self initView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark initPro

#pragma mark FUN

-(void)initView
{
    self.view.backgroundColor = WHITE_COLOR;
    CGFloat h = self.view.frame.size.height*0.1;
    
    _customTableArray = [NSMutableArray new];
    for (int i = 1; i < 6; i++) {
        UICustomTableView *tmpTab = [[UICustomTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-NAV_STATUS_HEIGHT(self)-h) SuperVC:self Tag:i];
        [_customTableArray addObject:tmpTab];
    }
    
    _scrollTitleView = [[ScrollTitltView alloc] initWithFrame:CGRectMake(0, NAV_STATUS_HEIGHT(self), self.view.frame.size.width, self.view.frame.size.height-NAV_STATUS_HEIGHT(self)) titleText:@[@"全部",@"好评",@"中评",@"差评",@"有图"] viewArray:_customTableArray];
    
    [self.view addSubview:_scrollTitleView];
}




@end
