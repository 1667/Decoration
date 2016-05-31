//
//  ArtListCollectionViewCell.m
//  decoration
//
//  Created by innke on 15/12/9.
//  Copyright © 2015年 find. All rights reserved.
//

#import "ArtListCollectionViewCell.h"

@implementation ArtListCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        
        
    }
    return self;
}

#pragma mark initPro

-(ImageViewWithCount *)imageView
{
    if (!_imageView) {
        _imageView = [ImageViewWithCount new];
        _imageView.bigImageView.image = [UIImage imageNamed:@"house1"];
        [self.contentView addSubview:_imageView];
        
    }
    return _imageView;
}

#pragma mark Fun

-(void)initView
{
    [self.imageView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}














@end
