//
//  CreateDiaryViewController.h
//  MyDiary
//
//  Created by kgy on 13-10-28.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Diary.h"
#import "CameraViewController.h"

@class CreateDiaryViewController;

@protocol CreateDiaryViewControllerDelegate
@required
-(void)createDiaryViewControllerDidCancel:(CreateDiaryViewController *)createDiaryController;
-(void)createDiaryViewController:(CreateDiaryViewController *)createDiaryController didSaveWithDiary:(Diary *)theDiary;
@end

@interface CreateDiaryViewController : UIViewController <UITextFieldDelegate,CameraViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *diaryDate;
@property (weak, nonatomic) IBOutlet UITextField *diaryTitle;
@property (weak, nonatomic) IBOutlet UITextView *diaryContent;
@property (strong,nonatomic) Diary *diary;
@property (nonatomic,weak) id <CreateDiaryViewControllerDelegate>delegate;
//返回按钮
- (IBAction)cancel:(id)sender;
//保存按钮
- (IBAction)saveDiary:(id)sender;
@end
