//
//  MyToDoCell.h
//  EveryDo
//
//  Created by Kerry Toonen on 2016-01-26.
//  Copyright © 2016 Kerry Toonen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyToDoCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *toDoLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) IBOutlet UILabel *priorityLabel;

@end
