//
//  DescriptionViewController.m
//  sanguocai
//
//  Created by Li Wen Jun on 13-11-24.
//  Copyright (c) 2013年 Li Wen Jun. All rights reserved.
//

#import "HeroViewController.h"

@interface HeroViewController ()

@end

@implementation HeroViewController
@synthesize bt;
@synthesize heroTxt;
@synthesize webView;
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
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0,50,320,380)]; //初始化大小并自动释放
    self.textView.textColor = [UIColor blackColor];//设置textview里面的字体颜色
    
    self.textView.font = [UIFont fontWithName:@"Arial" size:18.0];//设置字体名字和字体大小
    
    self.textView.delegate = self;//设置它的委托方法
    
    self.textView.backgroundColor = [UIColor whiteColor];//设置它的背景颜色
    
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames ){
        printf( "Family: %s \n", [familyName UTF8String] );
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames ){
            printf( "\tFont: %s \n", [fontName UTF8String] );
        }  
    }
    
    self.textView.text = self.heroTxt;
        //设置它显示的内容
    
    self.textView.returnKeyType = UIReturnKeyDefault;//返回键的类型
    
    self.textView.keyboardType = UIKeyboardTypeDefault;//键盘类型
    
    self.textView.scrollEnabled = YES;//是否可以拖动
    [self.textView setEditable:NO];
    
    
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    
    [self.view addSubview: self.textView];//加入到整个页面中
    
    CGRect rect = [ UIScreen mainScreen ].applicationFrame;
    CGSize size = rect.size;
 //   CGFloat width = size.width;
 //   CGFloat height = size.height;
    int heightFour = size.height;
    if (heightFour>480) {
       
        CGRect frame = bt.frame;
        frame.origin.y = 517;
        bt.frame = frame;
    }
    
    int leng = [self.heroTxt length];
    if (leng < 10) {
        [self.textView setHidden:YES];
        NSString  *ur = [NSString stringWithFormat:@"http://wapbaike.baidu.com"];
        if (heightFour>480) {
        webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 50, 320, 468)];
        }
        else{
        webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 50, 320, 380)];
        }
        NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:ur]];
        [self.view addSubview: webView];
        [webView loadRequest:request];
        
        
    }

    
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) backGame{
  //  DeviceViewController *gameView = [[DeviceViewController alloc]init];
   // [self removeFromParentViewController];
  //  [self presentModalViewController:gameView animated:YES];
    [self dismissModalViewControllerAnimated:YES];
}

@end
