//
//  DesignDetailViewController.m
//  decoration
//
//  Created by innke on 15/11/27.
//  Copyright © 2015年 find. All rights reserved.
//

#import "DesignDetailViewController.h"
#import "UIImage+LocalSize.h"
#import "Utils.h"

@interface DesignDetailViewController ()

@property (nonatomic,strong)UITextView      *textView;


@end

@implementation DesignDetailViewController
{
    UIButton        *_shared;
    UIButton        *_star;
    NSString        *_str;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigateBar];
    [self setTitleText:@"现代简约"];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark initProperty

-(UITextView*)textView
{
    if (!_textView) {
        
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, NAV_STATUS_HEIGHT(self), SCREEN_WIDTH, SCREEN_HEIGHT-NAV_STATUS_HEIGHT(self))];
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.text = _str;
        _textView.textColor = LIGHT_GRAY;
        _textView.font = SYS_FONT_WITH_SIZE(14);
        _textView.editable = NO;
    }
    return _textView;
}

#pragma mark fun

-(void)setNavigateBar
{
    _shared = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [_shared setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:_shared];
    
    _star = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [_star setBackgroundImage:[UIImage imageNamed:@"xing"] forState:UIControlStateNormal];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:_star];
    
    self.navigationItem.rightBarButtonItems = @[item1,item2];
    
}

-(void)initView
{
    _str = @"西山国际城/北京.海淀\n\n设计师：大胡子     风格：现代简约\n面积：120㎡          价格：5.3万\n设计说明：接到施工案子以后，感觉是一个很简约的施工项目，但是越是简约的设计方案，越能考验施工的水平，所以心里还是有一定的压力存在的，简约设计的方案对细节收口做法，工序的进行有相当高的要求，在同鼓励 \n\n\n\n\n";
    
    [self.view addSubview:self.textView];
    [self setNormalAttribute];
    [self setImageIn];
    
    
    
}

-(void)setNormalAttribute
{
    NSMutableAttributedString *mutStr = [_textView.attributedText mutableCopy];
    NSArray *array = [_str componentsSeparatedByString:@"\n"];
    NSString *tmpStr = (NSString *)array[0];
    [mutStr addAttribute:NSFontAttributeName value:SYS_FONT_WITH_SIZE(20) range:NSMakeRange(0, tmpStr.length)];
    [mutStr addAttribute:NSFontAttributeName value:SYS_FONT_WITH_SIZE(4) range:NSMakeRange(((NSString *)array[0]).length+1, 1)];
    [mutStr addAttribute:NSFontAttributeName value:SYS_FONT_WITH_SIZE(14) range:NSMakeRange(((NSString *)array[0]).length+2, ((NSString *)array[2]).length)];
    [mutStr addAttribute:NSFontAttributeName value:SYS_FONT_WITH_SIZE(14) range:NSMakeRange(((NSString *)array[2]).length+1, ((NSString *)array[3]).length)];
    
    _textView.attributedText = [mutStr copy];
    
}

-(void)setImageIn
{
    NSMutableAttributedString *mutStr = [_textView.attributedText mutableCopy];
    
    UIImage *image = [UIImage imageNamed:@"house5"];
    NSTextAttachment * attachment1 = [[NSTextAttachment alloc] init];
    attachment1.bounds = CGRectMake(0, 0, _textView.frame.size.width-10, [image localImageSizeWithWidth:SCREEN_WIDTH].height);
    attachment1.image = image;
    NSAttributedString * attachStr1 = [NSAttributedString attributedStringWithAttachment:attachment1];
    [mutStr insertAttributedString:attachStr1 atIndex:_str.length-3];
    
    UIImage *image2 = [UIImage imageNamed:@"house6"];
    NSTextAttachment * attachment2 = [[NSTextAttachment alloc] init];
    attachment2.bounds = CGRectMake(0, 0, _textView.frame.size.width-10, [image2 localImageSizeWithWidth:SCREEN_WIDTH].height);
    attachment2.image = image2;
    NSAttributedString * attachStr2 = [NSAttributedString attributedStringWithAttachment:attachment2];
    [mutStr insertAttributedString:attachStr2 atIndex:_str.length];
    
    
    
    _textView.attributedText = [mutStr copy];
}


@end
