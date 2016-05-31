//
//  PersonCommentTableViewCell.m
//  decoration
//
//  Created by innke on 15/11/26.
//  Copyright © 2015年 find. All rights reserved.
//

#import "PersonCommentTableViewCell.h"
#import "Utils.h"


@implementation PersonCommentTableViewCell

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
    UIView *sc = self.contentView;
    [self.headerImage makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.left).offset(10);
        make.top.equalTo(sc).offset(10);
        make.size.equalTo(CGSizeMake(40, 40));
    }];
    self.headerImage.layer.masksToBounds = YES;
    self.headerImage.layer.cornerRadius = 20;
    
    [self.name makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerImage.right).offset(10);
        make.top.equalTo(self.headerImage.top);
        
    }];
    
    [self.item1 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name.left);
        make.top.equalTo(self.name.bottom).offset(5);
    }];
    
    [self.star1 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.item1.right).offset(3);
        make.top.equalTo(self.item1);
        make.height.equalTo(self.item1);
        make.width.equalTo(SCREEN_WIDTH*0.25);
    }];
    
    [self.item2 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.star1.right).offset(20);
        make.top.equalTo(self.name.bottom).offset(5);
    }];
    
    [self.star2 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.item2.right).offset(3);
        make.top.equalTo(self.item1);
        make.height.equalTo(self.item1);
        make.width.equalTo(SCREEN_WIDTH*0.25);
    }];
    
    [self.comment makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name.left);
        make.top.equalTo(self.item1.bottom).offset(5);
        make.right.equalTo(self.right).offset(-10);
        //make.bottom.lessThanOrEqualTo(sc.bottom).offset(-10);
    }];
    
    [self.zanBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.comment.bottom).offset(10);
        make.left.equalTo(self.comment);
        make.height.equalTo(SCREEN_HEIGHT*0.05);
        make.width.equalTo((SCREEN_WIDTH-80)/2);
        make.bottom.lessThanOrEqualTo(sc.bottom).offset(-10);
    }];
    
    [self.commentBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.comment.bottom).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.equalTo(SCREEN_HEIGHT*0.05);
        make.width.equalTo((SCREEN_WIDTH-70)/2);
        make.bottom.lessThanOrEqualTo(sc.bottom).offset(-10);
    }];
    
}

-(UIImageView *)headerImage
{
    if (_headerImage == nil) {
        _headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"personH"]];
        [self.contentView addSubview:_headerImage];
    }
    return _headerImage;
}

-(UILabel *)name
{
    if (!_name) {
        _name = [UILabel new];
        _name.text = @"侠客行";
        _name.textColor = LIGHT_GRAY;
        _name.font = SYS_FONT_WITH_SIZE(14);
        [self.contentView addSubview:_name];
    }
    return _name;
}

-(UILabel *)item1
{
    if (!_item1) {
        _item1 = [UILabel new];
        _item1.text = @"施工";
        _item1.textColor = LIGHT_GRAY;
        _item1.font = SYS_FONT_WITH_SIZE(14);
        [self.contentView addSubview:_item1];
    }
    return _item1;
}

-(UILabel *)item2
{
    if (!_item2) {
        _item2 = [UILabel new];
        _item2.text = @"服务";
        _item2.textColor = LIGHT_GRAY;
        _item2.font = SYS_FONT_WITH_SIZE(14);
        [self.contentView addSubview:_item2];
    }
    return _item2;
}

-(UILabel *)comment
{
    if (!_comment) {
        _comment = [UILabel new];
        _comment.text = @"对比了好多工长，他的性价比最高，电话随叫随到，服务热心周到，工艺好，很赞！！！";
        _comment.textColor = LIGHT_GRAY;
        _comment.font = SYS_FONT_WITH_SIZE(14);
        _comment.preferredMaxLayoutWidth = SCREEN_WIDTH-60;
        _comment.numberOfLines = 0;
        [self.contentView addSubview:_comment];
    }
    return _comment;
}

-(FiveStarView *)star1
{
    if (!_star1) {
        _star1 = [FiveStarView new];
        [self.contentView addSubview:_star1];
    }
    return _star1;
}

-(FiveStarView *)star2
{
    if (!_star2) {
        _star2 = [FiveStarView new];
        [self.contentView addSubview:_star2];
    }
    return _star2;
}

-(CommentButton *)zanBtn
{
    if (!_zanBtn) {
        _zanBtn = [[CommentButton alloc] initWithStyle:TitltOnRight titlePersent:0.5];
        _zanBtn.layer.borderWidth = 1;
        _zanBtn.layer.borderColor = LIGHT_LIGHT_GRAY.CGColor;
        [_zanBtn setImage:[UIImage imageNamed:@"zan"] forState:UIControlStateNormal];
        [_zanBtn setTitle:@"(20)" forState:UIControlStateNormal];
        [_zanBtn setTitleColor:LAYER_LIGHT_GRAY forState:UIControlStateNormal];
        [_zanBtn.titleLabel setTextAlignment:NSTextAlignmentLeft ];
        _zanBtn.layer.cornerRadius = 2;
        [self.contentView addSubview:_zanBtn];
    }
    return _zanBtn;
}

-(CommentButton *)commentBtn
{
    if (!_commentBtn) {
        _commentBtn = [[CommentButton alloc] initWithStyle:TitltOnRight titlePersent:0.5];
        _commentBtn.layer.borderWidth = 1;
        _commentBtn.layer.borderColor = LIGHT_LIGHT_GRAY.CGColor;
        [_commentBtn setImage:[UIImage imageNamed:@"zan"] forState:UIControlStateNormal];
        [_commentBtn setTitle:@"(20)" forState:UIControlStateNormal];
        [_commentBtn setTitleColor:LAYER_LIGHT_GRAY forState:UIControlStateNormal];
                [_commentBtn.titleLabel setTextAlignment:NSTextAlignmentLeft ];
        _commentBtn.layer.cornerRadius = 2;
        [self.contentView addSubview:_commentBtn];
    }
    return _commentBtn;
}

@end
