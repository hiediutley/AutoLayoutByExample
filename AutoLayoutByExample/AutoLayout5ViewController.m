//
//  AutoLayout5ViewController
//  AutoLayoutByExample
//
//  Created by Hiedi Utley on 4/25/16.
//  Copyright © 2016 Hiedi Utley. All rights reserved.
//

#import "AutoLayout5ViewController.h"
#import <Parus/Parus.h>

@interface AutoLayout5ViewController ()
@property (nonatomic, strong) IBOutlet UIView *redView;
@property (nonatomic, strong) IBOutlet UIView *orangeView;
@property (nonatomic, strong) IBOutlet UIView *yellowView;
@property (nonatomic, strong) IBOutlet UIView *greenView;

@property (nonatomic, strong) NSArray *portraitConstraints;
@property (nonatomic, strong) NSArray *landscapeConstraints;


@end

@implementation AutoLayout5ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [self.view setNeedsUpdateConstraints];
}

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self.view setNeedsUpdateConstraints];
}

-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
  [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
}

-(void)updateViewConstraints
{
    [super updateViewConstraints];
    
    [self.view removeConstraints:_landscapeConstraints];
    [self.view removeConstraints:_portraitConstraints];
    
    CGFloat buttonWidth = _redView.frame.size.width;
    CGFloat buttonHeight = _redView.frame.size.height;
    CGSize size = self.view.frame.size;
    
    CGFloat yPortraitSpacing = floorf((size.height - buttonHeight * 4)/5);
    _portraitConstraints = PVGroup(@[
                                     
                                     PVWidthOf(_redView).equalTo.constant(buttonWidth),
                                     PVHeightOf(_redView).equalTo.constant(buttonHeight),
                                     PVHeightOf(_orangeView).equalTo.heightOf(_redView),
                                     PVWidthOf(_orangeView).equalTo.widthOf(_redView),
                                     PVHeightOf(_yellowView).equalTo.heightOf(_redView),
                                     PVWidthOf(_yellowView).equalTo.widthOf(_redView),
                                     PVHeightOf(_greenView).equalTo.heightOf(_redView),
                                     PVWidthOf(_greenView).equalTo.widthOf(_redView),
                                     
                                     PVCenterXOf(_redView).equalTo.centerXOf(self.view),
                                     PVCenterXOf(_orangeView).equalTo.centerXOf(self.view),
                                     PVCenterXOf(_yellowView).equalTo.centerXOf(self.view),
                                     PVCenterXOf(_greenView).equalTo.centerXOf(self.view),
                                     
                                     PVTopOf(_redView).equalTo.topOf(self.view).plus(yPortraitSpacing),
                                     PVTopOf(_orangeView).equalTo.bottomOf(_redView).plus(yPortraitSpacing),
                                     PVTopOf(_yellowView).equalTo.bottomOf(_orangeView).plus(yPortraitSpacing),
                                     PVTopOf(_greenView).equalTo.bottomOf(_yellowView).plus(yPortraitSpacing),
                                     
                                     PVBottomOf(_greenView).equalTo.bottomOf(self.view).minus(yPortraitSpacing),

                                     ]).asArray;
    
    CGFloat xLandscapeSpacing = floorf((size.width - buttonWidth*2)/3);
    CGFloat yLandscapeSpacing = floorf((size.height - buttonHeight*2)/3);
    
    _landscapeConstraints = PVGroup(@[
                                      PVWidthOf(_redView).equalTo.constant(buttonWidth),
                                      PVHeightOf(_redView).equalTo.constant(buttonHeight),
                                      PVHeightOf(_orangeView).equalTo.heightOf(_redView),
                                      PVWidthOf(_orangeView).equalTo.widthOf(_redView),
                                      PVHeightOf(_yellowView).equalTo.heightOf(_redView),
                                      PVWidthOf(_yellowView).equalTo.widthOf(_redView),
                                      PVHeightOf(_greenView).equalTo.heightOf(_redView),
                                      PVWidthOf(_greenView).equalTo.widthOf(_redView),
                                      
                                      PVLeftOf(_redView).equalTo.leftOf(self.view).plus(xLandscapeSpacing),
                                      PVLeftOf(_orangeView).equalTo.rightOf(_redView).plus(xLandscapeSpacing),
                                      PVLeftOf(_yellowView).equalTo.leftOf(self.view).plus(xLandscapeSpacing),
                                      PVLeftOf(_greenView).equalTo.rightOf(_yellowView).plus(xLandscapeSpacing),
                                      
                                      PVTopOf(_redView).equalTo.topOf(self.view).plus(yLandscapeSpacing),
                                      PVTopOf(_orangeView).equalTo.topOf(self.view).plus(yLandscapeSpacing),
                                      
                                      PVTopOf(_yellowView).equalTo.bottomOf(_redView).plus(yLandscapeSpacing),
                                      PVTopOf(_greenView).equalTo.bottomOf(_orangeView).plus(yLandscapeSpacing),
                                      
                                      PVBottomOf(_yellowView).equalTo.bottomOf(self.view).minus(yLandscapeSpacing),
                                      PVBottomOf(_greenView).equalTo.bottomOf(self.view).minus(yLandscapeSpacing),
                                      
                                      ]).asArray;
    
  [self.view addConstraints: (size.height > size.width) ? _portraitConstraints : _landscapeConstraints];

}

@end
