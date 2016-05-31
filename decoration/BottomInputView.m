//
//  BottomInputView.m
//  TestProject
//
//  Created by wxy on 15/11/27.
//  Copyright © 2015年 wxy. All rights reserved.
//

#import "BottomInputView.h"
#import "Utils.h"

@interface BottomInputView() <UITextViewDelegate>

@property(nonatomic,strong)CALayer          *toplayer;
@property(nonatomic,strong)CALayer          *bottomlayer;
@property(nonatomic,strong)UILabel          *placeHolder;
@property(nonatomic,strong)UIButton         *sendBtn;

@end

@implementation BottomInputView
{
    CGFloat     lastHight;
    CGFloat     orignH;
    CGRect      orignFrame;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)layoutSubviews
{
    self.toplayer.frame = CGRectMake(0, 0, self.frame.size.width, 1);
    self.bottomlayer.frame = CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1);
}

#pragma mark InitProperty

-(CALayer*)toplayer
{
    if (_toplayer == nil) {
        _toplayer = [CALayer layer];
        _toplayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        [self.layer addSublayer:_toplayer];
    }
    return _toplayer;
}

-(CALayer*)bottomlayer
{
    if (_bottomlayer == nil) {
        _bottomlayer = [CALayer layer];
        _bottomlayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        [self.layer addSublayer:_bottomlayer];
    }
    return _bottomlayer;
}

-(UITextView *)textView
{
    if (_textView == nil) {
        _textView = [UITextView new];
        _textView.delegate = self;
        _textView.layer.borderWidth = 1;
        _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _textView.layer.cornerRadius = 5;
        _textView.font = SYS_FONT_WITH_SIZE(14);
        [self addSubview:_textView];
    }
    return _textView;
}

-(UILabel *)placeHolder
{
    if (!_placeHolder) {
        _placeHolder = [UILabel new];
        _placeHolder.text = @"请输入内容";
        _placeHolder.textColor = [UIColor lightGrayColor];
        _placeHolder.font = self.textView.font;
        [self addSubview:_placeHolder];
        
    }
    return _placeHolder;
}

-(UIButton *)sendBtn
{
    if (!_sendBtn) {
        _sendBtn = [UIButton new];
        [_sendBtn setTitle:@"发送" forState:UIControlStateNormal];
        [_sendBtn setBackgroundColor:TOP_GREEN];
        [_sendBtn addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
        _sendBtn.layer.cornerRadius = 5;
        [self addSubview:_sendBtn];
        
    }
    return _sendBtn;
}

#pragma mark fun

-(void)initView
{
    
    self.backgroundColor = [UIColor lightTextColor];
    
    [self.textView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(10, 10, 10, 80));
    }];
    
    [self.placeHolder makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.textView).offset(5);
        make.top.equalTo(self.textView).offset(5);
    }];
    
    [self.sendBtn makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(-10);
        make.top.equalTo(self.textView.top);
        make.size.equalTo(CGSizeMake(60, 30));
    }];
    
}

#pragma mark selector

-(void)send:(UIButton *)btn
{
    NSString *str = self.textView.text;
    
    self.textView.text = @"";
    [self textViewDidChange:self.textView];
    
    if (str.length != 0) {
        
        if (self.inputdelegate != nil && [self.inputdelegate respondsToSelector:@selector(sendBtnClickedWithText:)]) {
            [self.inputdelegate sendBtnClickedWithText:str];
        }
    }
    [self endEditing:YES];
}

#pragma mark delegate

-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        self.placeHolder.text = @"请输入内容";
    }
    else
    {
        self.placeHolder.text = @"";
    }
    
    CGRect tmpRect = self.frame;
    if (orignH == 0) {
        CGRect textViewRect = self.textView.frame;
        orignH = textViewRect.size.height;
        orignFrame = self.frame;
    }
    
    
    CGRect frame = [self.textView.text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-90, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.textView.font} context:nil];
    CGSize size = frame.size;

    if (size.height > orignH) {
        if ((size.height-lastHight) != 0) {
            tmpRect.size.height += (size.height-lastHight);
            tmpRect.origin.y -= (size.height-lastHight);
            self.frame = tmpRect;
        }
    }
    else
    {
        self.frame = orignFrame;
    }
    lastHight = size.height;
    
}

@end
