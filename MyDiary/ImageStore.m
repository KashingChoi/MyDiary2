//
//  ImageStore.m
//  MyDiary
//
//  Created by kgy on 13-11-6.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "ImageStore.h"

static ImageStore *defaultImageStore = nil;

@implementation ImageStore

//防止创建另一个该类型的实例
+(id)allocWithZone:(NSZone *)zone
{
    return [self defaultImageStore];
}

+(ImageStore *)defaultImageStore
{
    if(!defaultImageStore){
        defaultImageStore = [[super allocWithZone:NULL]init];
    }
    return defaultImageStore;
}

-(id)init
{
    if(defaultImageStore){
        return  defaultImageStore;
    }
    
    self = [super init];
    if(self){
        dictionary = [[NSMutableDictionary alloc]init];
    }
    
    return self;
}

-(void)setImage:(UIImage *)image forKey:(NSString *)string
{
    [dictionary setObject:image forKey:string];
}

-(UIImage *)imageForKey:(NSString *)string
{
    return [dictionary objectForKey:string];
}

-(void)deleteImageforKey:(NSString *)string
{
    if(!string){
        return;
    }
    [dictionary removeObjectForKey:string];
}

@end
