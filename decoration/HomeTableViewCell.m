//
//  HomeTableViewCell.m
//  decoration
//
//  Created by innke on 15/11/25.
//  Copyright © 2015年 find. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "Utils.h"

#define OFFSET          5

@implementation HomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)initView
{
    [super layoutSubviews];
    [self.leftView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(OFFSET, OFFSET, OFFSET, SCREEN_WIDTH/2-OFFSET/2));
    }];
    [self.topView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftView.right).offset(OFFSET);
        make.top.equalTo(self.top).offset(OFFSET);
        make.height.equalTo(self.leftView.height).multipliedBy(0.6);
        make.right.equalTo(self.right).offset(-OFFSET);
    }];
    
    [self.rightView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.topView);
        make.top.equalTo(self.topView.bottom).offset(OFFSET);
        make.bottom.equalTo(self.leftView.bottom);
    }];
    
}



-(ImageViewWithCount *)leftView
{
    if (!_leftView) {
        _leftView = [ImageViewWithCount new];
        _leftView.bigImageView.image = [UIImage imageNamed:@"house1"];
        [self addSubview:_leftView];
         
    }
    return _leftView;
}

-(ImageViewWithCount *)topView
{
    if (!_topView) {
        _topView = [ImageViewWithCount new];
        _topView.bigImageView.image = [UIImage imageNamed:@"house2"];
        [self addSubview:_topView];
    }
    return _topView;
}

-(ImageViewWithCount *)rightView
{
    if (!_rightView) {
        _rightView = [ImageViewWithCount new];
        _rightView.bigImageView.image = [UIImage imageNamed:@"house3"];
        [self addSubview:_rightView];
    }
    return _rightView;
}

@end
