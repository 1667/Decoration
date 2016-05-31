//
//  HomeHeaderView.m
//  decoration
//
//  Created by innke on 15/11/17.
//  Copyright © 2015年 find. All rights reserved.
//

#import "HomeHeaderView.h"
#import "LandScroll3View.h"
#import "HomeHeaderBottomView.h"

@implementation HomeHeaderView
{
    LandScroll3View *_lView;
    HomeHeaderBottomView *_headerBottom;
}

-(void)initView
{
    
    _lView = [[LandScroll3View alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*0.3)];
    [self addSubview:_lView];

    _headerBottom = [[HomeHeaderBottomView alloc] initWithFrame:CGRectMake(0, HeadViewH, SCREEN_WIDTH, HomeHeadBottomH)];
    [self addSubview:_headerBottom];
    
}

@end
