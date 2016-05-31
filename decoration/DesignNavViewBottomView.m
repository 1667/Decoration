//
//  DesignNavViewBottomView.m
//  decoration
//
//  Created by innke on 15/11/20.
//  Copyright © 2015年 find. All rights reserved.
//

#import "DesignNavViewBottomView.h"

@implementation DesignNavViewBottomView
{
    NSString    *_str;
    CALayer     *_layer;
}
-(instancetype)initWithTitle:(NSString *)str
{
    self = [super init];
    if (self) {
        _str = str;
        [self initView];
    }
    return self;
}

-(void)initView
{
    _leftImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"down"]];
    [self addSubview:_leftImage];
    
    _rightImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"down"]];
    [self addSubview:_rightImage];
    
    _titleLable = [UILabel new];
    _titleLable.text = _str;
   // _titleLable.textColor = LIGHT_GRAY;
    _titleLable.font = SYS_FONT_WITH_SIZE(16);
    [self addSubview:_titleLable];
    
    CGSize size = [_str sizeWithAttributes:@{NSFontAttributeName:_titleLable.font}];
    size.height = size.height*0.8;
    
    [_leftImage makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(size.height);
        make.width.equalTo(_leftImage.height);
        make.right.equalTo(_titleLable.left);
        make.centerY.equalTo(self.centerY);
    }];
    
    [_rightImage makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(size.height);
        make.width.equalTo(_leftImage.height);
        make.left.equalTo(_titleLable.right);
        make.centerY.equalTo(self.centerY);
    }];
    
    [_titleLable makeConstraints:^(MASConstraintMaker *make) {
       make.centerY.equalTo(self.centerY);
        make.centerX.equalTo(self.centerX);
        
    }];
    
    
    
}

-(void)layoutSubviews
{
    if (!_layer) {
        _layer = [CALayer layer];
        _layer.backgroundColor = LAYER_LIGHT_GRAY.CGColor;
        [self.layer addSublayer:_layer];
        
    }
    _layer.frame = CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1);
    
}

@end
