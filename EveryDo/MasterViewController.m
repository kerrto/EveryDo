//
//  MasterViewController.m
//  EveryDo
//
//  Created by Kerry Toonen on 2016-01-26.
//  Copyright © 2016 Kerry Toonen. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDoStuff.h"
#import "MyToDoCell.h"
#import "AddToDoViewController.h"

@interface MasterViewController () <UITableViewDataSource,UITableViewDelegate,AddToDoViewControllerDelegate>

@property NSMutableArray *toDoItems;

@end

@implementation MasterViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.toDoItems=[NSMutableArray array];
    

    
    
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    
    
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

-(void)itemAdded:(ToDoStuff*) newItem {
    if (!self.toDoItems) {
        self.toDoItems = [[NSMutableArray alloc] init];
    }
    
    [self.toDoItems insertObject:newItem atIndex:0];
//    [self.toDoItems addObject:newItem];
    // NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.toDoItems.count-1 inSection:0];
    // [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    NSLog(@"ADDED!!!!");
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.tableView reloadData];
}



#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDoStuff *toDoItem= self.toDoItems[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:toDoItem];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    if ([[segue identifier] isEqualToString:@"addToViewController"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        ToDoStuff *toDoItem= self.toDoItems[indexPath.row];
        AddToDoViewController *controller = segue.destinationViewController;
        controller.delegate=self;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    
    
    
    
    
    
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDoItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyToDoCell" forIndexPath:indexPath];
    
    ToDoStuff *currentItem = self.toDoItems[indexPath.row];
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:currentItem.title];
    NSMutableAttributedString *desc = [[NSMutableAttributedString alloc] initWithString:currentItem.doDescription];
    NSMutableAttributedString *priority = [[NSMutableAttributedString alloc] initWithString:@(currentItem.priority).stringValue];
    
    // alloc 3 mutable
    
    if ([currentItem.completedIndicator isEqualToString:@"Completed"]) {
        
        NSDictionary* strikeThrough = @{
                                        NSStrikethroughStyleAttributeName: @(1)};
        [title addAttributes:strikeThrough range:NSMakeRange(0, title.length)];
        [desc addAttributes:strikeThrough range:NSMakeRange(0, desc.length)];
        [priority addAttributes:strikeThrough range:NSMakeRange(0, priority.length)];
    }
    
    
    cell.toDoLabel.attributedText = title;
    cell.detailLabel.attributedText= desc;
    cell.priorityLabel.attributedText= priority;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}





@end
