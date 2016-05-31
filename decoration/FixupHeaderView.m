//
//  FixupHeaderView.m
//  decoration
//
//  Created by innke on 15/11/18.
//  Copyright © 2015年 find. All rights reserved.
//

#import "FixupHeaderView.h"
#import "LandScroll3View.h"
#import "FixupHeaderSubView.h"

@implementation FixupHeaderView
{
    LandScroll3View *_lView;
    CALayer         *_botomLayer;
    CALayer         *_midLayer;
}

-(void)initView
{
    _lView = [[LandScroll3View alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*0.3*0.7)];
    [self addSubview:_lView];
    _botomLayer = [CALayer layer];
    [_botomLayer setBackgroundColor:LIGHT_GRAY.CGColor];
    [self.layer addSublayer:_botomLayer];
    
    _midLayer = [CALayer layer];
    [_midLayer setBackgroundColor:LIGHT_GRAY.CGColor];
    [self.layer addSublayer:_midLayer];
    
    FixupHeaderSubView *sV1 = [[FixupHeaderSubView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT*0.3*0.7, SCREEN_WIDTH*0.5, SCREEN_HEIGHT*0.3*0.3)];
    [sV1.topLable setText:@"申请量房"];
    [sV1.bottomLable setText:@"设计量房服务"];
    [self addSubview:sV1];
    
    FixupHeaderSubView *sV2 = [[FixupHeaderSubView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.5, SCREEN_HEIGHT*0.3*0.7, SCREEN_WIDTH*0.5, SCREEN_HEIGHT*0.3*0.3)];
    [sV2.topLable setText:@"申请报价"];
    [sV2.bottomLable setText:@"专业预算服务"];
    [self addSubview:sV2];
    
    
}

-(void)layoutSubviews
{
    
    _midLayer.frame = CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT*0.3*0.7, 1, SCREEN_HEIGHT*0.3*0.3);
    _botomLayer.frame = CGRectMake(0, self.frame.size.height, SCREEN_WIDTH, 1);
    
}

@end
