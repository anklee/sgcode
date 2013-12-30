//
//  DescriptionViewController.h
//  sanguocai
//
//  Created by Li Wen Jun on 13-11-24.
//  Copyright (c) 2013年 Li Wen Jun. All rights reserved.
//
#import <GameKit/GameKit.h>
#import <UIKit/UIKit.h>
#import "DeviceViewController.h"


@interface DescriptionHero : UIViewController<UITextViewDelegate,UITableViewDelegate, UITableViewDataSource,UIAlertViewDelegate,GKPeerPickerControllerDelegate,GKSessionDelegate>{
    IBOutlet UIButton *bt;
    NSMutableArray *imageArry;
      GKSession *currentSession;
    NSString * selectString;
    NSMutableArray *heroArry;


}
@property IBOutlet UITableView *heroTab;
@property (strong, nonatomic) NSArray *list;
@property (nonatomic,retain) GKSession *currentSession;
@property IBOutlet UIButton *bt;
@property (weak, nonatomic)  NSString *sendMessage;

- (IBAction) backGame;
- (IBAction) btnSend:(id) sender;
- (IBAction) btnConnect:(id) sender;
- (IBAction) btnDisconnect:(id) sender;
@end
