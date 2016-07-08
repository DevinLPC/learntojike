//
//  RootTableViewController.m
//  myUINavigationController
//
//  Created by mayee on 16/7/7.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import "RootTableViewController.h"
#import "contentViewController.h"


@interface RootTableViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editBarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addBarButton;
@property (strong, nonatomic) IBOutlet UITableView *contentTableView;
@property (nonatomic,strong) NSMutableArray *arrayAll;
@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    self.navigationItem.title = @"Master";
    //Controller->item->title

}

- (IBAction)editViewList:(id)sender {
    if (self.contentTableView.editing == NO) {
        [self.contentTableView setEditing:YES animated:YES];
    }else {
        [self.contentTableView setEditing:NO animated:NO];
    }

    
    
}
- (IBAction)addViewList:(id)sender {

    NSString *currentData = [self stringFromDate];
    [self.arrayAll addObject:currentData];
    //[self.contentTableView reloadData]; //和下面三行代码会有冲突，会抵消掉下面的动画
    
    [self.contentTableView beginUpdates];
    [self.contentTableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.contentTableView endUpdates];
    
    
}
//NSDate转NSString
- (NSString *)stringFromDate {
    //获取系统当前时间
    NSDate *currentDate = [NSDate date];
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
    //输出currentDateString
    NSLog(@"%@",currentDateString);
    return currentDateString;
}

-(NSMutableArray*)arrayAll {
    if (!_arrayAll) {
        _arrayAll = [NSMutableArray array];
        NSString *currentData = [self stringFromDate];
        [_arrayAll addObject:currentData];
        
    }
    return _arrayAll;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    //NSLog(@"%d",self.arrayAll.count);
    return self.arrayAll.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    // cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    if (self.arrayAll.count != 0) {
        cell.textLabel.text = self.arrayAll[indexPath.row];
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    contentViewController *contentView = [self.storyboard instantiateViewControllerWithIdentifier:@"contentView"];
    
    [contentView setContent: self.arrayAll[indexPath.row]];
    [self.navigationController pushViewController:contentView animated:YES];
    
}

#pragma mark - delegate
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.arrayAll removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view

    }   
}

@end
