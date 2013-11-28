//
//  CameraViewController.m
//  MyDiary
//
//  Created by kgy on 13-11-6.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "CameraViewController.h"
#import "ImageStore.h"

@implementation CameraViewController

- (IBAction)doDismiss:(id)sender {
    [self.delegate cameraViewControllerDidReturn:self];
}

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    
    //摄像头可用则用，不可用则用照片库
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }else{
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    //设置imagePicker的delegate，使它指向当前控制器
    [imagePicker setDelegate:self];
    
    //将UIImagePickerController的视图呈现在屏幕上
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *oldKey = [self.diary photoKey];
    if (oldKey) {
        //删除之前的老照片
        [[ImageStore defaultImageStore]deleteImageforKey:oldKey];
    }
    //从info中获取用户选择的照片信息
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];   
    
    //创建一个CFUIDRef类型的对象
    CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
    //创建一个字符串
    CFStringRef newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
    [self.diary setPhotoKey:(__bridge NSString *)newUniqueIDString];
    
    CFRelease(newUniqueIDString);
    CFRelease(newUniqueID);
    
    [[ImageStore defaultImageStore]setImage:image forKey:[self.diary photoKey]];
    
    [self.picture setImage:image];
    
    //销毁UIImagePickerController控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
