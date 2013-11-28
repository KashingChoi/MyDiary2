//
//  CameraViewController.h
//  MyDiary
//
//  Created by kgy on 13-11-6.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Diary.h"

@class CameraViewController;

@protocol CameraViewControllerDelegate

-(void)cameraViewControllerDidReturn:(CameraViewController *)cameraViewController;

@end

@interface CameraViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
- (IBAction)doDismiss:(id)sender;
- (IBAction)takePicture:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *picture;

@property (weak,nonatomic) id <CameraViewControllerDelegate>delegate;

@property (strong,nonatomic) Diary *diary;
@end
