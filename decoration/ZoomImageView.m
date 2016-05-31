//
//  ZoomImageView.m
//  TTT
//
//  Created by innke on 15/8/27.
//  Copyright (c) 2015年 wuxianying. All rights reserved.
//

#import "ZoomImageView.h"

@interface ZoomImageView()<UIScrollViewDelegate>

@end

@implementation ZoomImageView
{
    UIImageView *_iv;
}
-(instancetype)initWithFrame:(CGRect)frame ImageView:(UIImageView *)iv
{
    self = [super initWithFrame:frame];
    if (self) {
        _iv = iv;
        
    }
    return self;
}

-(void)layoutSubviews
{
    UIScrollView *_sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _sv.delegate = self;
    _sv.minimumZoomScale = 1.0;
    _sv.maximumZoomScale = 3.0;
    [self addSubview:_sv];
    CGFloat origin_y = fabs(self.frame.size.height - self.frame.size.width)/2.0;
    
    _iv.frame = CGRectMake(0, origin_y, self.frame.size.width, self.frame.size.width);
    
    [_sv addSubview:_iv];
    
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _iv;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    _iv.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                            scrollView.contentSize.height * 0.5 + offsetY);
}

@end
