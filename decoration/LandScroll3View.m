//
//  LandScroll3View.m
//  TTTT
//
//  Created by 无线盈 on 15/10/14.
//  Copyright © 2015年 wuxianying. All rights reserved.
//

#import "LandScroll3View.h"

@interface LandScroll3View() <UIScrollViewDelegate>

@end

@implementation LandScroll3View
{
    UIScrollView            *_scrollView;
    NSMutableArray          *_array;
    UIPageControl           *_pageControl;
    NSInteger               _currentIndex;
    NSTimer                 *_timer;
    UIImageView             *leftIamgeView;
    UIImageView             *midIamgeView;
    UIImageView             *rightIamgeView;
    NSInteger               lastIndex;
    
}


-(NSMutableArray *)createViewArr
{
    NSMutableArray *tmpArray = [NSMutableArray new];
    for (int i = 0; i < 3; i++) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:self.bounds];
        [tmpArray addObject:view];
    }
    return tmpArray;
    
}

-(void)initView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
    
    _array = [[NSMutableArray alloc] initWithObjects:
              [UIImage imageNamed:@"house5"],
              [UIImage imageNamed:@"house6"],
              [UIImage imageNamed:@"house7"], nil];
    NSMutableArray *imageArray = [self createViewArr];
    CGFloat x = 0;
    NSInteger i = 0;
    for (UIImageView *v in imageArray) {
        v.frame = CGRectMake(x, 0, CGRectGetWidth(_scrollView.bounds), CGRectGetHeight(_scrollView.bounds));
        v.image = [_array objectAtIndex:i];
        i++;
        
        [_scrollView addSubview:v];
        x += CGRectGetWidth(_scrollView.bounds);
    };
    leftIamgeView = [imageArray objectAtIndex:0];
    midIamgeView = [imageArray objectAtIndex:1];
    rightIamgeView = [imageArray objectAtIndex:2];
    
    _scrollView.contentSize = CGSizeMake(x, CGRectGetHeight(_scrollView.bounds));
    [_scrollView setContentOffset:[self contentOffsetForIndex:1] animated:NO];
    [self reFreashShowImageIndex:0];
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 20)];

    _pageControl.numberOfPages = [_array count];
    _pageControl.currentPage = 0;
    _pageControl.hidesForSinglePage = YES;
    [self addSubview:_pageControl];
    [_pageControl makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_scrollView.centerX);
        make.bottom.equalTo(_scrollView.bottom).offset(-20);
    }];

}
-(CGPoint)contentOffsetForIndex:(NSInteger)Index
{
    CGFloat x = CGRectGetWidth(self.bounds)*(Index);
    return CGPointMake(x, 0);
}

-(void)reFreashShowImageIndex:(NSInteger)index
{
    if (index == 0) {
        leftIamgeView.image = [_array lastObject];
    }
    else
    {
        leftIamgeView.image = [_array objectAtIndex:index-1];
    }
    midIamgeView.image = [_array objectAtIndex:index];
    
    if (index == [_array count]-1) {
        rightIamgeView.image = _array[0];
    }
    else
    {
        rightIamgeView.image = _array[index+1];
    }
    NSLog(@"%ld ----------",index);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/CGRectGetWidth(_scrollView.bounds);
    
    if(index == 0)
    {
        if(scrollView.contentOffset.x == 0)
        {
            index = 0;
        }
        else
        {
            index = 1;
        }
    }
    
    [self scrollToIndex:index];
}

-(void)scrollToIndex:(NSInteger)index
{
    
    if (index == 2) {
        _currentIndex++;
    }
    else if(index == 0)
    {
        _currentIndex--;
    }
    else
    {
        return;
    }
    if (_currentIndex < 0) {
        _currentIndex = _currentIndex % [_array count]+[_array count];
    }
    
    NSLog(@"%ld ccc----------",_currentIndex);
    [self reFreashShowImageIndex:_currentIndex % [_array count]];
    [_scrollView setContentOffset:[self contentOffsetForIndex:1] animated:NO];
   
}


@end
