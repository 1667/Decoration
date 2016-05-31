//
//  DesignTableViewCell.h
//  decoration
//
//  Created by innke on 15/11/20.
//  Copyright © 2015年 find. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DesignTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView    *headerImage;
@property (nonatomic,strong) UILabel        *headerlbl;
@property (nonatomic,strong) UILabel        *explbl;
@property (nonatomic,strong) UILabel        *commentlabel;
@property (nonatomic,strong) UILabel        *pricelabel;
@property (nonatomic,strong) UILabel        *taglabel;

@end
