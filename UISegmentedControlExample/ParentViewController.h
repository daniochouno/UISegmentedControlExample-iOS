//
//  ViewController.h
//  UISegmentedControlExample
//
//  Created by Daniel Martínez Muñoz on 30/11/14.
//  Copyright (c) 2014 @dmartinezinfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstTableViewController.h"
#import "SecondViewController.h"
#import "ThirdTableViewController.h"
#import "FourthViewController.h"

@interface ParentViewController : UIViewController<UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UIView *container;

@property (strong, nonatomic) UIPageViewController *pageViewController;

- (void)indexDidChangeForSegmentedControl;

@end

