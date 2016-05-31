//
//  CommentButton.m
//  decoration
//
//  Created by innke on 15/11/29.
//  Copyright © 2015年 find. All rights reserved.
//

#import "CommentButton.h"

@implementation CommentButton

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
   
        float width = self.frame.size.width * 0.5;
        float oriX = self.frame.size.width * 0.5;
        return CGRectMake(oriX+3, 0, width, self.frame.size.height);
   
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    
        float width = self.frame.size.height*0.7;
        return CGRectMake(self.frame.size.width/2-width, self.frame.size.height*0.15, width, width);
    
    
}

@end
