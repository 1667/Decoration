//
//  ImageViewWithCount.m
//  decoration
//
//  Created by innke on 15/11/25.
//  Copyright © 2015年 find. All rights reserved.
//

#import "ImageViewWithCount.h"
#import "Utils.h"

@implementation ImageViewWithCount

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
    [self.bigImageView makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self);
        
    }];
    
    [self.commentCount makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(-3);
        make.bottom.equalTo(self.bottom).offset(-5);
        make.size.equalTo(CGSizeMake(50, 20));
        
    }];
    [self.seeCount makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.commentCount.left).offset(-3);
        make.bottom.equalTo(self.commentCount.bottom);
        make.size.equalTo(CGSizeMake(50, 20));
        
    }];
}

-(UIImageView*)bigImageView
{
    if (!_bigImageView) {
        _bigImageView = [UIImageView new];
        [self addSubview:_bigImageView];
    }
    return _bigImageView;
}

-(CHButton *)commentCount
{
    if (!_commentCount) {
        _commentCount = [[CHButton alloc] initWithStyle:TitltOnRight titlePersent:0.7];
        [_commentCount setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
        [_commentCount setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
        [_commentCount setTitle:@"123" forState:UIControlStateNormal];
        [self addSubview:_commentCount];
    }
    return _commentCount;
}

-(CHButton *)seeCount
{
    if (!_seeCount) {
        _seeCount = [[CHButton alloc] initWithStyle:TitltOnRight titlePersent:0.7];
        [_seeCount setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
        [_seeCount setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
        [_seeCount setTitle:@"1333" forState:UIControlStateNormal];
        [self addSubview:_seeCount];
        
    }
    return _seeCount;
}


@end
