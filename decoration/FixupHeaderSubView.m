//
//  FixupHeaderSubView.m
//  decoration
//
//  Created by innke on 15/11/18.
//  Copyright © 2015年 find. All rights reserved.
//

#import "FixupHeaderSubView.h"

#define LEFT_OFFSET (SCREEN_WIDTH*0.5*0.1)
#define TOP_OFFSET  ( SCREEN_HEIGHT*0.3*0.3*0.15)


@implementation FixupHeaderSubView

-(void)initView
{
    _imageView = [UIImageView new];
    [_imageView setImage:[UIImage imageNamed:@"jiaju"]];
    [self addSubview:_imageView];
   
    [_imageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(TOP_OFFSET);
        make.bottom.equalTo(self.bottom).offset(-TOP_OFFSET);
        make.left.equalTo(self.left).offset(LEFT_OFFSET);
        make.width.equalTo(_imageView.height);
    }];
    
    _topLable = [UILabel new];
    
    [_topLable setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:_topLable];
    
    [_topLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageView.right).offset(-3);
        make.right.equalTo(self.right).offset(-LEFT_OFFSET);
        make.top.equalTo(_imageView.top);
    }];
    
    _bottomLable = [UILabel new];
    [_bottomLable setFont:SYS_FONT_WITH_SIZE(12)];
    [_bottomLable setTextColor:LIGHT_GRAY];
    [_bottomLable setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:_bottomLable];
    
    [_bottomLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_topLable);
        make.top.equalTo(_topLable.bottom).offset(3);
        
    }];
    
}

@end
