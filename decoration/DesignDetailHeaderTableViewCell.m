//
//  DesignDetailHeaderTableViewCell.m
//  decoration
//
//  Created by innke on 15/11/29.
//  Copyright © 2015年 find. All rights reserved.
//

#import "DesignDetailHeaderTableViewCell.h"
#import "Utils.h"
#import "UIImage+LocalSize.h"

@implementation DesignDetailHeaderTableViewCell

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

-(CHButton *)commentCount
{
    if (!_commentCount) {
        _commentCount = [[CHButton alloc] initWithStyle:TitltOnRight titlePersent:0.7];
        [_commentCount setTitleColor:LAYER_LIGHT_GRAY forState:UIControlStateNormal];
        [_commentCount setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
        [_commentCount setTitle:@"123" forState:UIControlStateNormal];
        [self.contentView addSubview:_commentCount];
    }
    return _commentCount;
}

-(CHButton *)seeCount
{
    if (!_seeCount) {
        _seeCount = [[CHButton alloc] initWithStyle:TitltOnRight titlePersent:0.7];
        [_seeCount setTitleColor:LAYER_LIGHT_GRAY forState:UIControlStateNormal];
        [_seeCount setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
        [_seeCount setTitle:@"1333" forState:UIControlStateNormal];
        [self.contentView addSubview:_seeCount];
        
    }
    return _seeCount;
}

-(CHButton *)makeComment
{
    if (!_makeComment) {
        _makeComment = [[CHButton alloc] initWithStyle:TitltOnRight titlePersent:0.7];
        [_makeComment setTitleColor:LAYER_LIGHT_GRAY forState:UIControlStateNormal];
        [_makeComment setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
        [_makeComment setTitle:@"回复" forState:UIControlStateNormal];
        [self.contentView addSubview:_makeComment];
        
    }
    return _makeComment;
}

-(UILabel *)title
{
    if (!_title) {
        _title = [UILabel new];
        _title.font = SYS_FONT_WITH_SIZE(16);
        _title.text = @"欧式大家都花了多少钱";
        [self.contentView addSubview:_title];
    }
    return _title;
}

-(UILabel *)tagLable
{
    if (!_tagLable) {
        _tagLable = [UILabel new];
        _tagLable.textColor = LAYER_LIGHT_GRAY;
        _tagLable.font = SYS_FONT_WITH_SIZE(12);
        _tagLable.textAlignment = NSTextAlignmentRight;
        _tagLable.text = @"设计交流论坛";
        [self.contentView addSubview:_tagLable];
    }
    return _tagLable;
}

-(CALayer *)topLine
{
    if (!_topLine) {
        _topLine = [CALayer layer];
        _topLine.backgroundColor = LAYER_LIGHT_GRAY.CGColor;
        [self.contentView.layer addSublayer:_topLine];
    }
    return _topLine;
}

-(CALayer *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [CALayer layer];
        _bottomLine.backgroundColor = LAYER_LIGHT_GRAY.CGColor;
        [self.contentView.layer addSublayer:_bottomLine];
    }
    return _bottomLine;
}

-(UserNameView *)userView
{
    if (!_userView) {
        _userView = [UserNameView new];
        [self.contentView addSubview:_userView];
        
    }
    return _userView;
}

-(UILabel *)contentLable
{
    if (!_contentLable) {
        _contentLable = [UILabel new];
        _contentLable.font = SYS_FONT_WITH_SIZE(12);
        _contentLable.numberOfLines = 0;
        _contentLable.preferredMaxLayoutWidth =SCREEN_WIDTH-20;
        _contentLable.text = @"装修公司给力我三个设计师，都是做欧式设计的，估算5万，请问大家都花了多少钱，谢谢大家了！！！";
        [self.contentView addSubview:_contentLable];
    }
    return _contentLable;
}

-(UIImageView *)contentImage
{
    if (!_contentImage) {
        _contentImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"house5"]];
        [self.contentView addSubview:_contentImage];
        
    }
    return _contentImage;
}



-(void)initView
{
    [self.title makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        
    }];
    
    [self.seeCount makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.title);
        make.top.equalTo(self.title.bottom).offset(20);
        make.size.equalTo(CGSizeMake(50, 20));
    }];
    
    [self.commentCount makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.seeCount.right).offset(3);
        make.top.equalTo(self.title.bottom).offset(20);
        make.size.equalTo(CGSizeMake(50, 20));
    }];
    
    [self.tagLable makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.right).offset(-10);
        make.top.equalTo(self.title.bottom).offset(20);
    }];
    
    [self.userView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.seeCount.bottom).offset(20);
        make.left.right.equalTo(self.contentView);
        make.height.equalTo(70);
    }];
    
    [self.contentLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.top.equalTo(self.userView.bottom).offset(10);
        
    }];
    
    [self.contentImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLable.bottom).offset(10);
        make.left.equalTo(self.contentView.left).offset(10);
        make.size.equalTo([self.contentImage.image localImageSizeWithWidth:SCREEN_WIDTH-20]);
        //make.bottom.lessThanOrEqualTo(self.contentView).offset(-10);
    }];
    
    [self.makeComment makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentImage.bottom).offset(10);
        make.right.equalTo(self.contentImage);
        make.size.equalTo(CGSizeMake(50, 20));
        make.bottom.lessThanOrEqualTo(self.contentView).offset(-10);
    }];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.topLine.frame = CGRectMake(0, self.userView.frame.origin.y-10, SCREEN_WIDTH, 1);
    self.bottomLine.frame = CGRectMake(0, self.frame.size.height-1, SCREEN_WIDTH, 1);
}

@end
