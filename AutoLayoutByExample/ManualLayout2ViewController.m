//
//  ManualLayout2ViewController.m
//  AutoLayoutByExample
//
//  Created by Hiedi Utley on 4/25/16.
//  Copyright © 2016 Hiedi Utley. All rights reserved.
//

#import "ManualLayout2ViewController.h"

@interface ManualLayout2ViewController ()
@property (nonatomic, strong) IBOutlet UIView *redView;
@property (nonatomic, strong) IBOutlet UIView *orangeView;
@property (nonatomic, strong) IBOutlet UIView *yellowView;
@property (nonatomic, strong) IBOutlet UIView *greenView;
@end

@implementation ManualLayout2ViewController

- (void)viewWillLayoutSubviews
{
    CGFloat buttonWidth = _redView.frame.size.width;
    CGFloat buttonHeight = _redView.frame.size.height;
    
    CGSize size = self.view.frame.size;
    BOOL portrait = size.height > size.width;
    if (!portrait) {
        
        CGFloat xSpacing = (size.width - buttonWidth*2)/3;
        CGFloat ySpacing = (size.height - buttonHeight*2)/3;
        
        _redView.frame = CGRectMake(xSpacing, ySpacing, buttonWidth, buttonHeight);

        _orangeView.frame = CGRectMake(xSpacing*2 + buttonWidth, ySpacing, buttonWidth, buttonHeight);
        
        _yellowView.frame = CGRectMake(xSpacing, ySpacing*2 + buttonHeight, buttonWidth, buttonHeight);
        
        _greenView.frame = CGRectMake(xSpacing*2 + buttonWidth, ySpacing*2 + buttonHeight, buttonWidth, buttonHeight);
        
    } else {
        
        CGFloat xSpacing = (size.width - buttonWidth)/2;
        CGFloat ySpacing = (size.height - buttonHeight * 4)/5;
        
        NSArray *views = @[_redView, _orangeView, _yellowView, _greenView];
        CGFloat yOffset = ySpacing;
        
        for (UIView *view in views) {
            view.frame = CGRectMake(xSpacing, yOffset, buttonWidth, buttonHeight);
            yOffset = yOffset+buttonHeight+ySpacing;
        }
    }
}

@end
