//
//  Section.m
//  CollapsibleTableView
//
//  Created by Greg Delgado on 18/12/2016.
//  Copyright © 2016 Greg. All rights reserved.
//

#import "Section.h"

@implementation Section

-(instancetype) initWithName:(NSString *)name
                       items:(NSArray<NSString *> * )items
                   collapsed:(BOOL)collapsed
{
    self = [super init];
    if (self) {
        self.name = name;
        self.items = items;
        self.collapsed = collapsed;
    }
    return self;
}

-(instancetype) initWithName:(NSString *)name
                       items:(NSArray<NSString *> * )items
{
    return [self initWithName:name items:items collapsed:NO];
}

@end
