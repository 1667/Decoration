//
//  ScrollTitltView.h
//  TTTT
//
//  Created by innke on 15/9/12.
//  Copyright (c) 2015年 wuxianying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollTitltView : UIView


-(instancetype)initWithFrame:(CGRect)frame titleText:(NSMutableArray *)titleArray viewArray:(NSMutableArray *)vA;

@property (nonatomic,strong) NSMutableArray *titleArray;
@property (nonatomic,strong) NSMutableArray *titleBtnArray;

@property (nonatomic,strong) NSMutableArray *titleCountArray;
@property (nonatomic,strong) NSMutableArray *viewArray;
@property (nonatomic,strong) UIView         *flagView;

@end
