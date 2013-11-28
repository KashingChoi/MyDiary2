//
//  DetailDiaryViewController.h
//  MyDiary
//
//  Created by kgy on 13-10-23.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Diary.h"

@interface DetailDiaryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *diaryTitle;
@property (weak, nonatomic) IBOutlet UITextView *diaryContent;
@property (weak, nonatomic) IBOutlet UIImageView *diaryPhoto;
@property (nonatomic,strong) Diary *diary;
@end
