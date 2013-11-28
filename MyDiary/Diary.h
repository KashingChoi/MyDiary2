//
//  Diary.h
//  MyDiary
//
//  Created by apple on 13-10-20.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Diary : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,readonly,getter = dateCreate) NSDate *dateCreate;

@property (nonatomic,strong) NSString *photoKey;

-(id)initWithTitle:(NSString *)theTitle content:(NSString *)theContent;
@end
