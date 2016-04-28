//
//  ManualLayout2ViewController.h
//  AutoLayoutByExample
//
//  Created by Hiedi Utley on 4/25/16.
//  Copyright © 2016 Hiedi Utley. All rights reserved.
//
#import "AutoLayout2ViewController.h"

@interface AutoLayout2ViewController ()
{
    IBOutlet UIButton* _button1;
    IBOutlet UIButton* _button2;
    IBOutlet UIButton* _button3;
    IBOutlet UIButton* _button4;
    
    IBOutletCollection(NSLayoutConstraint) NSArray* _landscapeConstraints;
    IBOutletCollection(NSLayoutConstraint) NSArray* _portraitConstraints;
    BOOL _useWideLayout;
}

@end

@implementation AutoLayout2ViewController

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGSize size = self.view.bounds.size;
    _useWideLayout = size.width > size.height;
}

- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    BOOL isLandscape = size.width > size.height;
    _useWideLayout = isLandscape;
    [self.view setNeedsUpdateConstraints];
}

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    BOOL isLandscape = UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
    _useWideLayout = isLandscape;
    [self.view setNeedsUpdateConstraints];
}

- (void) updateViewConstraints
{
    [super updateViewConstraints];
    
    for (NSLayoutConstraint *constraint in _landscapeConstraints)
    {
        constraint.priority = _useWideLayout ? 750 : 250;
    }
    for (NSLayoutConstraint *constraint in _portraitConstraints)
    {
        constraint.priority = !_useWideLayout ? 750 : 250;
    }
}

/*

 Portrait
 |=========================|
 |  +-------------------+  |
 |  |         1         |  |
 |  +-------------------+  |
 |                         |
 |  +-------------------+  |
 |  |         2         |  |
 |  +-------------------+  |
 |                         |
 |  +-------------------+  |
 |  |         3         |  |
 |  +-------------------+  |
 |                         |
 |  +-------------------+  |
 |  |         4         |  |
 |  +-------------------+  |
 |-------------------------|
 |            |            |
 |            |            |
 |=========================|


 Landscape
 |======================================|
 |  +--------------+  +--------------+  |
 |  |       1      |  |       2      |  |
 |  +--------------+  +--------------+  |
 |                                      |
 |  +--------------+  +--------------+  |
 |  |       3      |  |       4      |  |
 |  +--------------+  +--------------+  |
 |--------------------------------------|
 |                  |                   |
 |                  |                   |
 |======================================|

 */

@end
