//
//  ToDoStuff.m
//  EveryDo
//
//  Created by Kerry Toonen on 2016-01-26.
//  Copyright © 2016 Kerry Toonen. All rights reserved.
//

#import "ToDoStuff.h"

@implementation ToDoStuff

-(instancetype) initWithTitle:(NSString*)title doDescription:(NSString *)description priorityNumber:(int)priority completedIndicator:(NSString*)completed {
    self=[super init];
    if (self){
        _title=title;
        _doDescription=description;
        _priority=priority;
        _completedIndicator=completed;
    }
    return self;
}

@end
