//
//  CollapsibleTableViewHeader.m
//  CollapsibleTableView
//
//  Created by Greg Delgado on 18/12/2016.
//  Copyright © 2016 Greg. All rights reserved.
//

#import "CollapsibleTableViewHeader.h"
#import "UIView+Rotate.h"
#import "UIColor+HexColor.h"

@implementation CollapsibleTableViewHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.arrowLabel = [[UILabel alloc] init];
        self.titleLabel = [[UILabel alloc] init];
        
        [self.arrowLabel.widthAnchor constraintEqualToConstant:12].active = YES;
        [self.arrowLabel.heightAnchor constraintEqualToConstant:12].active = YES;
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.arrowLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.arrowLabel];
        
        //
        // Call tapHeader when tapping on this header
        //
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHeader:)];
        [self addGestureRecognizer:gesture];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentView.backgroundColor = [UIColor colorWithHex:0x2E3944];
    
    self.titleLabel.textColor = [UIColor whiteColor];
    self.arrowLabel.textColor = [UIColor whiteColor];
    
    //
    // Autolayout the labels
    //
    if (self.titleLabel && self.arrowLabel) {
        NSDictionary *views = @{ @"titleLabel": self.titleLabel,
                                 @"arrowLabel": self.arrowLabel };
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[titleLabel]" options:0 metrics:nil views:views]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[arrowLabel]-20-|" options:0 metrics:nil views:views]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.titleLabel attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.arrowLabel attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    }
}

- (void)tapHeader:(UITapGestureRecognizer *)gestureRecognizer
{
    CollapsibleTableViewHeader *header = (CollapsibleTableViewHeader *)gestureRecognizer.view;
    [self.delegate toggleSection:self section:header.section];
}

- (void)setCollapsed:(BOOL)collapsed
{
    [self.arrowLabel rotate: (collapsed ? 0.0 : M_PI_2) ];
}

@end
