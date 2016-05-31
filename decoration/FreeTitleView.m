//
//  FreeTitleView.m
//  decoration
//
//  Created by innke on 15/12/10.
//  Copyright © 2015年 find. All rights reserved.
//

#import "FreeTitleView.h"

@interface FreeTitleView()

@property (nonatomic,strong)CALayer *topLayer;
@property (nonatomic,strong)CALayer *bottomLayer;


@end

@implementation FreeTitleView

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

#pragma mark initPro

-(UILabel *)bigLbl
{
    if (!_bigLbl) {
        _bigLbl = [UILabel new];
        _bigLbl.font = SYS_FONT_WITH_SIZE(18);
        _bigLbl.preferredMaxLayoutWidth = SCREEN_WIDTH;
        [self addSubview:_bigLbl];
    }
    return _bigLbl;
}

-(UILabel *)smallLbl
{
    if (!_smallLbl) {
        _smallLbl = [UILabel new];
        _smallLbl.font = SYS_FONT_WITH_SIZE(14);
        _smallLbl.preferredMaxLayoutWidth = SCREEN_WIDTH;
        [self addSubview:_smallLbl];
    }
    return _smallLbl;
}

-(CALayer *)topLayer
{
    if (!_topLayer) {
        _topLayer = [CALayer layer];
        _topLayer.backgroundColor = LIGHT_LIGHT_GRAY.CGColor;
        [self.layer addSublayer:_topLayer];
        
    }
    return _topLayer;
}


-(CALayer *)bottomLayer
{
    if (!_bottomLayer) {
        _bottomLayer = [CALayer layer];
        _bottomLayer.backgroundColor = LIGHT_LIGHT_GRAY.CGColor;
        [self.layer addSublayer:_bottomLayer];
        
    }
    return _bottomLayer;
}


#pragma mark Fun

-(void)initView
{
    
    [self.bigLbl makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(10);
        make.top.equalTo(self.top).offset(13);
        make.right.equalTo(self.right);
    }];
    
    [self.smallLbl makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bigLbl.left);
        make.top.equalTo(self.bigLbl.bottom).offset(3);
        make.right.equalTo(self.right);
    }];
    
    [self makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.smallLbl.bottom).offset(13);
        
    }];
    
}

-(void)layoutSubviews
{
    self.topLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH, 10);
    self.bottomLayer.frame = CGRectMake(0, self.frame.size.height-10, SCREEN_WIDTH, 10);
}



@end
