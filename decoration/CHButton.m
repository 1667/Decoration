//
//  CHButton.m
//  CarCleaner
//
//  Created by innke on 14/12/29.
//  Copyright (c) 2014年 innke. All rights reserved.
//


#import "CHButton.h"

@implementation CHButton
{
//    ButtonStyle  _style;
//    float        _titlePersent;
}


-(id)initWithStyle:(ButtonStyle)style  titlePersent:(float)titlePersent
{
    self = [super init];
    if (self)
    {
        _style = style;
        _titlePersent = titlePersent;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    
    return self;
}

+(CHButton*)buttonWithStyle:(ButtonStyle)style  titlePersent:(float)titlePersent
{
    CHButton *btn = [super buttonWithType:UIButtonTypeCustom];
    if (btn)
    {
        btn.style = style;
        btn.titlePersent = titlePersent;
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    
    return btn;
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}


-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    if (_style == TitleOnUp)
    {
        float height = self.frame.size.height * _titlePersent;
        return CGRectMake(0, 0, self.frame.size.width, height);
    }
    else if (_style == TitleOnDown)
    {
        float oriY = self.frame.size.height * (1 - _titlePersent);
        float height = self.frame.size.height * _titlePersent;
        return CGRectMake(0, oriY, self.frame.size.width, height);
    }
    else if (_style == TitleOnLeft)
    {
        float width = self.frame.size.width * _titlePersent;
        return CGRectMake(0, 0, width, self.frame.size.height);
    }
    else
    {
        float width = self.frame.size.width * _titlePersent;
        float oriX = self.frame.size.width * (1 - _titlePersent);
        return CGRectMake(oriX, 0, width, self.frame.size.height);
    }
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    if (_style == TitleOnUp)
    {
        float height = self.frame.size.height *  (1 - _titlePersent);
        float oriY = self.frame.size.height * _titlePersent;
        return CGRectMake(0, oriY, self.frame.size.width, height);
    }
    else if (_style == TitleOnDown)
    {
        float height = self.frame.size.height * (1 - _titlePersent);
        return CGRectMake(0, 0, self.frame.size.width, height);
    }
    else if (_style == TitleOnLeft)
    {
        float width = self.frame.size.width * (1 - _titlePersent);
        float oriX = self.frame.size.width *  _titlePersent;
        return CGRectMake(oriX, 0, width, self.frame.size.height);
    }
    else
    {
        float width = self.frame.size.width * (1 - _titlePersent);
        return CGRectMake(0, 0, width, self.frame.size.height);
    }
    
}



@end
