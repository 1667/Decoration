//
//  PersonCommentTableViewCell.h
//  decoration
//
//  Created by innke on 15/11/26.
//  Copyright © 2015年 find. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FiveStarView.h"

#import "CommentButton.h"

@interface PersonCommentTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView    *headerImage;
@property (nonatomic,strong) UILabel        *name;
@property (nonatomic,strong) UILabel        *item1;
@property (nonatomic,strong) UILabel        *item2;
@property (nonatomic,strong) FiveStarView        *star1;
@property (nonatomic,strong) FiveStarView        *star2;
@property (nonatomic,strong) UILabel        *comment;
@property (nonatomic,strong) CommentButton       *zanBtn;
@property (nonatomic,strong) CommentButton       *commentBtn;


@end
