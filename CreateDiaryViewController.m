//
//  CreateDiaryViewController.m
//  MyDiary
//
//  Created by kgy on 13-10-28.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "CreateDiaryViewController.h"
#import "CameraViewController.h"

@implementation CreateDiaryViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"TakePicture"]){
        CameraViewController *camera = (CameraViewController *)[segue destinationViewController];
        camera.delegate = self;
        camera.diary = self.diary;
    }
}

-(void)cameraViewControllerDidReturn:(CameraViewController *)cameraViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    [self.delegate createDiaryViewControllerDidCancel:self];
}

- (IBAction)saveDiary:(id)sender {    
    self.diary.title = self.diaryTitle.text;
    self.diary.content = self.diaryContent.text;
    
    [self.delegate createDiaryViewController:self didSaveWithDiary:self.diary];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.diary = [[Diary alloc]init];
    
    //self.diaryDate.text = [[NSDate date]description];
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy年M月d日 'at' h:mm a"];
    NSString *date = [df stringFromDate:[NSDate date]];
    self.diaryDate.text = date;
}

@end
