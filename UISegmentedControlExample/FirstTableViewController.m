//
//  FirstTableViewController.m
//  UISegmentedControlExample
//
//  Created by Daniel Martínez Muñoz on 30/11/14.
//  Copyright (c) 2014 @dmartinezinfo. All rights reserved.
//

#import "FirstTableViewController.h"

@interface FirstTableViewController ()

@end

@implementation FirstTableViewController

NSArray *list1;
NSArray *list2;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    list1 = [NSArray arrayWithObjects:@"One", @"Two", @"Three", nil];
    list2 = [NSArray arrayWithObjects:@"Four", @"Five", @"Six", @"Seven", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [list1 count];
    } else {
        return [list2 count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Section 1";
    } else {
        return @"Section 2";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstCell" forIndexPath:indexPath];
    
    if ([indexPath section] == 0) {
        [cell.textLabel setText:[list1 objectAtIndex:indexPath.row]];
    } else {
        [cell.textLabel setText:[list2 objectAtIndex:indexPath.row]];
    }
    
    return cell;
    
}

@end
