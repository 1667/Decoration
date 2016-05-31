//
//  CHButton.h
//  CarCleaner
//
//  Created by innke on 14/12/29.
//  Copyright (c) 2014年 innke. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    TitleOnUp,
    TitleOnDown,
    TitleOnLeft,
    TitltOnRight,
    
}ButtonStyle;

@interface CHButton : UIButton

@property (nonatomic, assign) ButtonStyle  style;
@property (nonatomic, assign) float        titlePersent;

-(id)initWithStyle:(ButtonStyle)style  titlePersent:(float)titlePersent;
+(CHButton*)buttonWithStyle:(ButtonStyle)style  titlePersent:(float)titlePersent;

@end
