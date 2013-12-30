//
//  DescriptionViewController.h
//  sanguocai
//
//  Created by Li Wen Jun on 13-11-24.
//  Copyright (c) 2013年 Li Wen Jun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroViewController.h"

@interface HeroViewController : UIViewController<UITextViewDelegate>{
    IBOutlet UIButton *bt;
}
@property IBOutlet UITextView *textView;
@property IBOutlet UIWebView *webView;
@property IBOutlet UIButton *bt;
@property NSString *heroTxt;
- (IBAction) backGame;
@end
