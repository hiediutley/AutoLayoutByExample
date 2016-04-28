//
//  ManualLayout2ViewController.h
//  AutoLayoutByExample
//
//  Created by Hiedi Utley on 4/25/16.
//  Copyright © 2016 Hiedi Utley. All rights reserved.
//
#import "AutoLayout3ViewController.h"

@interface AutoLayout3ViewController ()
{
  IBOutlet UIButton* _button1;
  IBOutlet UIButton* _button2;
  IBOutlet UIButton* _button3;
  IBOutlet UIButton* _button4;

  IBOutletCollection(NSLayoutConstraint) NSArray* _landscapeConstraints;
  IBOutletCollection(NSLayoutConstraint) NSArray* _portraitConstraints;

  IBOutletCollection(NSLayoutConstraint) NSArray* _portraitVerticalSpacingConstraints;
  IBOutletCollection(NSLayoutConstraint) NSArray* _landscapeVerticalSpacingConstraints;
  IBOutletCollection(NSLayoutConstraint) NSArray* _landscapeHorizontalSpacingConstraints;

  BOOL _useWideLayout;
}

@end

@implementation AutoLayout3ViewController

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

  CGFloat buttonWidth = _button1.frame.size.width;
  CGFloat buttonHeight = _button1.frame.size.height;
  CGSize size = self.view.frame.size;

  CGFloat yPortraitSpacing = floorf((size.height - buttonHeight * 4)/5);

  CGFloat xLandscapeSpacing = (size.width - buttonWidth*2)/3;
  CGFloat yLandscapeSpacing = (size.height - buttonHeight*2)/3;

  for (NSLayoutConstraint *constraint in _portraitVerticalSpacingConstraints)
  {
    constraint.constant = yPortraitSpacing;
  }

  for (NSLayoutConstraint *constraint in _landscapeVerticalSpacingConstraints)
  {
    constraint.constant = yLandscapeSpacing;
  }

  for (NSLayoutConstraint *constraint in _landscapeHorizontalSpacingConstraints)
  {
    constraint.constant = xLandscapeSpacing;
  }

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
