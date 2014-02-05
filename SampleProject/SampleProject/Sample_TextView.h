//
//  Sample_TextView.h
//
//  Created by 高浜 一道 on 2013/08/07.
//  Copyright (c) 2013年 高浜 一道. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Sample_TextView : UIViewController<UITextViewDelegate,UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UIView *dateunderview;
@property (strong, nonatomic) IBOutlet UIButton *btn_keyboardclose;
@property (strong, nonatomic) IBOutlet UIView *wakeup_back;
@property (strong, nonatomic) IBOutlet UIView *itemsUnderView;
@property (strong, nonatomic) IBOutlet UITextView *textView_tweet;
@property (strong, nonatomic) IBOutlet UILabel *label_mon;

- (IBAction)tapCloseKeyBoard:(id)sender;

@end
