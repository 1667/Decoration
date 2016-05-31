//
//  ImageViewWithCount.h
//  decoration
//
//  Created by innke on 15/11/25.
//  Copyright © 2015年 find. All rights reserved.
//

#import "BaseViewWithOutInit.h"
#import "CHButton.h"

@interface ImageViewWithCount : BaseViewWithOutInit

@property (nonatomic,strong)UIImageView *bigImageView;
@property (nonatomic,strong)CHButton    *commentCount;
@property (nonatomic,strong)CHButton    *seeCount;


@end
