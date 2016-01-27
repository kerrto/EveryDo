//
//  AddToDo.h
//  EveryDo
//
//  Created by Kerry Toonen on 2016-01-26.
//  Copyright © 2016 Kerry Toonen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoStuff.h"

@class AddToDoViewController;

@protocol AddToDoViewControllerDelegate

-(void)itemAdded:(ToDoStuff*) newItem;



@end


@interface AddToDoViewController : UIViewController

@property (nonatomic, weak) id <AddToDoViewControllerDelegate> delegate;


@property (strong, nonatomic) IBOutlet UITextField *toDoInput;

@property (strong, nonatomic) IBOutlet UITextField *toDoDescriptionInput;

@property (strong, nonatomic) IBOutlet UITextField *priority;

@property (strong, nonatomic) IBOutlet UISwitch *completedIndicator;

@property (strong, nonatomic) NSString *completedString;

@property (nonatomic) int priorityInt;


-(IBAction) addNewToDo:(UIButton *) sender;



@end   
