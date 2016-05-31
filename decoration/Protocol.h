//
//  Protocol.h
//  PropertyManager
//
//  Created by 无线盈 on 15/8/31.
//  Copyright (c) 2015年 wuxianying. All rights reserved.
//

#ifndef PropertyManager_Protocol_h
#define PropertyManager_Protocol_h

@protocol RefreashFleaViewDelegate <NSObject>

-(void)setNeedRefreash:(BOOL)bRefreash;

@end

@protocol RefreashMyFleaViewDelegate <NSObject>

-(void)setMyFleaNeedRefreash:(BOOL)bRefreash;

@end

#endif
