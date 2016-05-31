//
//  Utils.h
//  PropertyManager
//
//  Created by 无线盈 on 15/8/4.
//  Copyright (c) 2015年 wuxianying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "Tool.h"
#import <MBProgressHUD.h>

#define PASS_VALUES                 @"passvalue"
#define NIL_VALUES                  @"nil"
#define HomeHeadBottomH                   SCREEN_HEIGHT*0.1
#define HeadViewH                   SCREEN_HEIGHT*0.3
#define ForumHeadViewH                   SCREEN_HEIGHT*0.3*0.7
#define kDockViewHeight             50
#define PersonHeaderH               SCREEN_HEIGHT*0.40


#define PHONE_SHEET_TAG             133

@protocol UIViewControllerPassValueDelegate <NSObject>

-(void)passValueWithDic:(NSDictionary *)dic;

@end


@interface Utils : NSObject

+(Utils *)instance;

-(UIView *)createTitleViewWithTitle:(NSString *)title;
-(UIBarButtonItem*)createBackItemWithSelecter:(SEL)selecter target:(id)target;
-(UIBarButtonItem*)createRightItemWithIcon:(NSString*)iconName  selecter:(SEL)selecter  target:(id)target;
-(UIBarButtonItem*)createRightItem:(SEL)selecter  target:(id)target Str:(NSString *)str;


+(UIImage *) createImageWithColor: (UIColor *) color;

+ (void)showAllTextDialog:(MBProgressHUD *)HUD View:(UIView *)view Str:(NSString *)str;
+ (void)showAllTextDialog:(MBProgressHUD *)HUD View:(UIView *)view Str:(NSString *)str Offset:(CGFloat)offset;
+(NSString *)getweekDay:(NSInteger)i;
+(NSString *)getzhouDay:(NSInteger)i;
+(NSDateComponents *)getDataComponents;
+(void)showTextDialog:(MBProgressHUD *)HUD View:(UIView *)view Str:(NSString *)str;
+(NSDictionary*)getObjectData:(id)obj;
+(void)print:(id)obj;
+(NSData*)getJSON:(id)obj options:(NSJSONWritingOptions)options error:(NSError**)error;
+(id)getObjectInternal:(id)obj;

+(NSString *)timeToDate:(NSString *)time;
+(NSString *)timeToDateOnlyHMS:(NSString *)time;
+(NSString *)timeToDateOnlyYMD:(NSString *)time;


+(BOOL)reMoveLocal;

+(BOOL)isMobileNumber:(NSString *)mobileNum;

+(CGSize)sizeWithString:(NSString *)string font:(UIFont *)font Size:(CGSize)size;

+(UILabel *)showPlaceHolder:(NSString *)str Frame:(CGRect)frame;

+ (CGRect)relativeFrameForScreenWithView:(UIView *)v;

+(void)setImageViewWithURL:(NSString *)url ImageView:(UIImageView*)view;


+(UIView *)createLineViewWithShadow:(BOOL)b Width:(CGFloat)w;
+(CALayer *)getLineLayer;
+(void)WriteLog:(id)data WithString:(NSString *)str;


@end
