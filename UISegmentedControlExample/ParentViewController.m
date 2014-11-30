//
//  ViewController.m
//  UISegmentedControlExample
//
//  Created by Daniel Martínez Muñoz on 30/11/14.
//  Copyright (c) 2014 @dmartinezinfo. All rights reserved.
//

#import "ParentViewController.h"

@implementation ParentViewController

@synthesize segmentedControl;
@synthesize container;
@synthesize pageViewController;

NSUInteger currentIndex;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    [self.pageViewController setDataSource:self];
    [self.pageViewController setDelegate:self];
    
    currentIndex = 0;
    
    [self.pageViewController setViewControllers:@[ [self viewAtIndex:currentIndex] ] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.pageViewController didMoveToParentViewController:self];
    [self.view addSubview:self.pageViewController.view];
    
    [segmentedControl addTarget:self action:@selector(indexDidChangeForSegmentedControl) forControlEvents:UIControlEventValueChanged];
    
}

- (void)viewDidLayoutSubviews {
    // Set frame size in container:
    self.pageViewController.view.frame = self.container.frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
 *  Event for UISegmentedControl:
 */
- (void)indexDidChangeForSegmentedControl {
    NSInteger direction;
    if (segmentedControl.selectedSegmentIndex > currentIndex) {
        direction = UIPageViewControllerNavigationDirectionForward;
    } else if (segmentedControl.selectedSegmentIndex < currentIndex) {
        direction = UIPageViewControllerNavigationDirectionReverse;
    } else {
        return;
    }
    currentIndex = segmentedControl.selectedSegmentIndex;
    [self.pageViewController setViewControllers:@[ [self viewAtIndex:currentIndex] ] direction:direction animated:YES completion:nil];
}

/*
 *  UIPageViewControllerDataSource methods:
 */
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexAtView:viewController];
    if (index == 0) {
        return nil;
    }
    index--;
    return [self viewAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexAtView:viewController];
    index++;
    if (index == 4) {
        return nil;
    }
    return [self viewAtIndex:index];
}

/*
 *  UIPageViewControllerDelegate methods:
 */
- (void)pageViewController:(UIPageViewController *)_pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    UIViewController *currentView = [[_pageViewController viewControllers] objectAtIndex:0];
    currentIndex = [self indexAtView:currentView];
    self.segmentedControl.selectedSegmentIndex = currentIndex;
}

/*
 *  Helpers:
 */
- (UIViewController *)viewAtIndex:(NSUInteger)index {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *view;
    if (index == 0) {
        view = [storyboard instantiateViewControllerWithIdentifier:@"firstID"];
    } else if (index == 1) {
        view = [storyboard instantiateViewControllerWithIdentifier:@"secondID"];
    } else if (index == 2) {
        view = [storyboard instantiateViewControllerWithIdentifier:@"thirdID"];
    } else if (index == 3) {
        view = [storyboard instantiateViewControllerWithIdentifier:@"fourthID"];
    } else {
        view = nil;
    }
    return view;
}

- (NSUInteger)indexAtView:(UIViewController *)view {
    NSUInteger index;
    if ([view isKindOfClass:[FirstTableViewController class]]) {
        index = 0;
    } else if ([view isKindOfClass:[SecondViewController class]]) {
        index = 1;
    } else if ([view isKindOfClass:[ThirdTableViewController class]]) {
        index = 2;
    } else if ([view isKindOfClass:[FourthViewController class]]) {
        index = 3;
    }
    return index;
}

@end
