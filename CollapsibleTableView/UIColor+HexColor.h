//
//  UIColor+HexColor.h
//  CollapsibleTableView
//
//  Created by Greg Delgado on 18/12/2016.
//  Copyright © 2016 Greg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

+ (instancetype)colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha;
+ (instancetype)colorWithHex:(NSInteger)hex;

@end
