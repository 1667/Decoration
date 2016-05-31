//
//  CommeonTableViewCell.m
//  decoration
//
//  Created by innke on 15/11/21.
//  Copyright © 2015年 find. All rights reserved.
//

#import "CommeonTableViewCell.h"
#import "Utils.h"

@implementation CommeonTableViewCell
{
    CALayer     *_layer;
}
- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self initView];
    }
    return self;
}

-(void)initView
{
    _imageV = [UIImageView new];
    _imageV.image = [UIImage imageNamed:@"luntan"];
    [self.contentView addSubview:_imageV];
    _title = [UILabel new];
    _title.font = SYS_FONT_WITH_SIZE(14);
    _title.textColor = LIGHT_GRAY;
    [self.contentView addSubview:_title];
    
    [_imageV makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).offset(10);
        make.left.equalTo(self.contentView.left).offset(10);
        make.bottom.equalTo(self.contentView.bottom).offset(-10);
        make.width.equalTo(_imageV.height);
        
    }];
    
    [_title makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageV.right).offset(10);
        make.centerY.equalTo(self.contentView.centerY);
    }];
}

-(void)layoutSubviews
{
    if (!_layer) {
        _layer = [CALayer layer];
        _layer.backgroundColor = LIGHT_LIGHT_GRAY.CGColor;
        [self.contentView.layer addSublayer:_layer];
    }
    _layer.frame = CGRectMake(SCREEN_WIDTH*0.1, self.frame.size.height-1, SCREEN_WIDTH*0.9, 1);
    
}

-(void)hiddenLayer:(BOOL)b
{
    if (!_layer) {
        _layer = [CALayer layer];
        _layer.backgroundColor = LIGHT_LIGHT_GRAY.CGColor;
        [self.contentView.layer addSublayer:_layer];
    }
    _layer.hidden = b;
}

@end
