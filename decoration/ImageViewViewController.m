//
//  ImageViewViewController.m
//  TTT
//
//  Created by innke on 15/8/27.
//  Copyright (c) 2015年 wuxianying. All rights reserved.
//

#import "ImageViewViewController.h"
#import "ZoomImageView.h"
#import "UIImage+Image.h"
#import "Utils.h"



@interface ImageViewViewController ()<UIScrollViewDelegate>

@end

@implementation ImageViewViewController
{
    NSMutableArray *_imageArray;
    BOOL            bShowBar;
    UIPageControl   *_pageControl;
    UILabel         *titleLabel;
    ZoomImageView   *fristIV;
    CGRect          fristFrame;
    CGRect          secondrFrame;
    UIScrollView    *_sv;
    
    UIImageView     *animateImage;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    bShowBar = NO;
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }

    self.navigationItem.leftBarButtonItem = [[Utils instance] createBackItemWithSelecter:@selector(back) target:self];
    
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.textColor = [UIColor darkTextColor];
    titleLabel.font = [UIFont systemFontOfSize:19];
    titleLabel.text = [NSString stringWithFormat:@"1/%ld",[_imageArray count]];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    _sv = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _sv.showsVerticalScrollIndicator = NO;
    _sv.showsHorizontalScrollIndicator = NO;
    [_sv setBounces:NO];
    _sv.delegate = self;
    _sv.pagingEnabled = YES;
    [self.view addSubview:_sv];
    UITapGestureRecognizer *singleTap = nil;
    float x = 0;
    ZoomImageView *tmpIV = nil;
    for (int i = 0; i < [_imageArray count]; i++) {
        tmpIV = [[ZoomImageView alloc] initWithFrame:CGRectMake(x, 0, self.view.frame.size.width, self.view.frame.size.height) ImageView:[_imageArray objectAtIndex:i]];
        singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showbar:)];
        [tmpIV addGestureRecognizer:singleTap];
        [_sv addSubview:tmpIV];
        if (i == _startIndex) {
            //[tmpIV setAlpha:0.0];
            fristIV = tmpIV;
            [fristIV setHidden:YES];
            secondrFrame = CGRectMake(x, 0, self.view.frame.size.width, self.view.frame.size.height);
        }
        x += self.view.frame.size.width;
    }
    [_sv setContentSize:CGSizeMake(x, 0)];
    
    [_sv setContentOffset:CGPointMake(self.view.frame.size.width*_startIndex, 0) animated:NO];
    [titleLabel setText:[NSString stringWithFormat:@"%ld/%ld",_startIndex+1,[_imageArray count]]];
    [self initView];
    
}

-(void)initView
{
    _pageControl = [UIPageControl new];
    [_pageControl setBackgroundColor:[UIColor clearColor]];
    _pageControl.currentPage = 0;
    _pageControl.numberOfPages = [_imageArray count];
    _pageControl.hidesForSinglePage = YES;
    [self.view addSubview:_pageControl];
    [_pageControl setCurrentPageIndicatorTintColor:LIGHT_GRAY];
    [_pageControl setPageIndicatorTintColor:LIGHT_LIGHT_GRAY];
    [_pageControl makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(320, 10));
        make.bottom.equalTo(self.view.bottom).offset(-10);
        make.centerX.equalTo(self.view.centerX);
        
    }];
    if (animateImage != nil) {
        [self.view addSubview:animateImage];
        [animateImage setAlpha: 0.0];
    }
    
}

-(void)viewDidAppear:(BOOL)animated
{
    if (animateImage != nil) {
        [animateImage setAlpha:0.0];

        [UIView animateWithDuration:0.5 animations:^{

            animateImage.frame = CGRectMake(0, self.view.frame.size.height/2-self.view.frame.size.width/2, self.view.frame.size.width, self.view.frame.size.width);
            animateImage.alpha = 1.0;
        } completion:^(BOOL finished) {
            [fristIV setHidden:NO];
            [animateImage removeFromSuperview];
            bShowBar = NO;
            [self showNav];
        }];
        
    }
    else
    {
        [fristIV setAlpha:0.0];
        [fristIV setHidden:NO];
        [UIView animateWithDuration:0.5 animations:^{
            
            fristIV.alpha = 1.0;
            
        } completion:^(BOOL finished) {
            bShowBar = NO;
            [self showNav];
        }];
    }
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:NO];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)setImageArray:(NSMutableArray *)array
{
    _imageArray = [NSMutableArray new];
    for (UIImageView *tmpV in array) {
        UIImageView *t = [UIImageView new];
        t.image = tmpV.image;
        [_imageArray addObject:t];

    }
    
}


-(void)setImageArray:(NSMutableArray *)array withAnimateFrame:(CGRect)frame
{
    UIImageView *t = [array objectAtIndex:_startIndex];
    animateImage = [[UIImageView alloc] initWithImage:t.image];
    animateImage.frame = frame;
    [self setImageArray:array];
    
}

- (BOOL)prefersStatusBarHidden
{
    return bShowBar;//隐藏为YES，显示为NO
}

-(void)showNav
{
    bShowBar = !bShowBar;
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }
    if (bShowBar) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    else
    {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    
}

-(void)showbar:(UITapGestureRecognizer*)tap
{
    [self showNav];
    //[self.navigationController popViewControllerAnimated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)sView
{
    
    NSInteger index = fabs(sView.contentOffset.x) / sView.frame.size.width;
    [_pageControl setCurrentPage:index];
    [titleLabel setText:[NSString stringWithFormat:@"%ld/%ld",index+1,[_imageArray count]]];
    
}


@end
