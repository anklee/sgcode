//
//  DeviceViewController.h
//  TabNav
//
//  Created by user on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "sqlite3.h"
#import "WXApiObject.h"
#import "WXApi.h"
#import "UMUFPBannerView.h"
#import "UMUFPHandleView.h"
#import "DescriptionViewController.h"
#import <GameKit/GameKit.h>
#import "MobClick.h"
#import "DescriptionMe.h"
#import "DescriptionHero.h"
#import "HeroViewController.h"

#define kFilename    @"sanguo.sqlite3"
@interface DeviceViewController : UIViewController <UIAccelerometerDelegate,UIAlertViewDelegate,GKPeerPickerControllerDelegate,GKSessionDelegate,UIActionSheetDelegate,UIGestureRecognizerDelegate>
{
    NSString *request1;
    NSString *request2;
    NSString *request3;
    NSString *request4;
    NSString *request5;
    NSString *request6;
    NSString *request7;
    
    NSString *answer01;
    NSString *answer02;
    NSString *answer03;
    NSString *answer04;
    NSString *answer05;
    NSString *answer06;
    NSString *answer07;
    
    NSString *sqlAnswer;
    NSString *key;
    int  guanka;
//    int jinyuanbao;
    NSDictionary *aswRequest;
    NSArray *tishiArry;
    IBOutlet UIImageView *image;
    
    UIButton *whichButton;
    NSArray *answerArry;
    NSArray *requestArry;
    NSArray *imageArry;
    enum WXScene _scene;
    NSString *returnCode;
    
    NSMutableArray *heroArry;
    
    GKSession *currentSession;
    IBOutlet UIButton *connect;
    IBOutlet UIButton *disconnect;
    IBOutlet UIButton *sendData;
    int heightFour;
}
@property (nonatomic, retain) UIButton *connect;
@property (nonatomic, retain) UIButton *disconnect;
@property (nonatomic, retain) UIButton *sendData;
@property (weak, nonatomic) IBOutlet UIButton *bt1;
@property (weak, nonatomic) IBOutlet UIButton *bt2;
@property (weak, nonatomic) IBOutlet UIButton *bt3;
@property (weak, nonatomic) IBOutlet UIButton *bt4;
@property (weak, nonatomic) IBOutlet UIButton *bt5;
@property (weak, nonatomic) IBOutlet UIButton *bt6;
@property (weak, nonatomic) IBOutlet UIButton *bt7;
@property (weak, nonatomic) IBOutlet UIButton *bt8;
@property (weak, nonatomic) IBOutlet UILabel *guank;
@property (weak, nonatomic) IBOutlet UILabel *yuanbao;
@property (weak, nonatomic) IBOutlet UILabel *request;
@property (nonatomic,retain) GKSession *currentSession;

@property int jinyuanbao;

- (IBAction)btnSend:(id)sender;
-(IBAction) btnConnect:(id) sender;
-(IBAction) btnDisconnect:(id) sender;

- (NSString *)dataFilePath;
- (IBAction)newgameon:(id)sender;
- (IBAction)answerClick:(id)sender;
- (void)playSound;
- (void)newgame;
- (void)sql;
- (void)xml;
- (IBAction) sendWexin;
- (IBAction) sendHelp;
- (IBAction) turnInfo;
- (IBAction) turnMe;
- (IBAction) turnHero;
- (IBAction) sendImage;
- (IBAction)showSheet:(id)sender;

-(void) gamestatus;
@end



