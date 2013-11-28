//
//  ScrollViewController.m
//  MyDiary
//
//  Created by a on 13-11-28.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

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
	// Do any additional setup after loading the view.
    self.userName.delegate = self;
    self.password.delegate = self;
    self.email.delegate = self;
    self.address.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.currentTextfild = textField;
    float textFieldTop = self.currentTextfild.frame.origin.y;
    float textFieldButtom = textFieldTop + self.currentTextfild.frame.size.height;
    if (textFieldButtom > self.keyBoardY && self.keyBoardY !=0.0f) {
        [self.scrollView setContentOffset:CGPointMake(0, textFieldButtom - self.keyBoardY + self.statusBarHeight)animated:YES];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
}

-(void)keyboardDidShow:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    CGRect keyBoardFrame = [[info objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    self.keyBoardY = keyBoardFrame.origin.y;
    CGRect statusBarFrame = [[UIApplication sharedApplication]statusBarFrame];
    self.statusBarHeight = statusBarFrame.size.height;
    float textFieldTop = self.currentTextfild.frame.origin.y;
    float textFieldButtom = textFieldTop + self.currentTextfild.frame.size.height;
    if ((textFieldButtom > self.keyBoardY) && (self.keyBoardY !=0.0)) {
        [self.scrollView setContentOffset:CGPointMake(0, textFieldButtom - self.keyBoardY + self.statusBarHeight)animated:YES];
    }
}

-(void)keyBoardDidHide:(NSNotification *)notification
{
    [self.scrollView setContentOffset:CGPointMake(0, 0)animated:YES];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidShowNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
