//
//  Utils.m
//  PropertyManager
//
//  Created by 无线盈 on 15/8/4.
//  Copyright (c) 2015年 wuxianying. All rights reserved.
//


#import "Utils.h"
#import "Tool.h"
#import <objc/runtime.h>

#import <UIImageView+WebCache.h>

#define LEIDIAN             @"leidian"
#define QINGTIAN            @"qingtian"
#define WUTIAN              @"wutian"
#define YUTIAN              @"yutian"
#define XUETIAN              @"xuetian"
#define DUOYUN              @"duoyun"
#define SHACHEN             @"shachen"
#define YIN                 @"yin"
#define WUMAI               @"wumai"

@implementation Utils


+(Utils*)instance
{
    static dispatch_once_t onceToken;
    static Utils *util;
    
    dispatch_once(&onceToken,^{
        util = [[Utils alloc] init];
    });
    return  util;
}

-(UIView *)createTitleViewWithTitle:(NSString *)title
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:19];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    return titleLabel;
    
}

-(UIBarButtonItem*)createBackItemWithSelecter:(SEL)selecter target:(id)target
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backBtn.frame = CGRectMake(-10, 0, 25, 25);
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[backBtn setBackgroundImage:[UIImage imageNamed:@"backN.png"] forState:UIControlStateNormal];
    CALayer *layer = [CALayer layer];
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"backN"].CGImage);
    layer.frame = CGRectMake(-10, 0, 25, 25);
    [backBtn.layer addSublayer:layer];
    backBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    backBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [backBtn addTarget:target action:selecter forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}


-(UIBarButtonItem*)createRightItemWithIcon:(NSString*)iconName  selecter:(SEL)selecter  target:(id)target
{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 40, 20);
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    rightBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [rightBtn addTarget:target action:selecter forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}


-(UIBarButtonItem*)createRightItem:(SEL)selecter  target:(id)target Str:(NSString *)str
{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 40, 20);
    [rightBtn setTitle:str forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    rightBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [rightBtn addTarget:target action:selecter forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

+(UIImage *) createImageWithColor: (UIColor *) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (void)showAllTextDialog:(MBProgressHUD *)HUD View:(UIView *)view Str:(NSString *)str {
    
    [view addSubview:HUD];
    HUD.labelText = str;
    HUD.mode = MBProgressHUDModeText;
    
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(2);
    } completionBlock:^{
        [HUD removeFromSuperview];
    }];
}
+ (void)showAllTextDialog:(MBProgressHUD *)HUD View:(UIView *)view Str:(NSString *)str Offset:(CGFloat)offset{
    
    [view addSubview:HUD];
    HUD.labelText = str;
    HUD.mode = MBProgressHUDModeText;
    
    HUD.yOffset = offset;
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(2);
    } completionBlock:^{
        [HUD removeFromSuperview];
    }];
}

+(void)showTextDialog:(MBProgressHUD *)HUD View:(UIView *)view Str:(NSString *)str
{
    
    [view addSubview:HUD];
    HUD.dimBackground = YES;
    HUD.labelText = str;
    [HUD show:YES];
    
}

+(NSString *)getweekDay:(NSInteger)i
{
    switch (i) {
        case 1:
            return @"星期天";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
            
        default:
            break;
    }
    return  @"";
}
+(NSString *)getzhouDay:(NSInteger)i
{
    switch (i) {
        case 1:
            return @"周天";
            break;
        case 2:
            return @"周一";
            break;
        case 3:
            return @"周二";
            break;
        case 4:
            return @"周三";
            break;
        case 5:
            return @"周四";
            break;
        case 6:
            return @"周五";
            break;
        case 7:
            return @"周六";
            break;
            
        default:
            break;
    }
    return  @"";
}
+(NSDateComponents *)getDataComponents
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =  NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    return comps;
}


+(NSDictionary*)getObjectData:(id)obj

{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    unsigned int propsCount;
    
    objc_property_t *props = class_copyPropertyList([obj class], &propsCount);
    
    for(int i = 0;i < propsCount; i++)
        
    {
        objc_property_t prop = props[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        id value = [obj valueForKey:propName];
        
        if(value  == nil)
        {
            value = [NSNull null];
        }
        else
        {
            value = [self getObjectInternal:value];
        }
        [dic setObject:value forKey:propName];
        
    }
    return dic;
    
}



+(void)print:(id)obj

{
    
    NSLog(@"%@",[self getObjectData:obj]);
    
}
+(NSData*)getJSON:(id)obj options:(NSJSONWritingOptions)options error:(NSError**)error

{
    
    return [NSJSONSerialization dataWithJSONObject:[self getObjectData:obj] options:options error:error];
    
}

+(id)getObjectInternal:(id)obj
{
    
    if([obj isKindOfClass:[NSString class]] ||  [obj isKindOfClass:[NSNumber class]] ||  [obj isKindOfClass:[NSNull class]])
    {
        return obj;
        
    }
    if([obj isKindOfClass:[NSArray class]])
        
    {
        
        NSArray *objarr = obj;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        
        for(int i = 0;i < objarr.count; i++)
        {
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return  arr;
        
    }
    if([obj isKindOfClass:[NSDictionary class]])
        
    {
        
        NSDictionary  *objdic = obj;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        
        for(NSString *key in objdic.allKeys)
        {
            
            [dic  setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
            
        }
        return  dic;
    }
    return [self getObjectData:obj];
}

+(NSString *)timeToDate:(NSString *)time
{
    NSString * timeStampString =time;
    NSTimeInterval _interval=[timeStampString doubleValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *_formatter = [[NSDateFormatter alloc] init];
    [_formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return  [_formatter stringFromDate:date];
}

+(NSString *)timeToDateOnlyHMS:(NSString *)time
{
    NSString * timeStampString =time;
    NSTimeInterval _interval=[timeStampString doubleValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *_formatter = [[NSDateFormatter alloc] init];
    [_formatter setDateFormat:@"HH:mm:ss"];
    return  [_formatter stringFromDate:date];
}

+(NSString *)timeToDateOnlyYMD:(NSString *)time
{
    NSString * timeStampString =time;
    NSTimeInterval _interval=[timeStampString doubleValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *_formatter = [[NSDateFormatter alloc] init];
    [_formatter setDateFormat:@"yyyy/MM/dd"];
    return  [_formatter stringFromDate:date];
}

+(CGSize)sizeWithString:(NSString *)string font:(UIFont *)font Size:(CGSize)size
{
    CGRect rect = [string boundingRectWithSize:size//限制最大的宽度和高度
                                       options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  |NSStringDrawingUsesLineFragmentOrigin//采用换行模式
                                    attributes:@{NSFontAttributeName: font}//传人的字体字典
                                       context:nil];
    
    return rect.size;
}

+(UILabel *)showPlaceHolder:(NSString *)str Frame:(CGRect)frame
{
    UILabel *tmp = [[UILabel alloc] initWithFrame:frame];
    [tmp setText:str];
    [tmp setTextColor:LIGHT_GRAY];
    [tmp setFont:SYS_FONT_WITH_SIZE(16)];
    [tmp setTextAlignment:NSTextAlignmentCenter];
    return tmp;
}
+ (CGRect)relativeFrameForScreenWithView:(UIView *)v
{
    BOOL iOS7 = [[[UIDevice currentDevice] systemVersion] floatValue] >= 7;
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if (!iOS7) {
        screenHeight -= 20;
    }
    UIView *view = v;
    CGFloat x = .0;
    CGFloat y = .0;
    while (view.frame.size.width != 320 || view.frame.size.height != screenHeight) {
        x += view.frame.origin.x;
        y += view.frame.origin.y;
        view = view.superview;
        if ([view isKindOfClass:[UIScrollView class]]) {
            x -= ((UIScrollView *) view).contentOffset.x;
            y -= ((UIScrollView *) view).contentOffset.y;
        }
    }
    return CGRectMake(x, y, v.frame.size.width, v.frame.size.height);
}

+(void)setImageViewWithURL:(NSString *)url ImageView:(UIImageView*)view
{
    __block UIActivityIndicatorView *activityIndicator;
    [view sd_setImageWithURL:[[NSURL alloc] initWithString:url] placeholderImage:[UIImage imageNamed:@"picplaceholder"] options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!activityIndicator)
            {
                activityIndicator = [UIActivityIndicatorView.alloc initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
                [view addSubview:activityIndicator];
                activityIndicator.center = view.center;
                [activityIndicator startAnimating];
            }
        });
        
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [activityIndicator removeFromSuperview];
            activityIndicator = nil;
        });
        
        
    }];
}

+(UIView *)createLineViewWithShadow:(BOOL)b Width:(CGFloat)w
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, 1)];
    line.backgroundColor = LIGHT_LIGHT_GRAY;
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, 10)];
    if (b) {
        
        line.layer.shadowOffset = CGSizeMake(0, 1);
        line.layer.shadowOpacity = 0.3;
        [v addSubview:line];
        UIView *backView = [UIView new];
        backView.backgroundColor = COLOR(246, 246, 246);
        [v addSubview:backView];
        [backView makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(v);
            make.top.equalTo(line.bottom);
            make.height.equalTo(10);
        }];
        
        
    }
    if (b) {
        return v;
    }
    return line;
}

+(CALayer *)getLineLayer
{
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = LIGHT_LIGHT_GRAY.CGColor;
    return layer;
}

+(void)WriteLog:(id)data WithString:(NSString *)str
{
    NSLog(@"%@",[NSString stringWithFormat:@"%@ %@",str,data]);
}

@end
