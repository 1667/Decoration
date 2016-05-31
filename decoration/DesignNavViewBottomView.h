//
//  DesignNavViewBottomView.h
//  decoration
//
//  Created by innke on 15/11/20.
//  Copyright © 2015年 find. All rights reserved.
//

#import "BaseViewWithOutInit.h"

@interface DesignNavViewBottomView : BaseViewWithOutInit

-(instancetype)initWithTitle:(NSString *)str;

@property (nonatomic,strong)UIImageView   *leftImage;
@property (nonatomic,strong)UIImageView   *rightImage;
@property (nonatomic,strong)UILabel       *titleLable;

@end
