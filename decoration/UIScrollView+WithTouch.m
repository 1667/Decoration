//
//  UIScrollView+WithTouch.m
//  PropertyManager
//
//  Created by 无线盈 on 15/8/28.
//  Copyright (c) 2015年 wuxianying. All rights reserved.
//

#import "UIScrollView+WithTouch.h"

@implementation UIScrollView (WithTouch)

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesEnded:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}

@end
