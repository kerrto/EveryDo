//
//  AddToDo.m
//  EveryDo
//
//  Created by Kerry Toonen on 2016-01-26.
//  Copyright © 2016 Kerry Toonen. All rights reserved.
//

#import "AddToDoViewController.h"
#import "ToDoStuff.h"

@interface AddToDoViewController ()

@end

@implementation AddToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction) addNewToDo:(UIButton *) sender {
    
    if(self.completedIndicator.on) {
        self.completedString=@"Completed";}
    self.priorityInt=[self.priority.text intValue];
    
    ToDoStuff *newItem =[[ToDoStuff alloc] initWithTitle:self.toDoInput.text doDescription:self.toDoDescriptionInput.text priorityNumber:self.priorityInt completedIndicator:self.completedString];
    [self.delegate itemAdded:newItem];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
