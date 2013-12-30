//
//  sanguocaiAppDelegate.h
//  sanguocai
//
//  Created by Li Wen Jun on 13-11-18.
//  Copyright (c) 2013年 Li Wen Jun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeviceViewController.h"
#import "WXApi.h"
#import "MobClick.h"

@interface sanguocaiAppDelegate : UIResponder <UIApplicationDelegate,WXApiDelegate>
{
    DeviceViewController *main;
    enum WXScene _scene;
}

@property (strong, nonatomic) UIWindow *window;

@end
