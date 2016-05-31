//
//  UserNameView.m
//  decoration
//
//  Created by innke on 15/11/29.
//  Copyright © 2015年 find. All rights reserved.
//

#import "UserNameView.h"

@implementation UserNameView

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
        
    }
    return self;
}

#pragma mark initPro

-(UIImageView *)userHeader
{
    if (!_userHeader) {
        _userHeader = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hader"]];
        [self addSubview:_userHeader];
        
    }
    return _userHeader;
}

-(UILabel *)userName
{
    if (!_userName) {
        _userName = [UILabel new];
        _userName.textColor = TOP_GREEN;
        _userName.text = @"风度翩翩";
        _userName.font = SYS_FONT_WITH_SIZE(14);
        [self addSubview:_userName];
    }
    return _userName;
}

-(UILabel *)flagLable
{
    if (!_flagLable) {
        _flagLable = [UILabel new];
        _flagLable.textColor = LAYER_LIGHT_GRAY;
        _flagLable.text = @"简约派";
        _flagLable.font = SYS_FONT_WITH_SIZE(14);
        [self addSubview:_flagLable];
    }
    return _flagLable;
}

-(UILabel *)rightTop
{
    if (!_rightTop) {
        _rightTop = [UILabel new];
        _rightTop.textColor = LAYER_LIGHT_GRAY;
        _rightTop.text = @"楼主";
        _rightTop.font = SYS_FONT_WITH_SIZE(14);
        _rightTop.textAlignment = NSTextAlignmentRight;
        [self addSubview:_rightTop];
    }
    return _rightTop;
}

-(UILabel *)rightBottom
{
    if (!_rightBottom) {
        _rightBottom = [UILabel new];
        _rightBottom.textColor = LAYER_LIGHT_GRAY;
        _rightBottom.text = @"15-10-02 22:03";
        _rightBottom.font = SYS_FONT_WITH_SIZE(14);
        _rightBottom.textAlignment = NSTextAlignmentRight;
        [self addSubview:_rightBottom];
    }
    return _rightBottom;
}

#pragma mark Fun

-(void)initView
{
    [self.userHeader makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(10);
        make.bottom.lessThanOrEqualTo(self).offset(-10);
        make.width.equalTo(self.userHeader.height);
    }];
    
    [self.userName makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userHeader.right).offset(3);
        make.top.equalTo(self.userHeader);
    }];
    
    [self.flagLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userName.left);
        make.bottom.equalTo(self.userHeader);
    }];
    
    [self.rightTop makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(-10);
        make.top.equalTo(self.userHeader);
    }];
    [self.rightBottom makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(-10);
        make.bottom.equalTo(self.userHeader);
    }];
    
}

@end
