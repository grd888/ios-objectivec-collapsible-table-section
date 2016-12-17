//
//  UIView+Rotate.m
//  CollapsibleTableView
//
//  Created by Greg Delgado on 18/12/2016.
//  Copyright © 2016 Greg. All rights reserved.
//

#import "UIView+Rotate.h"

@implementation UIView (Rotate)

- (void)rotate:(CGFloat)toValue duration:(CFTimeInterval)duration
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.toValue = @(toValue);
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)rotate:(CGFloat)toValue
{
    [self rotate:toValue duration:0.2];
}

@end
