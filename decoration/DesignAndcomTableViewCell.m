//
//  DesignAndcomTableViewCell.m
//  decoration
//
//  Created by innke on 15/11/29.
//  Copyright © 2015年 find. All rights reserved.
//

#import "DesignAndcomTableViewCell.h"
#import "Utils.h"

@implementation DesignAndcomTableViewCell

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

#pragma mark initPro

-(UILabel *)titleLable
{
    if (!_titleLable) {
        _titleLable = [UILabel new];
        _titleLable.textColor = LIGHT_GRAY;
        _titleLable.font = SYS_FONT_WITH_SIZE(16);
        [self.contentView addSubview:_titleLable];
        
        
    }
    return _titleLable;
}


-(UILabel *)replyTime
{
    if (!_replyTime) {
        _replyTime = [UILabel new];
        _replyTime.textColor = LAYER_LIGHT_GRAY;
        _replyTime.font = SYS_FONT_WITH_SIZE(14);
        [self.contentView addSubview:_replyTime];
        
        
    }
    return _replyTime;
}

-(UILabel *)replyCount
{
    if (!_replyCount) {
        _replyCount = [UILabel new];
        _replyCount.textColor = LAYER_LIGHT_GRAY;
        _replyCount.font = SYS_FONT_WITH_SIZE(14);
        _replyCount.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_replyCount];
        
        
    }
    return _replyCount;
}

-(UIImageView *)imageHolder
{
    if (!_imageHolder) {
        _imageHolder = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"imageholder"]];
        [self.contentView addSubview:_imageHolder];
    }
    return _imageHolder;
}

-(void)initView
{
    self.titleLable.text = @"欧式打家都花了多少";
    [self.titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        
    }];
    
    [self.replyTime setText:@"回复：56秒前"];
    [self.replyTime makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLable);
        make.top.equalTo(self.titleLable.bottom).offset(15);
        make.bottom.lessThanOrEqualTo(self.contentView.bottom).offset(-10);
    }];
    
    CGSize size = [self.replyTime.text sizeWithAttributes:@{NSFontAttributeName:self.replyTime.font}];
    
    [self.imageHolder makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.replyTime.right).offset(10);
        make.top.equalTo(self.replyTime).offset(size.height*0.2);
        make.size.equalTo(CGSizeMake(size.height, size.height*0.8));
    }];
    
    [self.replyCount setText:@"大胡子 12回"];
    [self.replyCount makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.top.equalTo(self.replyTime);
    }];
    
}

@end
