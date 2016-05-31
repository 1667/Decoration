//
//  BaseViewController.h
//  TTTT
//
//  Created by 无线盈 on 15/9/10.
//  Copyright (c) 2015年 无线盈. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"

@interface BaseViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate>

@property (nonatomic,strong) UIView             *selfView;

@property (nonatomic,strong) UIView             *titleView;
@property (nonatomic,strong) UIButton           *leftBtn;
@property (nonatomic,strong) UIButton           *rightBtn;

@property (nonatomic,strong) UIScrollView       *scrollView;
@property (nonatomic,strong) UIView             *scrollContentView;
@property (nonatomic,strong) UIView             *scrollLastView;

@property (nonatomic,strong) UITextView         *currentTV;
@property (nonatomic,strong) UITextField        *currentTF;

@property (nonatomic,assign) CGFloat            keyboardHieght;
@property (nonatomic,assign) CGFloat            selfViewWidth;
@property (nonatomic,assign) CGFloat            selfViewHieght;
@property (nonatomic,assign) CGRect             selfFrame;



@property (nonatomic,assign) BOOL               bEdit;

-(void)setTitleText:(NSString *)text;

-(void)right:(id)sender;
-(void)left:(id)sender;

-(void)textFieldDidBeginEditing:(UITextField *)textField;

-(void)showActionSheetWithTitle:(NSString *)str cancelBtnTitle:(NSString *)cancelTitle btnArray:(NSMutableArray *)arr tag:(NSInteger)tag;
-(void)showSelectPhotoActionSheet;

-(void)showAlterViewWithTag:(NSInteger)tag Tiltle:(NSString *)title message:(NSString *)mess canelBtnTitle:(NSString *)cancel otherBtnArr:(NSMutableArray *)arr;
- (BOOL)openURL:(NSURL *)url;
-(void)showCallSheet:(NSString *)str;


-(void)keyboardEditDidShow:(NSNotification *)notification;
-(void)keyboardEditDidHide:(NSNotification *)notification;

@end
