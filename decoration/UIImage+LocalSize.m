//
//  UIImage+LocalSize.m
//  TTTT
//
//  Created by 无线盈 on 15/10/15.
//  Copyright © 2015年 wuxianying. All rights reserved.
//

#import "UIImage+LocalSize.h"

@implementation UIImage (LocalSize)


-(CGSize)localImageSizeWithWidth:(CGFloat)width
{
    CGFloat scale = width/self.size.width;
    CGFloat h = self.size.height*scale;
    return CGSizeMake(width, h);
}

-(CGSize)localImageSizeWithHeight:(CGFloat)height
{
    CGFloat scale = height/self.size.height;
    CGFloat w = self.size.width*scale;
    return CGSizeMake(w, height);
    
}

@end
