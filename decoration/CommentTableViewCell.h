//
//  CommentTableViewCell.h
//  decoration
//
//  Created by innke on 15/11/29.
//  Copyright © 2015年 find. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserNameView.h"
#import "CHButton.h"

@interface CommentTableViewCell : UITableViewCell

@property (nonatomic,strong) UserNameView *userView;
@property (nonatomic,strong) CHButton       *makeComment;
@property (nonatomic,strong) UILabel        *contentLable;

@end
