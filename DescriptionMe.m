//
//  DescriptionViewController.m
//  sanguocai
//
//  Created by Li Wen Jun on 13-11-24.
//  Copyright (c) 2013年 Li Wen Jun. All rights reserved.
//

#import "DescriptionMe.h"

@interface DescriptionMe ()

@end

@implementation DescriptionMe
@synthesize bt;
@synthesize textView;
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
        // Do any additional setup after loading the view from its nib.
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0,150,320,250)]; //初始化大小并自动释放
    self.textView.textColor = [UIColor blackColor];//设置textview里面的字体颜色
    
    self.textView.font = [UIFont fontWithName:@"Arial" size:18.0];//设置字体名字和字体大小
    
    self.textView.delegate = self;//设置它的委托方法
    
    self.textView.backgroundColor = [UIColor whiteColor];//设置它的背景颜色
    

    
    self.textView.text = @"                         公告信息\n"
    "寓教于乐，根据三国演义历史典故猜英雄人物，可以微信或蓝牙向朋友分享和求助或金币查看答案提示。金币不够怎么办，不用着急，赶紧通过蓝牙向朋友免费索取吧。\n"
    "欢迎您出题，游戏关卡由您亲自设计，还什么赶快来出题吧！\n"
        "采用后即可奖励神秘奖品或者金币兑换码。\n"
    ;
    
        //设置它显示的内容
    
    self.textView.returnKeyType = UIReturnKeyDefault;//返回键的类型
    
    self.textView.keyboardType = UIKeyboardTypeDefault;//键盘类型
    
    self.textView.scrollEnabled = YES;//是否可以拖动
    [self.textView setEditable:NO];
    
    
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    
    
    
    [self.view addSubview: self.textView];//加入到整个页面中
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
