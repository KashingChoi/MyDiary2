//
//  DariyListViewController.m
//  MyDiary
//
//  Created by apple on 13-10-20.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "DariyListViewController.h"
#import "Diary.h"
#import "DetailDiaryViewController.h"

@interface DariyListViewController ()

@end

@implementation DariyListViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"DetailDiary"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSInteger row = [indexPath row];
        Diary *diary = [self.diaries objectAtIndex:row];
        
        DetailDiaryViewController *detailDiaryViewController = (DetailDiaryViewController *)[segue destinationViewController];
        detailDiaryViewController.diary = diary;
    }
    if([segue.identifier isEqualToString:@"AddDiary"]){
        NSLog(@"进入创建新日记场景！");
        
        CreateDiaryViewController *createDiaryViewController = (CreateDiaryViewController *)[segue destinationViewController];
        createDiaryViewController.delegate = self;
    }    
}

-(void)createDiaryViewControllerDidCancel:(CreateDiaryViewController *)createDiaryController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)createDiaryViewController:(CreateDiaryViewController *)createDiaryController didSaveWithDiary:(Diary *)theDiary
{
    Diary *diary = theDiary;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.diaries addObject:diary];
    [self.tableView reloadData];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    Diary *a = [[Diary alloc]initWithTitle:@"第1篇日记" content:@"第1篇日记的内容"];
    Diary *b = [[Diary alloc]initWithTitle:@"第2篇日记" content:@"第2篇日记的内容"];
    Diary *c = [[Diary alloc]initWithTitle:@"第3篇日记" content:@"第3篇日记的内容"];
    Diary *d = [[Diary alloc]initWithTitle:@"第4篇日记" content:@"第4篇日记的内容"];
    Diary *e = [[Diary alloc]initWithTitle:@"第5篇日记" content:@"第5篇日记的内容"];
    
    self.diaries = [NSMutableArray arrayWithObjects:a,b,c,d,e,nil];
    
    //UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewDiary:)];
    //[[self navigationItem] setRightBarButtonItem:barItem];
    [[self navigationItem] setTitle:@"日记列表"];    
    [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
}

//-(void)addNewDiary:(id)sender
//{
//    
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.diaries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Diarycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Diary *diary = [self.diaries objectAtIndex:indexPath.row];
    cell.textLabel.text = [diary title];
    cell.detailTextLabel.text = [[diary dateCreate]description];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
    */
    /*
    NSLog(@"表格视图中第%d行被用户点击",indexPath.row);
    NSString *messageString = [NSString stringWithFormat:@"用户点击了第%d行",indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"用户点击了单元格" message:messageString delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];*/
}

@end
