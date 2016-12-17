//
//  UIColor+HexColor.m
//  CollapsibleTableView
//
//  Created by Greg Delgado on 18/12/2016.
//  Copyright © 2016 Greg. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor (HexColor)

+ (instancetype)colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha
{
    return [self colorWithRed:((hex & 0xFF0000) >> 16) / 255.0
                        green:((hex & 0x00FF00) >> 8) / 255.0
                         blue:((hex & 0x0000FF) >> 0) / 255.0
                        alpha:alpha];
}

+ (instancetype)colorWithHex:(NSInteger)hex
{
    return [self colorWithHex:hex alpha:1];
}

@end
