//
//  CommentTableViewCell.m
//  decoration
//
//  Created by innke on 15/11/29.
//  Copyright © 2015年 find. All rights reserved.
//

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell

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

-(UserNameView *)userView
{
    if (_userView == nil) {
        _userView = [UserNameView new];
        _userView.userName.text = @"浪迹天涯";
        _userView.flagLable.text = @"中式派";
        _userView.rightTop.text = @"1楼";
        [self.contentView addSubview:_userView];
    }
    
    return _userView;
}

-(CHButton *)makeComment
{
    if (!_makeComment) {
        _makeComment = [[CHButton alloc] initWithStyle:TitltOnRight titlePersent:0.7];
        [_makeComment setTitleColor:LAYER_LIGHT_GRAY forState:UIControlStateNormal];
        [_makeComment setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
        [_makeComment setTitle:@"1333" forState:UIControlStateNormal];
        [self.contentView addSubview:_makeComment];
    }
    return _makeComment;
}

-(UILabel *)contentLable
{
    if (!_contentLable) {
        _contentLable = [UILabel new];
        _contentLable.text = @"为啥色条这么灰，不过看上去挺有品质的";
        _contentLable.font = SYS_FONT_WITH_SIZE(14);
        _contentLable.numberOfLines = 0;
        _contentLable.preferredMaxLayoutWidth = SCREEN_WIDTH-20;
        [self.contentView addSubview:_contentLable];
    }
    return _contentLable;
}

-(void)initView
{

    [self.userView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.contentView);
        make.height.equalTo(70);
    }];
    
    [self.contentLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userView.bottom);
        make.left.equalTo(self.contentView).offset(10);
        
    }];
    
    [self.makeComment makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLable.bottom).offset(10);
        make.right.equalTo(self.contentView.right).offset(-10);
        make.bottom.lessThanOrEqualTo(self.contentView.bottom).offset(-10);
        make.size.equalTo(CGSizeMake(50, 20));
    }];
    
}

@end
