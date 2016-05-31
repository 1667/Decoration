//
//  CommeonTableViewCell.h
//  decoration
//
//  Created by innke on 15/11/21.
//  Copyright © 2015年 find. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommeonTableViewCell : UITableViewCell

@property (nonatomic,strong)UIImageView     *imageV;
@property (nonatomic,strong)UILabel         *title;

-(void)hiddenLayer:(BOOL)b;

@end
