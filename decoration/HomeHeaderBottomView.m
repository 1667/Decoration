//
//  HomeHeaderBottomView.m
//  decoration
//
//  Created by innke on 15/11/25.
//  Copyright © 2015年 find. All rights reserved.
//

#define BtnCount        4
#define BtnW            SCREEN_WIDTH/BtnCount

#import "HomeHeaderBottomView.h"
#import "CHButton.h"

@implementation HomeHeaderBottomView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)initView
{
    NSArray *imageName = @[@"gongzhuang",@"sheji",@"luntan",@"jiaju"];
    NSArray *titleName = @[@"找工长",@"设计师",@"找论坛",@"找家居"];
    
    CGFloat x = 0;
    for (int i = 0;  i < 4; i ++) {
        CHButton *btn = [[CHButton alloc] initWithStyle:TitleOnDown titlePersent:0.3];
        btn.tag = i+1;
        btn.frame = CGRectMake(x, 10, BtnW, self.frame.size.height-20);
        [btn setImage:[UIImage imageNamed:imageName[i]] forState:UIControlStateNormal];
        [btn setTitle:titleName[i] forState:UIControlStateNormal];
        [btn setTitleColor:TOP_GREEN forState:UIControlStateNormal];
        [self addSubview:btn];
        x += BtnW;
    }
}

@end
