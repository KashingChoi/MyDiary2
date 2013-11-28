//
//  ImageStore.h
//  MyDiary
//
//  Created by kgy on 13-11-6.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageStore : NSObject
{
    NSMutableDictionary *dictionary;
}

+(ImageStore *)defaultImageStore;
-(void)setImage:(UIImage *)image forKey:(NSString *)string;
-(UIImage *)imageForKey:(NSString *)string;
-(void)deleteImageforKey:(NSString *)string;
@end
