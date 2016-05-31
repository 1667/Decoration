//
//  Header.h
//  PropertyManager
//
//  Created by 无线盈 on 15/8/3.
//  Copyright (c) 2015年 wuxianying. All rights reserved.
//

#ifndef PropertyManager_Header_h
#define PropertyManager_Header_h

#define COLOR(r,g,b)            [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
#define COLOR_A(r,g,b,a)        [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define WHITE_COLOR             [UIColor whiteColor]

#define LIGHT_LIGHT_GRAY        COLOR(233,233,233)

#define LIGHT_GRAY              COLOR(72,72,72)

#define LAYER_LIGHT_GRAY              COLOR(188,188,188)

#define DARK_GRAY               COLOR(153,153,153)
#define TOP_GREEN                COLOR(133,192,6)
#define COLOR_246               COLOR(246,246,246)
#define COLOR_51               COLOR(51,51,51)
#define COLOR_105               COLOR(105,105,105)

#define NEW_BLUE                COLOR(22,96,192)
#define TOP_BLACK                COLOR(52,57,71)
#define REGISTER_COLOR           COLOR(28, 115, 202)

#define BTN_BACK_CLICKED        ([Utils createImageWithColor:[UIColor colorWithRed:0/255.0 green:142./255.0 blue:210./255.0 alpha:1]])
#define SCREEN_WIDTH            ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT            ([UIScreen mainScreen].bounds.size.height)
#define STATUS_HEIGHT           ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define NAV_HEIGHT(vc)          (vc.navigationController.navigationBar.frame.size.height)
#define NAV_STATUS_HEIGHT(vc)   (STATUS_HEIGHT+NAV_HEIGHT(vc))
#define VC_WIDTH(vc)            (vc.view.frame.size.width)

#define SYS_FONT_WITH_SIZE(s)   [UIFont systemFontOfSize:s]

#define NOTIFICATION_GET_LOCATION            @"getLocation"
#define NOTIFICATION_POP_WIN_LINK            @"popWinLink"
#define NOTIFICATION_REGISTER_OK             @"registeSuccess"
#define NOTIFICATION_LOG_IN_SUCCESS          @"loginSuccess"
#define NOTIFICATION_INIT_HOMEVIEW           @"initHomeView"
#define NOTIFICATION_TO_VISTOR               @"toVistor"
#define NOTIFICATION_GET_LOCATION_REG        @"getLocationReg"
#define NOTIFICATION_DELEATE_FLEA            @"deleateFlea"

#define CURRENT_SYSTEM_VER                 ([[[UIDevice currentDevice] systemVersion] floatValue])

#define IS_IPhone6plus (736 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)

#define LOCAL_DATA_FLAGES                   @"showStart"

#endif
