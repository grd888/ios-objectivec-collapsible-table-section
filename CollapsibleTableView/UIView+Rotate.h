//
//  UIView+Rotate.h
//  CollapsibleTableView
//
//  Created by Greg Delgado on 18/12/2016.
//  Copyright © 2016 Greg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Rotate)

- (void)rotate:(CGFloat)toValue duration:(CFTimeInterval)duration;
- (void)rotate:(CGFloat)toValue;

@end
