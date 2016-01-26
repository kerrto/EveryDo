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



//[super viewDidLoad];
// Do any additional setup after loading the view, typically from a nib.

//// Setup an array to hold our objects
//self.foodItems = [NSMutableArray array];
//
//// Create 4 Food objects
//Food *pizza = [[Food alloc] initWithName:@"Pizza" taste:@"Yummy!"];
//Food *icecream = [[Food alloc] initWithName:@"Ice cream" taste:@"cold!"];
//Food *hotdog = [[Food alloc] initWithName:@"Hot Dog" taste:@"Gross"];
//Food *kale = [[Food alloc] initWithName:@"Kale" taste:@"Healthy"];
//
//// Add these to the array
//[self.foodItems addObjectsFromArray:@[pizza, icecream, hotdog, kale]];
//
//// Set our view controller to be the datasource and delegate of the tableview
//self.foodTable.dataSource = self;
//self.foodTable.delegate = self;
//
//// You can set the row height for all rows using the property
////self.foodTable.rowHeight = 100;
//
//// You can also create a table view in code, it works just like any other UIView
////    UITableView *table = [[UITableView alloc] initWithFrame:CGRectZero];
//// Register an identifier for a cell class in code
////    [table registerClass:[MyFoodCell class] forCellReuseIdentifier:@"FoodCell"];
////    [self.view addSubview:table];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.toDoItems=[NSMutableArray array];
    
    ToDoStuff *cleanUp =[[ToDoStuff alloc] initWithTitle:@"Clean Up" doDescription:@"pick up your sh**" priorityNumber:1 completedIndicator:@"Incomplete"];
    
    ToDoStuff *doHomework=[[ToDoStuff alloc] initWithTitle:@"Do Homework" doDescription:@"do your math homework" priorityNumber:2 completedIndicator:@"Completed"];
    
    ToDoStuff *exercise =[[ToDoStuff alloc] initWithTitle:@"Exercise" doDescription:@"Shape your bod" priorityNumber:3 completedIndicator:@"Incomplete"];
    
    [self.toDoItems addObjectsFromArray:@[cleanUp, doHomework, exercise]];
    
    
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    
    
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)insertNewObject:(id)sender {
    //    if (!self.toDoItems) {
    //        self.toDoItems = [[NSMutableArray alloc] init];
    //    }
    //    [self.toDoItems insertObject:[NSDate date] atIndex:0];
    //    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.toDoItems.count-1 inSection:0];
    //    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}



#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *toDoItem= self.toDoItems[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:toDoItem];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    
    //    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //
    //        if ([segue.identifier isEqualToString:@"showFoodItem"]) {
    //
    //            // Get the selected index path
    //            NSIndexPath *selectedIndexPath = [self.foodTable indexPathForSelectedRow];
    //
    //            // Use the selected index path to get the food object it was displaying
    //            Food *selectedFood = self.foodItems[selectedIndexPath.row];
    //
    //            // Pass that to our new view controller
    //            DetailViewController *dvc = (DetailViewController *)segue.destinationViewController;
    //            dvc.foodObject = selectedFood;
    //        }
    //    }
    
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
