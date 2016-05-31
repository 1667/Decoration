//
//  HomeTableViewCell.h
//  decoration
//
//  Created by innke on 15/11/25.
//  Copyright © 2015年 find. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ImageViewWithCount.h"


@interface HomeTableViewCell : UITableViewCell

@property (nonatomic,strong) ImageViewWithCount *leftView;
@property (nonatomic,strong) ImageViewWithCount *topView;
@property (nonatomic,strong) ImageViewWithCount *rightView;

@end
