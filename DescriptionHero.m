//
//  DescriptionViewController.m
//  sanguocai
//
//  Created by Li Wen Jun on 13-11-24.
//  Copyright (c) 2013年 Li Wen Jun. All rights reserved.
//

#import "DescriptionHero.h"

@interface DescriptionHero ()

@end

@implementation DescriptionHero
@synthesize bt;
@synthesize list;
@synthesize currentSession;
@synthesize sendMessage;
UISegmentedControl* mySegmentedControl;
GKPeerPickerController *picker;
NSString *imgfilepath;
NSString *herofilepath;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mySegmentedControl = [[UISegmentedControl alloc]initWithItems:nil];
  
    mySegmentedControl.segmentedControlStyle = UISegmentedControlStyleBezeled;//风格
    
 //   UISegmentedControlStylePlain,     // large plain 有灰边的大白按钮，适合偏好设置单元
//    UISegmentedControlStyleBordered,  // large bordered 黑边的大白按钮，适用于表格单元
//    UISegmentedControlStyleBar,       // small button/nav bar style. tintable 小按钮，适合导航栏
 //   UISegmentedControlStyleBezeled,   // large bezeled style. tintable
    
    [mySegmentedControl insertSegmentWithTitle:@"连接蓝牙" atIndex:0 animated:YES];
    [mySegmentedControl insertSegmentWithTitle:@"断开蓝牙" atIndex:1 animated:YES];
//    [mySegmentedControl insertSegmentWithImage:[UIImage imageNamed:@"fenduan.png"]  atIndex:3 animated:YES];
    [mySegmentedControl setWidth:160 forSegmentAtIndex:0];
    [mySegmentedControl setWidth:160 forSegmentAtIndex:1];
    [self.view addSubview:mySegmentedControl];
    [mySegmentedControl addTarget:self action:@selector(selected:) forControlEvents:UIControlEventValueChanged];  
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [path objectAtIndex:0];
    imgfilepath = [documents stringByAppendingPathComponent:@"heroimg.plist"];
    herofilepath = [documents stringByAppendingPathComponent:@"herofile.plist"];
    
    imageArry = [NSMutableArray arrayWithObjects:
                 @"00005_00001.png",
                 @"00005_00002.png",
                 @"00005_00003.png",
                 @"00005_00004.png",
                 @"00005_00005.png",
                 @"00005_00006.png",
                 @"00005_00007.png",
                 @"00005_00008.png",
                 @"00005_00009.png",
                 @"00005_00010.png",
                 @"00005_00011.png",
                 @"00005_00012.png",
                 @"00005_00013.png",
                 @"00005_00014.png",
                 @"00005_00015.png",
                 @"00005_00016.png",
                 @"00005_00017.png",
                 @"00005_00018.png",
                 @"00005_00019.png",
                 @"00005_00020.png",
                 @"00005_00021.png",
                 @"00005_00022.png",
                 @"00005_00023.png",
                 @"00005_00024.png",
                 @"00005_00025.png",
                 @"00005_00026.png",
                 @"00005_00027.png",
                 @"00005_00028.png",
                 @"00005_00029.png",
                 @"00005_00030.png",
                 @"00005_00031.png",
                 @"00005_00032.png",
                 @"00005_00033.png",
                 @"00005_00034.png",
                 @"00005_00035.png",
                 @"00005_00036.png",
                 @"00005_00037.png",
                 @"00005_00038.png",
                 @"00005_00039.png",
                 @"00005_00040.png",
                 @"00005_00041.png",
                 @"00005_00042.png",
                 @"00005_00043.png",
                 @"00005_00044.png",
                 @"00005_00045.png",
                 @"00005_00046.png",
                 @"00005_00047.png",
                 @"00005_00048.png",
                 @"00005_00049.png",
                 @"00005_00050.png",
                 @"00005_00051.png",
                 nil];
    
    [imageArry writeToFile:imgfilepath atomically:YES];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:herofilepath];
    self.heroTab= [[UITableView alloc]init];
    self.list = array;
    
    // Do any additional setup after loading the view from its nib.
    
    
    CGRect rect = [ UIScreen mainScreen ].applicationFrame;
    CGSize size = rect.size;
    //    CGFloat width = size.width;
    //   CGFloat height = size.height;
    int heightFour = size.height;
    if (heightFour>480) {
        
        CGRect frame = bt.frame;
        frame.origin.y = 517;
        bt.frame = frame;
    }
    
}

-(void)selected:(id)sender{
    UISegmentedControl* control = (UISegmentedControl*)sender;
    switch (control.selectedSegmentIndex) {
        case 0:
            [self btnConnect:nil];
            break;
        case 1:
            [self btnDisconnect:nil];
            break;
            
        default:
            break;
    }
}

-(IBAction)saveHero{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [path objectAtIndex:0];
    imgfilepath = [documents stringByAppendingPathComponent:@"heroimg.plist"];
    herofilepath = [documents stringByAppendingPathComponent:@"herofile.plist"];
    [imageArry writeToFile:imgfilepath atomically:YES];
    [heroArry writeToFile:herofilepath atomically:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:TableSampleIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.list objectAtIndex:row];
    NSString *img = [imageArry objectAtIndex:row];
    UIImage *image = [UIImage imageNamed:img];
    cell.imageView.image = image;
    UIImage *highLighedImage = [UIImage imageNamed:@"micro_messenger"];
    cell.imageView.highlightedImage = highLighedImage;
    cell.detailTextLabel.text =@"征西大将军";
    
	return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *rowString = [self.list objectAtIndex:[indexPath row]];
    self.sendMessage = rowString;
    UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"选中的行信息" message:rowString delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alter show];
    alter.tag = 1;
    
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [list count];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (alertView.tag==1) {
        
        if (buttonIndex == 0) {
            NSLog(@"点击了分享英雄成就");
            [self btnSend:sendMessage];
        }
    }
    else if (alertView.tag==2) {
        if (buttonIndex == 0) {
            [self btnDisconnect:nil];
        [self dismissModalViewControllerAnimated:YES];
            }
    }
}


#pragma mark -
#pragma mark - Blue

- (IBAction) btnConnect:(id) sender {
    //   [MobClick event:@"blue"];
    picker = [[GKPeerPickerController alloc] init];
    picker.delegate = self;
    picker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;
    //   [connect setHidden:YES];
    //   [disconnect setHidden:NO];
    //   [sendData setHidden:NO];
    [picker show];
}

- (void)peerPickerController:(GKPeerPickerController *)picker
              didConnectPeer:(NSString *)peerID toSession:(GKSession *) session
{
    self.currentSession = session;
    session.delegate = self;
    [session setDataReceiveHandler:self withContext:nil];
    picker.delegate = nil;
    [picker dismiss];
    
}

- (void)peerPickerControllerDidCancel:(GKPeerPickerController *)picker
{
    picker.delegate = nil;
    //   [connect setHidden:NO];
    //   [disconnect setHidden:YES];
    //[sendData setHidden:YES];
    
}

-(IBAction) btnDisconnect:(id) sender {
    [self.currentSession disconnectFromAllPeers];
    //   [connect setHidden:NO];
    //   [disconnect setHidden:YES];
    //  [sendData setHidden:YES];
    currentSession = nil;
}

- (void)session:(GKSession *)session peer:(NSString *)peerID didChangeState:(GKPeerConnectionState)state {
    switch(state)
    {
        case GKPeerStateConnected:
            NSLog(@"connected");
            mySegmentedControl.selectedSegmentIndex = 0;
            //            [sendData setHidden:NO];
            break;
        case GKPeerStateAvailable:
            NSLog(@"Available");
            break;
        case GKPeerStateUnavailable:
            NSLog(@"UNAvailable");
            mySegmentedControl.selectedSegmentIndex = 1;
            break;
        case GKPeerStateConnecting:
            NSLog(@"connecting");
            break;
        case GKPeerStateDisconnected:
            NSLog(@"disconnected");
            mySegmentedControl.selectedSegmentIndex = 1;
            currentSession = nil;
            break;
            //          [connect setHidden:NO];
            //           [disconnect setHidden:YES];
    }
}

- (void) mySendDataToPeers:(NSData *) data
{
    if (currentSession)
        [self.currentSession sendDataToAllPeers:data
                                   withDataMode:GKSendDataReliable
                                          error:nil];
}
-(IBAction) btnSend:(id) sender
{
    //---convert an NSString object to NSData---
    NSData* data;
    
    data = [sendMessage dataUsingEncoding: NSNonLossyASCIIStringEncoding];
    [self mySendDataToPeers:data];
    
}


- (void) receiveData:(NSData *)data fromPeer:(NSString *)peer inSession:(GKSession *)session context:(void *)context {
    //---convert the NSData to NSString---
    NSString* str;
    str = [[NSString alloc] initWithData:data encoding:NSNonLossyASCIIStringEncoding];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"收到信息"
                                                    message:str
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    heroArry = [[NSMutableArray alloc]initWithArray:self.list];

    [heroArry addObject:str];
    NSSet *set = [NSSet setWithArray:heroArry];
    heroArry = nil;
    NSArray *setArry = [set allObjects];
    heroArry = [NSMutableArray arrayWithArray:setArry];
    
    [heroArry writeToFile:herofilepath atomically:YES];
    alert.tag = 2;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) backGame{
    //   DeviceViewController *gameView = [[DeviceViewController alloc]init];
    [self dismissModalViewControllerAnimated:YES];
    
    //  [self removeFromParentViewController];
    //   [self presentModalViewController:gameView animated:YES];
}

@end
