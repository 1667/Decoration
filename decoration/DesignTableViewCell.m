//
//  DesignTableViewCell.m
//  decoration
//
//  Created by innke on 15/11/20.
//  Copyright © 2015年 find. All rights reserved.
//

#import "DesignTableViewCell.h"
#import "Utils.h"

@implementation DesignTableViewCell

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
    _headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sheji"]];
    [self addSubview:_headerImage];
    
    _headerlbl = [[UILabel alloc] init];
    _headerlbl.text = @"大胡子";
    _headerlbl.font = SYS_FONT_WITH_SIZE(16);
    [self addSubview:_headerlbl];
    
    _explbl = [UILabel new];
    _explbl.text = @"经验：10年";
    _explbl.font = SYS_FONT_WITH_SIZE(14);
    [self addSubview:_explbl];
    
    _commentlabel = [UILabel new];
    _commentlabel.text = @"评价：82    签单：108";
    _commentlabel.font = SYS_FONT_WITH_SIZE(14);
    [self addSubview:_commentlabel];
    
    _pricelabel = [UILabel new];
    _pricelabel.text = @"100-200";
    _pricelabel.textColor = TOP_GREEN;
    _pricelabel.font = SYS_FONT_WITH_SIZE(14);
    [self addSubview:_pricelabel];
    
    _taglabel = [UILabel new];
    _taglabel.text = @"元/m";
    _taglabel.textAlignment = NSTextAlignmentCenter;
    _taglabel.textColor = TOP_GREEN;
    _taglabel.font = SYS_FONT_WITH_SIZE(14);
    [self addSubview:_taglabel];
 
    
    [_headerImage makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(10);
        make.top.equalTo(self.top).offset(10);
        make.bottom.equalTo(self.bottom).offset(-10);
        make.width.equalTo(_headerImage.height);
    }];
    
    [_headerlbl makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerImage.top);
        make.left.equalTo(_headerImage.right).offset(20);
        
    }];
    
    [_explbl makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerlbl.bottom).offset(5);
        make.left.equalTo(_headerlbl);
    }];
    
    [_commentlabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headerlbl);
        make.bottom.equalTo(_headerImage);
        
    }];
    
    [_pricelabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_explbl).offset(3);
        make.right.equalTo(self.right).offset(-30);
    }];
    
    [_taglabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_pricelabel.bottom).offset(5);
        make.width.equalTo(_pricelabel);
        make.left.equalTo(_pricelabel);
    }];
    
    
}



@end
