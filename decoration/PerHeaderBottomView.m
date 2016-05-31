//
//  PerHeaderBottomView.m
//  decoration
//
//  Created by innke on 15/11/21.
//  Copyright © 2015年 find. All rights reserved.
//

#import "PerHeaderBottomView.h"
#import "Utils.h"
#import "UIImage+ImageEffects.h"
#import "UIImage+Image.h"
#import "CHButton.h"

@implementation PerHeaderBottomView
{
    CALayer          *_firstLine;
    CALayer          *_secondLine;
    CHButton        *_firstBtn;
    CHButton        *_secondBtn;
    CHButton        *_thirdBtn;
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)initView
{
    UIImageView  *backView = [[UIImageView alloc] initWithImage:[[UIImage imageWithColor:[UIColor colorWithWhite:0 alpha:0.8] ] applyExtraLightEffect]];
    [self addSubview:backView];
    
    _firstBtn = [[CHButton alloc] initWithStyle:TitleOnDown titlePersent:0.5];
    [_firstBtn setImage:[UIImage imageNamed:@"xing"] forState:UIControlStateNormal];
    [_firstBtn setTitle:@"收藏" forState:UIControlStateNormal];
        [_firstBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [self addSubview:_firstBtn];
    
    _secondBtn = [[CHButton alloc] initWithStyle:TitleOnDown titlePersent:0.5];
    [_secondBtn setImage:[UIImage imageNamed:@"xing"] forState:UIControlStateNormal];
    [_secondBtn setTitle:@"帖子" forState:UIControlStateNormal];
    [_secondBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [self addSubview:_secondBtn];
    
    _thirdBtn = [[CHButton alloc] initWithStyle:TitleOnDown titlePersent:0.5];
    [_thirdBtn setImage:[UIImage imageNamed:@"xing"] forState:UIControlStateNormal];
    [_thirdBtn setTitle:@"消息" forState:UIControlStateNormal];
        [_thirdBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [self addSubview:_thirdBtn];

    
    [backView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [_firstBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self).offset(5);
        make.bottom.equalTo(self).offset(-3);
        make.width.equalTo(SCREEN_WIDTH/3);
    }];
 
    [_secondBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_firstBtn.right);
        make.top.equalTo(self).offset(5);
        make.bottom.equalTo(self).offset(-3);
        make.width.equalTo(SCREEN_WIDTH/3);
    }];
    
    [_thirdBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_secondBtn.right);
        make.top.equalTo(self).offset(5);
        make.bottom.equalTo(self).offset(-3);
        make.width.equalTo(SCREEN_WIDTH/3);
    }];
    
}

-(void)layoutSubviews
{
    if (!_firstLine) {
        _firstLine = [CALayer layer];
        _firstLine.backgroundColor = WHITE_COLOR.CGColor;
        [self.layer addSublayer:_firstLine];
    }
    _firstLine.frame =CGRectMake(SCREEN_WIDTH/3, self.frame.size.height*0.2, 1, self.frame.size.height*0.6);
    
    if (!_secondLine) {
        _secondLine = [CALayer layer];
        _secondLine.backgroundColor = WHITE_COLOR.CGColor;
        [self.layer addSublayer:_secondLine];
    }
    _secondLine.frame =CGRectMake(SCREEN_WIDTH/3*2, self.frame.size.height*0.2, 1, self.frame.size.height*0.6);
    
}


@end
