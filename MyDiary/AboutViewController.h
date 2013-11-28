//
//  ViewController.h
//  MyDiary
//
//  Created by apple on 13-10-12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController
@property (nonatomic,strong) IBOutlet UILabel *qqNumber;
@property (nonatomic,strong) IBOutlet UILabel *weibo;
@property (nonatomic,strong) IBOutlet UISegmentedControl *authors;
@property (nonatomic,strong) IBOutlet UIImageView *authorImage;

-(IBAction)authorChanged:(id)sender;
@end
