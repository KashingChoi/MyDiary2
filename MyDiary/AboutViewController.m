//
//  ViewController.m
//  MyDiary
//
//  Created by apple on 13-10-12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

-(IBAction)authorChanged:(id)sender
{
    int value = [sender selectedSegmentIndex];
    switch (value) {
        case 0:
            self.qqNumber.text = @"QQ:123456";
            self.weibo.text = @"微博：zhangsan";
            self.authorImage.image = [UIImage imageNamed:@"image01.png"];
            break;
        case 1:
            self.qqNumber.text = @"QQ:654321";
            self.weibo.text = @"微博：lisi";
            self.authorImage.image = [UIImage imageNamed:@"image00.png"];
            break;
        default:
            break;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    switch (self.authors.selectedSegmentIndex) {
        case 0:
            self.qqNumber.text = @"QQ:123456";
            self.weibo.text = @"微博：zhangsan";
            self.authorImage.image = [UIImage imageNamed:@"image01.png"];
            break;
        case 1:
            self.qqNumber.text = @"QQ:654321";
            self.weibo.text = @"微博：lisi";
            self.authorImage.image = [UIImage imageNamed:@"image00.png"];
            break;
        default:
            break;
    }

}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"视图即将出现");
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"视图已经出现");
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"视图即将消失");
    [super viewWillAppear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"视图已经消失");
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
