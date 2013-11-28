//
//  DetailDiaryViewController.m
//  MyDiary
//
//  Created by kgy on 13-10-23.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "DetailDiaryViewController.h"
#import "ImageStore.h"

@interface DetailDiaryViewController ()

@end

@implementation DetailDiaryViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.diaryTitle.text = self.diary.title;
    self.diaryContent.text = self.diary.content;
    
    NSString *photoKey = [self.diary photoKey];
    if(photoKey){
        UIImage *imageToDisplay = [[ImageStore defaultImageStore]imageForKey:photoKey];
        [self.diaryPhoto setImage:imageToDisplay];
    }else{
        [self.diaryPhoto setImage:nil];
    }
    
    [[self navigationItem]setTitle:@"日记内容"];    
}

@end
