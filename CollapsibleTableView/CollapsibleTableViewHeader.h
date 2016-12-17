//
//  CollapsibleTableViewHeader.h
//  CollapsibleTableView
//
//  Created by Greg Delgado on 18/12/2016.
//  Copyright © 2016 Greg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CollapsibleTableViewHeader;

@protocol CollapsibleTableViewHeaderDelegate <NSObject>

- (void) toggleSection:(CollapsibleTableViewHeader *)header section:(NSInteger)section;

@end

@interface CollapsibleTableViewHeader : UITableViewHeaderFooterView

@property (weak, nonatomic) id<CollapsibleTableViewHeaderDelegate> delegate;
@property (nonatomic) NSInteger section;

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *arrowLabel;

- (void)setCollapsed:(BOOL)collapsed;

@end
