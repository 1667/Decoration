//
//  ForumViewHeader.m
//  decoration
//
//  Created by innke on 15/11/20.
//  Copyright © 2015年 find. All rights reserved.
//

#import "ForumViewHeader.h"
#import "LandScroll3View.h"


@implementation ForumViewHeader
{
    LandScroll3View *_lView;
    CALayer         *_botomLayer;
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)initView
{
    _lView = [[LandScroll3View alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*0.3*0.7)];
    [self addSubview:_lView];
    _botomLayer = [CALayer layer];
    [_botomLayer setBackgroundColor:LIGHT_GRAY.CGColor];
    [self.layer addSublayer:_botomLayer];
    
}

-(void)layoutSubviews
{
    _botomLayer.frame = CGRectMake(0, self.frame.size.height, SCREEN_WIDTH, 1);
    
}


@end
