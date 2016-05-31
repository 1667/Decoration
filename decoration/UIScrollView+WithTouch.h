//
//  UIScrollView+WithTouch.h
//  PropertyManager
//
//  Created by 无线盈 on 15/8/28.
//  Copyright (c) 2015年 wuxianying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (WithTouch)

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@end
