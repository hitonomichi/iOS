//
//  Sample_TextView.m
//
//  Created by 高浜 一道 on 2013/08/07.
//  Copyright (c) 2013年 高浜 一道. All rights reserved.
//

#import "Sample_TextView.h"

#import "AppDelegate.h"

@interface Sample_TextView ()
@property CGRect wakeup_back_frame;
@property CGRect itemsUnderView_frame;
@end

@implementation Sample_TextView

- (void)viewDidLoad
{
    LOG();

    [super viewDidLoad];
    
    [self createTextView];

    [self.view bringSubviewToFront:self.dateunderview];
    [self.view bringSubviewToFront:self.btn_keyboardclose];

    self.wakeup_back_frame = self.wakeup_back.frame;
    self.itemsUnderView_frame = self.itemsUnderView.frame;
}

- (void) viewWillAppear:(BOOL)animated
{
    LOG()
    [super viewWillAppear:animated];

    // Notification observerを追加する
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void) viewDidAppear:(BOOL)animated
{
    LOG()
    [super viewDidAppear:animated];
    
    NSString *osVer = [UIDevice currentDevice].systemVersion;
    int version = [[osVer substringToIndex:1] integerValue];
    if (version < 7) {
        LOG(@"iOS7未満")
        CGRect rect = self.dateunderview.frame;
        rect.origin.y -= 20;
        self.dateunderview.frame = rect;
    } else {
        LOG(@"iOS7以上")
    }
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    LOG();
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - create


- (void)createTextView
{
    LOG();
    self.textView_tweet.delegate = self;
    self.textView_tweet.layer.borderWidth = 1;
    self.textView_tweet.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.textView_tweet.layer.cornerRadius = 4;
}

- (IBAction)tapCloseKeyBoard:(id)sender {
    [self.textView_tweet resignFirstResponder];
}

#pragma mark - UITextView Delegate method
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
}

#pragma mark - keyboard
- (void)keyboardWillShow:(NSNotification *)notification {
    
    //
    CGRect keyboardBounds = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    //キーボード閉じるボタンの高さを変更
    CGRect frame = self.btn_keyboardclose.frame;
    frame.origin.y = self.view.frame.size.height - keyboardBounds.size.height - frame.size.height;
    self.btn_keyboardclose.frame = frame;
    
    //日本語　入力予測の座標変更は無視
    if (216 >= keyboardBounds.size.height
        || self.itemsUnderView.frame.origin.y == self.itemsUnderView_frame.origin.y) {
        //ビューの座標変更
        CGRect wupRect = self.wakeup_back.frame;
        wupRect.origin.y = self.label_mon.frame.origin.y-50;
        self.wakeup_back.frame = wupRect;
        
        CGRect rect = self.itemsUnderView.frame;
        rect.origin.y = wupRect.origin.y + 20;
        self.itemsUnderView.frame = rect;
    }

    [UIView commitAnimations];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    //キーボードツールバーの高さを変更
    CGRect frame = self.btn_keyboardclose.frame;
    frame.origin.y = self.view.frame.size.height;
    self.btn_keyboardclose.frame = frame;
    
    //座標変更
    self.wakeup_back.frame = self.wakeup_back_frame;
    self.itemsUnderView.frame = self.itemsUnderView_frame;
    
    [UIView commitAnimations];
    
}

@end
