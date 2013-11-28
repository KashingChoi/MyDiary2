//
//  Diary.m
//  MyDiary
//
//  Created by apple on 13-10-20.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "Diary.h"

@implementation Diary

-(id)init
{
    return [self initWithTitle:@"" content:@""];
}
-(id)initWithTitle:(NSString *)theTitle content:(NSString *)theContent
{
    self = [super init];
    if(self){
        [self setTitle:theTitle];
        [self setContent:theContent];
        _dateCreate = [[NSDate alloc]init];
    }
    return self;
}
@end
