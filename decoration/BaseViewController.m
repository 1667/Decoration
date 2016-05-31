//
//  BaseViewController.m
//  TTTT
//
//  Created by 无线盈 on 15/9/10.
//  Copyright (c) 2015年 无线盈. All rights reserved.
//

#import "BaseViewController.h"
#import "UIScrollView+WithTouch.h"
#import "UIImage+Image.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
{
    UILabel *titleLabel;
    NSString    *phoneNum;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardEditDidShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardEditDidHide:) name:UIKeyboardWillHideNotification object:nil];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent=YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:COLOR_A(133, 192, 6, 1)] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.titleView = [self createTitleView];
    self.navigationItem.leftBarButtonItem = [self createLeftItemWithSelecter:@selector(left:) target:self];
    self.navigationItem.rightBarButtonItem = [self createRightItemWithSelecter:@selector(right:) target:self];
    
    _selfView = self.view;
    _selfViewWidth = _selfView.frame.size.width;
    _selfViewHieght = _selfView.frame.size.height;
    _selfFrame = self.view.frame;
    _bEdit = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)setTitleText:(NSString *)text
{
    [titleLabel setText:text];
}

-(UIView *)createTitleView
{
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:19];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    return titleLabel;
}

-(UIBarButtonItem*)createLeftItemWithSelecter:(SEL)selecter target:(id)target
{
    _leftBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _leftBtn.frame = CGRectMake(0, 0, 15, 20);
   // [_leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_leftBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    _leftBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    _leftBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [_leftBtn addTarget:target action:selecter forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:_leftBtn];
}

-(UIBarButtonItem*)createRightItemWithSelecter:(SEL)selecter target:(id)target
{
    _rightBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _rightBtn.frame = CGRectMake(0, 0, 60, 20);
    [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //_rightBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    _rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_rightBtn addTarget:target action:selecter forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
}

-(void)left:(id)sender
{
    if (_bEdit) {
        [self showAlterViewWithTag:0 Tiltle:@"提示" message:@"确定要退出此次编辑吗" canelBtnTitle:@"取消" otherBtnArr:@[@"确定"]];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)right:(id)sender
{
    
}

-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        [self.view addSubview:_scrollView];
        
    }
    return _scrollView;
}

-(UIView *)scrollContentView
{
    if (!_scrollContentView) {
        _scrollContentView = [UIView new];
        [self.scrollView addSubview:_scrollContentView];
        
    }
    return _scrollContentView;
}

-(void)showActionSheetWithTitle:(NSString *)str cancelBtnTitle:(NSString *)cancelTitle btnArray:(NSMutableArray *)arr tag:(NSInteger)tag
{
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:str delegate:self cancelButtonTitle:cancelTitle destructiveButtonTitle:nil otherButtonTitles:nil];
    sheet.tag = tag;
    for (NSString *str in arr) {
        [sheet addButtonWithTitle:str];
    }
    
    [sheet showInView:self.view];
}

-(void)showSelectPhotoActionSheet
{
    
    UIActionSheet  *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册", nil];
    [sheet showInView:self.view];
}

-(void)showAlterViewWithTag:(NSInteger)tag Tiltle:(NSString *)title message:(NSString *)mess canelBtnTitle:(NSString *)cancel otherBtnArr:(NSMutableArray *)arr
{
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:title message:mess delegate:self cancelButtonTitle:cancel otherButtonTitles:nil];
    for (NSString *str in arr) {
        [alter addButtonWithTitle:str];
    }
    alter.tag = tag;
    [alter show];
    
    
}

-(void)keyboardEditDidHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(0.0f, 0, self.view.frame.size.width, self.view.frame.size.height);
        
    }];
}

-(void)keyboardEditDidShow:(NSNotification *)notification
{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_3_2
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
#endif
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_3_2
        NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
#else
        NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey];
#endif
        
        CGRect keyboardBounds;
        [keyboardBoundsValue getValue:&keyboardBounds];
        keyboardBounds = [self.view convertRect:keyboardBounds toView:self.view];
        CGRect frame;
        CGRect line;
        if (_currentTF != nil || _currentTV != nil) {
            
            if (_currentTF == nil) {
                
                if (_currentTV != nil) {
                    
                    frame = _currentTV.frame;
                    line = [_currentTV caretRectForPosition: _currentTV.selectedTextRange.start];
                }
                
            }
            else
            {
                
                frame =  _currentTF.frame;
                line = [_currentTF caretRectForPosition: _currentTF.selectedTextRange.start];
                
            }
            if (frame.origin.y > keyboardBounds.origin.y && frame.origin.y < self.view.frame.size.height) {
                int offset = keyboardBounds.origin.y - frame.origin.y-10-line.origin.y-line.size.height;
                [UIView animateWithDuration:0.3 animations:^{
                    self.view.frame = CGRectMake(0.0f, offset, self.view.frame.size.width, self.view.frame.size.height);
                    
                }];
            }
            _keyboardHieght = keyboardBounds.origin.y;
            
        }
        
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    if (![touch.view isKindOfClass: [UITextField class]] || ![touch.view isKindOfClass: [UITextView class]]) {
        [self.view endEditing:YES];
    }
}

#pragma mark textFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    _bEdit = YES;
    self.currentTF = textField;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

#pragma mark textViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){
        [self.view endEditing:YES];
        return NO;
    }
    
    return YES;
}

-(void)textViewDidChange:(UITextView *)textView
{
    _bEdit = YES;
    CGRect line = [textView caretRectForPosition:
                   textView.selectedTextRange.start];
    CGRect frame = textView.frame;
    //frame = [textView convertRect:frame toView:self.view];
    CGFloat overflow = 0;
    if (_keyboardHieght != 0) {
        overflow = frame.origin.y + line.origin.y+ line.size.height - _keyboardHieght+7;
    }
    if ( overflow > 0 ) {

        CGPoint offset = textView.contentOffset;
        offset.y += overflow + 7; // leave 7 pixels margin
        [UIView animateWithDuration:.2 animations:^{
            self.view.frame = CGRectMake(0.0f, -overflow, self.view.frame.size.width, self.view.frame.size.height);
        }];
    }
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    _currentTV = textView;
    return YES;
}


- (void)textViewDidEndEditing:(UITextView *)textView
{
    
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

#pragma mark actionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (actionSheet.tag == PHONE_SHEET_TAG) {
        switch (buttonIndex)
        {
            case 0:
            {
                
                
            }
                
                break;
        }
    }
    else
    {
        switch (buttonIndex)
        {
            case 0:  //打开照相机拍照
                [self takePhoto];
                break;
                
            case 1:  //打开本地相册
                [self LocalPhoto];
                break;
        }
    }
}

-(void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        picker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:picker animated:YES completion:nil];
    }else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}

//打开本地相册
-(void)LocalPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    picker.delegate = self;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"您取消了选择图片");
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark fun
-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSInteger tag = alertView.tag;
    switch (tag) {
        case 0:
        {
            switch (buttonIndex) {
                case 1:
                {
                    [self.navigationController popViewControllerAnimated:YES];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
            
        default:
            break;
    }
}

- (BOOL)openURL:(NSURL *)url
{
    BOOL safariCompatible = [url.scheme isEqualToString:@"http"] || [url.scheme isEqualToString:@"https"];
    if (safariCompatible && [[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
        return YES;
    } else {
        return NO;
    }
}
-(void)showCallSheet:(NSString *)str
{
    phoneNum = str;
    
//    if ([ServerManager instance].bVistor) {
//        
//        UIActionSheet  *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"请注册并验证通过后拨打", nil];
//        sheet.destructiveButtonIndex = 0;
//        sheet.tag = PHONE_SHEET_TAG;
//        [sheet showInView:self.view];
//    }
//    else
//    {
//        NSString *t = [NSString stringWithFormat:@"拨打 %@",str];
//        UIActionSheet  *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:t, nil];
//        sheet.tag = PHONE_SHEET_TAG;
//        [sheet showInView:self.view];
//    }
    
    
}

- (BOOL)openTel:(NSString *)tel
{
    NSString *telString = [NSString stringWithFormat:@"tel://%@",tel];
    return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telString]];
}

@end
