//
//  DesignDetailHeaderTableViewCell.h
//  decoration
//
//  Created by innke on 15/11/29.
//  Copyright © 2015年 find. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHButton.h"
#import "UserNameView.h"

@interface DesignDetailHeaderTableViewCell : UITableViewCell


@property (nonatomic,strong) UILabel *title;
@property (nonatomic,strong)CHButton    *commentCount;
@property (nonatomic,strong)CHButton    *seeCount;
@property (nonatomic,strong)CHButton    *makeComment;
@property (nonatomic,strong)UILabel     *tagLable;
@property (nonatomic,strong)CALayer     *topLine;
@property (nonatomic,strong)CALayer     *bottomLine;
@property (nonatomic,strong)UserNameView    *userView;
@property (nonatomic,strong)UILabel     *contentLable;
@property (nonatomic,strong)UIImageView *contentImage;



@end
