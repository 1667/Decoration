//
//  FreeReportViewController.m
//  decoration
//
//  Created by innke on 15/12/10.
//  Copyright © 2015年 find. All rights reserved.
//

#import "FreeReportViewController.h"
#import "FreeTitleView.h"

@interface FreeReportViewController ()

@property (nonatomic,strong) FreeTitleView *titleFree;
@property (nonatomic,strong) UITextField *tfName;
@property (nonatomic,strong) UITextField *tfPhone;
@property (nonatomic,strong) UITextField *tfProiver;
@property (nonatomic,strong) UITextField *tfCity;
@property (nonatomic,strong) UIButton    *btnSumbit;
@property (nonatomic,strong) UILabel     *lblMsg;


@end

@implementation FreeReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleText:@"免费验房"];
    
    self.navigationItem.rightBarButtonItem = [[Utils instance] createRightItemWithIcon:@"share" selecter:@selector(rightClicked:) target:self];
    
    [self initView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark initPro

-(FreeTitleView *)titleFree
{
    if (!_titleFree) {
        _titleFree = [FreeTitleView new];
        [self.scrollContentView addSubview:_titleFree];
    }
    return _titleFree;
}

-(UITextField *)tfName
{
    if (!_tfName) {
        _tfName = [self creatWTFWithPlaceHolder:@"请输入您的称呼"];
        [self.scrollContentView addSubview:_tfName];
    }
    return _tfName;
}

-(UITextField *)tfPhone
{
    if (!_tfPhone) {
        _tfPhone = [self creatWTFWithPlaceHolder:@"请输入您的电话"];
        [self.scrollContentView addSubview:_tfPhone];
    }
    return _tfPhone;
}

-(UITextField *)tfProiver
{
    if (!_tfProiver) {
        _tfProiver = [self creatBWTFWithPlaceHolder:@"省"];
        [self.scrollContentView addSubview:_tfProiver];
    }
    return _tfProiver;
}


-(UITextField *)tfCity
{
    if (!_tfCity) {
        _tfCity = [self creatBWTFWithPlaceHolder:@"市"];
        [self.scrollContentView addSubview:_tfCity];
    }
    return _tfCity;
}

-(UIButton *)btnSumbit
{
    if (!_btnSumbit) {
        _btnSumbit = [UIButton new];
        [_btnSumbit setBackgroundColor:TOP_GREEN];
        [_btnSumbit setTitle:@"点击申请" forState:UIControlStateNormal];
        _btnSumbit.layer.masksToBounds = YES;
        _btnSumbit.layer.cornerRadius = 3;
        [_btnSumbit setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
        [self.scrollContentView addSubview:_btnSumbit];
    }
    return _btnSumbit;
}

-(UILabel *)lblMsg
{
    if (!_lblMsg) {
        _lblMsg = [UILabel new];
        _lblMsg.numberOfLines = 0;
        _lblMsg.preferredMaxLayoutWidth = SCREEN_WIDTH-20;
        _lblMsg.font = SYS_FONT_WITH_SIZE(12);
        _lblMsg.text = @"*您的信息将被严格保密，提交资料后，我们将在24小时之内联系您，电此查看常见申请问题";
        [self.scrollContentView addSubview:_lblMsg];
    }
    return _lblMsg;
}

#pragma makr fun

-(void)initView
{
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(NAV_STATUS_HEIGHT(self), 0, 0, 0));
    }];
    
    [self.scrollContentView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    self.titleFree.bigLbl.text = @"免费验房";
    
    NSMutableAttributedString *msStr = [[NSMutableAttributedString alloc] initWithString:@"今日已有888人申请"];
    [msStr addAttributes:@{NSForegroundColorAttributeName:TOP_GREEN} range:NSMakeRange(4, 3)];
    self.titleFree.smallLbl.attributedText = msStr;
    
    [self.titleFree makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.scrollContentView);
    }];
    
    [self.tfName makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleFree.bottom).offset(10);
        make.left.equalTo(self.view.left).offset(10);
        make.rightMargin.equalTo(-10);
        make.height.equalTo(40);
    }];
    
    [self.tfPhone makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tfName.bottom).offset(10);
        make.left.equalTo(self.view.left).offset(10);
        make.rightMargin.equalTo(-10);
        make.height.equalTo(40);
    }];
    
    [self.tfProiver makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tfPhone.bottom).offset(10);
        make.left.equalTo(self.view.left).offset(10);
        make.width.equalTo(SCREEN_WIDTH/2-15);
        make.height.equalTo(40);
    }];
    
    
    [self.tfCity makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tfPhone.bottom).offset(10);
        make.left.equalTo(self.tfProiver.right).offset(10);
        make.width.equalTo(SCREEN_WIDTH/2-15);
        make.height.equalTo(40);
    }];
    
    [self.btnSumbit makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tfCity.bottom).offset(10);
        make.left.equalTo(self.tfPhone);
        make.rightMargin.equalTo(-10);
        make.height.equalTo(40);
    }];
    
    [self.lblMsg makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(self.btnSumbit);
        make.top.equalTo(self.btnSumbit.bottom).offset(10);
    }];
    
    self.scrollLastView = self.lblMsg;
    [self.scrollContentView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.scrollLastView);
    }];
    
}

-(UITextField *)creatWTFWithPlaceHolder:(NSString *)str
{
    UITextField * tf = [UITextField new];
//    tf.layer.masksToBounds = YES;
//    tf.layer.cornerRadius = 3;
//    tf.layer.borderColor = LIGHT_LIGHT_GRAY.CGColor;
//    tf.layer.borderWidth = 1;
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.placeholder = str;
    return tf;
}

-(UITextField *)creatBWTFWithPlaceHolder:(NSString *)str
{
    UITextField * tf = [UITextField new];
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.placeholder = str;
    
    UIButton *btn = [UIButton new];
    [btn setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    tf.rightView = btn;
    tf.rightViewMode = UITextFieldViewModeAlways;
    
    return tf;
}

#pragma makr selector

-(void)rightClicked:(UIButton *)btn
{
    
}



@end
