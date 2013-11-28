//
//  ScrollViewController.h
//  MyDiary
//
//  Created by a on 13-11-28.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property float keyBoardY;
@property float statusBarHeight;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak,nonatomic) UITextField *currentTextfild;
@end
