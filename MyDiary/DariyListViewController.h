//
//  DariyListViewController.h
//  MyDiary
//
//  Created by apple on 13-10-20.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateDiaryViewController.h"

@interface DariyListViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate,CreateDiaryViewControllerDelegate>

@property (nonatomic,strong) NSMutableArray *diaries;

@end
