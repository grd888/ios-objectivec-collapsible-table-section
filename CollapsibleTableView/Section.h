//
//  Section.h
//  CollapsibleTableView
//
//  Created by Greg Delgado on 18/12/2016.
//  Copyright © 2016 Greg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Section : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray<NSString *> *items;
@property (nonatomic) BOOL   collapsed;

-(instancetype) initWithName:(NSString *)name
                       items:(NSArray<NSString *> * )items
                   collapsed:(BOOL)collapsed;

-(instancetype) initWithName:(NSString *)name
                       items:(NSArray<NSString *> * )items;

@end
