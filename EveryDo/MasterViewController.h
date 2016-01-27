//
//  MasterViewController.h
//  EveryDo
//
//  Created by Kerry Toonen on 2016-01-26.
//  Copyright © 2016 Kerry Toonen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) NSArray *sortedEventArray;


@end

