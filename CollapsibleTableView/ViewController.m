//
//  ViewController.m
//  CollapsibleTableView
//
//  Created by Greg Delgado on 18/12/2016.
//  Copyright © 2016 Greg. All rights reserved.
//

#import "ViewController.h"
#import "Section.h"
#import "CollapsibleTableViewHeader.h"

@interface ViewController () <CollapsibleTableViewHeaderDelegate>

@property (nonatomic, strong) NSArray<Section *> *sections;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Apple Products";
    
    // Initialize the sections array
    // Here we have three sections: Mac, iPad, iPhone
    
    self.sections = @[
            [[Section alloc] initWithName:@"Mac" items:@[@"MacBook", @"Macbook Air", @"MacBook Pro", @"iMac", @"Mac Pro", @"Mac Mini", @"Accessories", @"OS X El Capitan" ]],
            [[Section alloc] initWithName:@"iPad" items:@[@"iPad Pro", @"IPad Air 2", @"iPad mini 4", @"Accessories"]],
            [[Section alloc] initWithName:@"iPhone" items:@[@"iPhone 6s", @"iPhone 6", @"iPhone SE", @"Accessories"]],
    ];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sections[section].items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.sections[indexPath.section].items[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.sections[indexPath.section].collapsed ? 0 : 44.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CollapsibleTableViewHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    if (!header) {
        header = [[CollapsibleTableViewHeader alloc] initWithReuseIdentifier:@"header"];
    }
    
    header.titleLabel.text = self.sections[section].name;
    header.arrowLabel.text = @"▶︎";
    [header setCollapsed:self.sections[section].collapsed];
    
    header.section = section;
    header.delegate = self;
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.0;
}

#pragma mark - CollapsibleTableViewHeaderDelegate

- (void)toggleSection:(CollapsibleTableViewHeader *)header section:(NSInteger)section
{
    BOOL collapsed = !self.sections[section].collapsed;
    
    // Toggle collapse
    self.sections[section].collapsed = collapsed;
    [header setCollapsed:collapsed];
    
    // Adjust the height of the rows inside the section
    [self.tableView beginUpdates];
    for (int i=0; i<self.sections[section].items.count; ++i) {
        [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:i inSection:section]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    [self.tableView endUpdates];
}
@end
