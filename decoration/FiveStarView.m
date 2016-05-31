//
//  FiveStarView.m
//  decoration
//
//  Created by innke on 15/11/26.
//  Copyright © 2015年 find. All rights reserved.
//

#import "FiveStarView.h"

@implementation FiveStarView
{
    NSMutableArray *_starArray;
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
    _starArray = [NSMutableArray new];
    for (int i = 0; i < 5; i++) {
        
        [_starArray addObject:[self starLayer]];
        
    }
    
    
}

-(CALayer *)starLayer
{
    CALayer *layer = [CALayer layer];
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"xingS"].CGImage);
    [self.layer addSublayer:layer];
    return layer;
}

-(void)layoutSubviews
{
    
    [super layoutSubviews];
    CGFloat layerW = (self.frame.size.width-3*4)/5;
    CGFloat layerH = self.frame.size.height;
    CGFloat x = 0;
    CGFloat y = 0;
    for (CALayer *layer in _starArray) {
        layer.frame = CGRectMake(x, y, layerW, layerH);
        x += layerW+3;
    }
    
}

-(void)setNOStar
{
    for (CALayer *layer in _starArray) {
        layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"xing"].CGImage);
    }
}

-(void)setStarCount:(NSInteger)stars
{
    [self setNOStar];
    for (int i = 0; i < stars; i++) {
        CALayer *layer = (CALayer *)_starArray[i];
        layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"xingS"].CGImage);
    }
    [self setNeedsLayout];
}

@end
