//
//  ImageViewViewController.h
//  TTT
//
//  Created by innke on 15/8/27.
//  Copyright (c) 2015年 wuxianying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewViewController : UIViewController
{
    
}

@property (nonatomic,assign)NSInteger   startIndex;

-(void)setImageArray:(NSMutableArray *)array;
-(void)setImageArray:(NSMutableArray *)array withAnimateFrame:(CGRect)frame;
@end
