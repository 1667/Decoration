//
//  PCHeaderView.m
//  decoration
//
//  Created by innke on 15/11/21.
//  Copyright © 2015年 find. All rights reserved.
//

#import "PCHeaderView.h"
#import "CHButton.h"

@implementation PCHeaderView
{
    CALayer     *_layer;
    NSArray     *_dataArray;
    NSMutableArray     *_btnArray;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self initView];
    }
    return self;
}

-(void)initView
{
    _dataArray = @[@"支持先行赔付",@"基金平台托管",@"所属信息属实",@"48小时上门"];
    _btnArray = [NSMutableArray new];
    _headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"defaulheader"]];
    [self addSubview:_headerImage];
    
    _headerlbl = [[UILabel alloc] init];
    _headerlbl.text = @"大胡子";
    _headerlbl.textColor = LIGHT_GRAY;
    _headerlbl.font = SYS_FONT_WITH_SIZE(16);
    [self addSubview:_headerlbl];
    
    _explbl = [UILabel new];
    _explbl.text = @"籍贯:江苏      经验：10年";
    _explbl.font = SYS_FONT_WITH_SIZE(14);
    _explbl.textColor = LIGHT_GRAY;
    [self addSubview:_explbl];
    
    _commentlabel = [UILabel new];
    _commentlabel.text = @"评价：82    签单：108";
    _commentlabel.font = SYS_FONT_WITH_SIZE(14);
    _commentlabel.textColor = LIGHT_GRAY;
    [self addSubview:_commentlabel];
    
    
    [_headerImage makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(10);
        make.top.equalTo(self.top).offset(10);
        make.height.equalTo(self.height).multipliedBy(0.6);
        make.width.equalTo(_headerImage.height);
    }];
    
    [_headerlbl makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerImage.top);
        make.left.equalTo(_headerImage.right).offset(20);
        
    }];
    
    [_explbl makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerlbl.bottom).offset(15);
        make.left.equalTo(_headerlbl);
    }];
    
    [_commentlabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headerlbl);
        make.bottom.equalTo(_headerImage);
        
    }];
    
    
    
    
    for (int i = 0; i < 4; i++) {
        CHButton *btn = [[CHButton alloc] initWithStyle:TitltOnRight titlePersent:0.85];
        [self addSubview:btn];
        [btn.titleLabel setFont:SYS_FONT_WITH_SIZE(11)];
        [btn setTitleColor:LIGHT_GRAY forState:UIControlStateNormal];
        [btn setTitle:_dataArray[i] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"selectr"] forState:UIControlStateNormal];
        [_btnArray addObject:btn];
    }
    
}

-(void)layoutSubviews
{
    
    [super layoutSubviews];
    if (_layer == nil) {
        _layer = [CALayer layer];
        _layer.backgroundColor = LIGHT_LIGHT_GRAY.CGColor;
        [self.layer addSublayer:_layer];
    }
    _layer.frame = CGRectMake(10, self.frame.size.height*0.6+20, SCREEN_WIDTH-10, 1);
    
    CGFloat x = 10;
    CGFloat btnW = (SCREEN_WIDTH-10)/4;
    
    for (CHButton *btn in _btnArray) {
        btn.frame = CGRectMake(x, self.frame.size.height*0.6+20, btnW, self.frame.size.height*0.4-20);
        x += btnW;
    }
    
}

@end
