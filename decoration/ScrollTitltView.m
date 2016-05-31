//
//  ScrollTitltView.m
//  TTTT
//
//  Created by innke on 15/9/12.
//  Copyright (c) 2015年 wuxianying. All rights reserved.
//

#import "ScrollTitltView.h"
#import "Utils.h"

@interface ScrollTitltView() <UIScrollViewDelegate>

@end

@implementation ScrollTitltView
{
    CGFloat btnW;
    CGFloat selfW;
    CGFloat vH;
    CGFloat btnH;
    
    NSMutableArray *frameArray;
    UIScrollView *_scrollView;
    
}
-(instancetype)initWithFrame:(CGRect)frame titleText:(NSMutableArray *)titleArray viewArray:(NSMutableArray *)vA
{
    self = [super  initWithFrame:frame];
    if (self) {
        
        _titleArray = titleArray;
        _titleBtnArray = [NSMutableArray new];
        _viewArray = vA;
        frameArray = [NSMutableArray new];
        _titleCountArray = [NSMutableArray new];
        
        [self iniView];
    }
    return self;
}

-(void)iniView
{
    btnW = self.frame.size.width/[_titleArray count];
    CGFloat x = 0;
    btnH = self.frame.size.height*0.1;
    vH = self.frame.size.height-btnH;
    selfW = self.frame.size.width;
    _flagView = [[UIView alloc] initWithFrame:CGRectMake(10, btnH-2, btnW-20, 2)];
    [_flagView setBackgroundColor:TOP_GREEN];
    
    NSInteger tag = 0;
    for (NSString *str in _titleArray) {
        CGRect frame = CGRectMake(x, 0, btnW, btnH);
        [frameArray addObject:[NSValue valueWithCGRect:frame]];
        UIView *tmp = [self createTitleBtnWithFrame:frame Str:str Tag:tag];
        if (tag == 0) {
            UIButton *tmpbtt = [_titleBtnArray objectAtIndex:0];
            
            [tmpbtt setSelected:YES];
        }
        tag++;
        [self addSubview:tmp];
        x += btnW;
    }
    [self addSubview:_flagView];
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = LIGHT_LIGHT_GRAY.CGColor;
    [self.layer addSublayer:layer];
    layer.frame = CGRectMake(0, btnH-2, self.frame.size.width, 1);
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, btnH, self.frame.size.width, self.frame.size.height-btnH)];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:_scrollView];
    x = 0;
    
    for (UIView *v in _viewArray) {
        v.frame = CGRectMake(x, 0, selfW, vH);
        x += selfW;
        [_scrollView addSubview:v];
    };
    [_scrollView setContentSize:CGSizeMake(x, vH)];
    
}

-(CGRect)valueToFrame:(NSValue *)value
{
    return [value CGRectValue];
}

-(void)swipFlagTo:(NSInteger)pos
{
    UIButton *tmp = nil;
    for (UIButton *btn in _titleBtnArray) {
        [btn setSelected:NO];
        if (btn.tag == pos) {
            tmp = btn;
        }
    }
    [tmp setSelected:YES];
    
    for (UIButton *btn in _titleCountArray) {
        [btn setSelected:NO];
        if (btn.tag == pos) {
            tmp = btn;
        }
    }
    [tmp setSelected:YES];
    
    
    CGRect frame = CGRectMake(btnW*pos+10, btnH-2, btnW-20, 2);
    [UIView animateWithDuration:0.3 animations:^{
        _flagView.frame = frame;
    }];
}

-(void)titleClicked:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    [self swipFlagTo:btn.tag];
    [self swipScrollToPage:btn.tag];
}

-(void)swipScrollToPage:(NSInteger)page
{
    [_scrollView setContentOffset:CGPointMake(page*selfW, 0) animated:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSInteger page = scrollView.contentOffset.x/selfW;
    [self swipFlagTo:page];
}

-(UIView *)createTitleBtnWithFrame:(CGRect)frame Str:(NSString *)str Tag:(NSInteger)tag
{
    UIView *tmpV = [[UIView alloc] initWithFrame:frame];
    [tmpV setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:str forState:UIControlStateNormal];
    [btn.titleLabel setFont:SYS_FONT_WITH_SIZE(14)];
    [btn setTitleColor:TOP_GREEN forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(titleClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    btn.tag = tag;
    [tmpV addSubview:btn];
    [_titleBtnArray addObject:btn];
    
    UIButton *tmpBtn = [[UIButton alloc] init];
    tmpBtn.tag = tag;
    [tmpBtn addTarget:self action:@selector(titleClicked:) forControlEvents:UIControlEventTouchUpInside];
    [tmpBtn setBackgroundColor:[UIColor clearColor]];
    [tmpV addSubview:tmpBtn];

    UIButton *tmpcount = [[UIButton alloc] init];
    tmpcount.tag = tag;
    [tmpcount setTitleColor:TOP_GREEN forState:UIControlStateSelected];
    [tmpcount setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [tmpcount setTitle:@"20" forState:UIControlStateNormal];
    tmpcount.titleLabel.font = SYS_FONT_WITH_SIZE(12);
    [tmpcount addTarget:self action:@selector(titleClicked:) forControlEvents:UIControlEventTouchUpInside];
    [tmpcount setBackgroundColor:[UIColor clearColor]];
    [tmpV addSubview:tmpcount];
    [_titleCountArray addObject:tmpcount];
    
    [btn makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(tmpV);
        make.height.equalTo(tmpV.height).multipliedBy(0.6);
        make.top.equalTo(tmpV.top);
        
    }];
    [tmpcount makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn.bottom);
        make.bottom.equalTo(tmpV.bottom);
        make.left.and.right.equalTo(tmpV);
    }];
    
    [tmpBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.top.and.bottom.equalTo(tmpV);
    }];
    
    return tmpV;
    
}

@end
