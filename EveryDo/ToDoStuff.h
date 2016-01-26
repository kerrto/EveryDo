//
//  ToDoStuff.h
//  EveryDo
//
//  Created by Kerry Toonen on 2016-01-26.
//  Copyright © 2016 Kerry Toonen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoStuff : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *doDescription;
@property (nonatomic) int priority;
@property (nonatomic, strong) NSString *completedIndicator;

-(instancetype)initWithTitle:(NSString*)title doDescription:(NSString *)description priorityNumber:(int)priority completedIndicator:(NSString*)completed;




@end
