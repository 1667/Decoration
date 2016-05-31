//
//  RootViewController.m
//  CarCleaner
//
//  Created by innke on 14/12/29.
//  Copyright (c) 2014年 innke. All rights reserved.
//

#define kBtnCount   4
#define kUpMager    5
#define kDockWidth  (kDockViewHeight-kUpMager*2)
#define kSpace   (self.view.frame.size.width - kDockWidth*kBtnCount)/(kBtnCount*2)

#import "RootViewController.h"
#import "CHButton.h"
#import "HomeViewController.h"
#import "FixupViewController.h"
#import "ForumViewController.h"
#import "DesignViewController.h"
#import "Utils.h"

@interface RootViewController ()<UIGestureRecognizerDelegate>

@end

@implementation RootViewController
{
    CGPoint startPoint;
    
    UIView *_currentView;
    CHButton *_currentBtn;
    
    BOOL _isDockViewOnHiden;
    BOOL _isWaitingNav;
    
    CHButton *secondBtn;
}


- (void)viewDidLoad
{
   
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    [self addController];
    [self addDockView];
    [self addSubButton];

}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


-(void)addDockView
{
    _dockView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - kDockViewHeight, self.view.frame.size.width, kDockViewHeight)];
    _dockView.backgroundColor = [UIColor whiteColor];
    _dockView.layer.shadowColor = [[UIColor grayColor] colorWithAlphaComponent:0.2].CGColor;
    _dockView.layer.shadowOffset = CGSizeMake(0, -2);
    _dockView.layer.shadowOpacity = 0.5;
    [self.view addSubview:_dockView];
    
    _isDockViewOnHiden = NO;
}

-(void)addSubButton
{
    
    CGFloat x = kSpace;
    CHButton *indexBtn = [[CHButton alloc] initWithStyle:TitleOnDown titlePersent:0.2];
    indexBtn.frame = CGRectMake(kSpace , kUpMager, kDockWidth, kDockWidth);
    [indexBtn setImage:[UIImage imageNamed:@"index_icon_normal.png"] forState:UIControlStateNormal];
    [indexBtn setImage:[UIImage imageNamed:@"index_icon_select.png"] forState:UIControlStateSelected];
    indexBtn.tag = 0;
    
    indexBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [indexBtn setTitle:@"首页" forState:UIControlStateNormal];
    indexBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [indexBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    x += kSpace*2+kDockWidth;
    
    CHButton *cleanBtn = [[CHButton alloc] initWithStyle:TitleOnDown titlePersent:0.2];
    cleanBtn.frame = CGRectMake(x , kUpMager, kDockWidth, kDockWidth);
    [cleanBtn setImage:[UIImage imageNamed:@"gongzhuang"] forState:UIControlStateNormal];
    [cleanBtn setImage:[UIImage imageNamed:@"gongzhuang"] forState:UIControlStateSelected];
    cleanBtn.tag = 1;
    cleanBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [cleanBtn setTitle:@"找装修" forState:UIControlStateNormal];
    cleanBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [cleanBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    secondBtn = cleanBtn;
    x += kSpace*2+kDockWidth;
    
    CHButton *boxBtn = [[CHButton alloc] initWithStyle:TitleOnDown titlePersent:0.2];
    boxBtn.frame = CGRectMake(x , kUpMager, kDockWidth, kDockWidth);
    [boxBtn setImage:[UIImage imageNamed:@"sheji"] forState:UIControlStateNormal];
    [boxBtn setImage:[UIImage imageNamed:@"sheji"] forState:UIControlStateSelected];
    boxBtn.tag = 2;
    boxBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [boxBtn setTitle:@"找设计" forState:UIControlStateNormal];
    boxBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [boxBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    x += kSpace*2+kDockWidth;
    
    
    CHButton *mineBtn = [[CHButton alloc] initWithStyle:TitleOnDown titlePersent:0.2];
    mineBtn.frame = CGRectMake(x , kUpMager, kDockWidth, kDockWidth);
    [mineBtn setImage:[UIImage imageNamed:@"luntan"] forState:UIControlStateNormal];
    [mineBtn setImage:[UIImage imageNamed:@"luntan"] forState:UIControlStateSelected];
    mineBtn.tag = 3;
    mineBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [mineBtn setTitle:@"找论坛" forState:UIControlStateNormal];
    mineBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [mineBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    x += kSpace*2+kDockWidth;
   
//    CHButton *jiajuBtn = [[CHButton alloc] initWithStyle:TitleOnDown titlePersent:0.2];
//    jiajuBtn.frame = CGRectMake(x , kUpMager, kDockWidth, kDockWidth);
//    [jiajuBtn setImage:[UIImage imageNamed:@"jiaju"] forState:UIControlStateNormal];
//    [jiajuBtn setImage:[UIImage imageNamed:@"jiaju"] forState:UIControlStateSelected];
//    jiajuBtn.tag = 4;
//    //jiajuBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [jiajuBtn setTitle:@"找家居" forState:UIControlStateNormal];
//    jiajuBtn.titleLabel.font = [UIFont systemFontOfSize:13];
//    [jiajuBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    x += kSpace*2+kDockWidth;
    
    [_dockView addSubview:indexBtn];
    [_dockView addSubview:cleanBtn];
    [_dockView addSubview:boxBtn];
    [_dockView addSubview:mineBtn];
   // [_dockView addSubview:jiajuBtn];
    
    _currentBtn = indexBtn;
    _currentBtn.selected = YES;
    
}

-(void)addController
{
    
    HomeViewController *indexCtrl = [[HomeViewController alloc] init];
    FixupViewController *fixCtrl = [[FixupViewController alloc] init];
    DesignViewController *designCtrl = [[DesignViewController alloc] init];
    ForumViewController  *forumCtrl  = [[ForumViewController alloc] init];
    
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:indexCtrl];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:fixCtrl];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:designCtrl];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:forumCtrl];
    
    [self addChildViewController:nav1];
    [self addChildViewController:nav2];
    [self addChildViewController:nav3];
    [self addChildViewController:nav4];
    
    [self.view addSubview:nav1.view];
    _currentView = nav1.view;
    
    
}


-(void)btnClick:(CHButton*)btn
{
    
    if (_currentBtn == btn)
    {
        return;
    }
    
    _currentBtn.selected = NO;
    _currentBtn = btn;
    _currentBtn.selected = YES;

    [_currentView removeFromSuperview];
    
    
    //添加转场动画
    CATransition *transition = [[CATransition alloc] init];
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromRight;
    transition.duration = 0.2;
    [self.view.layer addAnimation:transition forKey:nil];
    
    UINavigationController *nav = self.childViewControllers[btn.tag];
    [self.view addSubview:nav.view];
    [self.view bringSubviewToFront:_dockView];
    _currentView = nav.view;
    
}

-(BOOL)isDockOnHiden
{
    return _isDockViewOnHiden;
}

+(RootViewController*)getRootController
{
    return  (RootViewController*)[UIApplication sharedApplication].keyWindow.rootViewController.childViewControllers[0];
}


-(void)moveOnPoint:(CGPoint)point
{
    float dis = point.x - startPoint.x;
    
    if (dis >= self.view.frame.size.width - 100 || dis <= -(self.view.frame.size.width - 100))
    {
        
    }
    
    _currentView.transform = CGAffineTransformMakeTranslation(dis, 0);
    
    _dockView.transform = CGAffineTransformMakeTranslation(dis, 0);
    
    float scale = dis / self.view.frame.size.width;
    scale = scale < 0 ? -scale : scale;
    scale = 1.0 - scale / 2;
    
    NSLog(@"dis = %f  scale = %f", dis, scale);

    _currentView.transform = CGAffineTransformScale(_currentView.transform , scale, scale);
    _dockView.transform = CGAffineTransformScale(_dockView.transform, scale, scale);
    
    CGRect frame = _dockView.frame;
    frame.origin.y = CGRectGetMaxY(_currentView.frame) - 50 * scale;
    _dockView.frame = frame;
    
    
}
-(void)TouchOnPoint:(CGPoint)point
{
    startPoint = point;
}
-(void)endOnPoint:(CGPoint)point
{
    
}

-(void)switchToSecondView
{
    [self btnClick:secondBtn];
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.navigationController.childViewControllers.count == 1) {
        return NO;
    }
    else
        return YES;
}



@end
