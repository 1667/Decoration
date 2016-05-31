//
//  BottomInputView.h
//  TestProject
//
//  Created by wxy on 15/11/27.
//  Copyright © 2015年 wxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InputViewDelegate <NSObject>

-(void)sendBtnClickedWithText:(NSString *)str;

@end

@interface BottomInputView : UIView


@property(nonatomic,strong)UITextView       *textView;
@property (nonatomic,strong) id<InputViewDelegate> inputdelegate;

@end
