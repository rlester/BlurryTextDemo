//
//  ViewController.m
//  BlurryTextDemo
//
//  Created by Rob Lester on 12/23/12.
//  Copyright (c) 2012 Rob Lester. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation ViewController

static NSInteger const INTEGER_BUTTON = 0;
static NSInteger const FRACTIONAL_BUTTON = 1;
static NSInteger const ROUNDED_BUTTON = 2;

#pragma mark - View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self themeVisualElements];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self positionLabelByIntegerCordinates];
}

#pragma mark - IBAction Functions

- (IBAction)segmentedControlsAction:(UISegmentedControl*)segmentedControl {
    switch (segmentedControl.selectedSegmentIndex) {
        case INTEGER_BUTTON:
            [self positionLabelByIntegerCordinates];
            break;
        case FRACTIONAL_BUTTON:
            [self positionLabelByFractionalCordinates];
            break;
        case ROUNDED_BUTTON:
            [self positionLabelByRoundedCordinates];
            break;
            
        default:
            [self positionLabelByIntegerCordinates];
            break;
    }
}

#pragma mark - Utility Functions

// Position the label in the center horizonal center of the view.
- (void)positionLabelByIntegerCordinates {
    [self.textLabel setCenter:CGPointMake(self.view.center.x, self.textLabel.center.y)];
    self.positioningCode.text = @"[self.textLabel setCenter:CGPointMake(self.view.center.x, self.textLabel.center.y)];";
    [self updateXYLabels];
}

/**
 * Add 0.4 to the label to position and position it in the middle of two points.  
 * This is hard coded in this example just to illistrate the point but this could have occured if the width of the label was odd and was divided in half.
 * The real take away is that if the calculated point isn't a whole point it will cause the UILabel to be blurry.
 */
- (void)positionLabelByFractionalCordinates {
    [self.textLabel setCenter:CGPointMake(self.view.center.x + 0.4, self.textLabel.center.y)];
    self.positioningCode.text = @"[self.textLabel setCenter:CGPointMake(self.view.center.x + 0.4, self.textLabel.center.y)];";
    [self updateXYLabels];
}


//Position the UILabel exactly the same as how the factional cordiatinate function does it. Just this time round to the nearest whole number / whole point.
- (void)positionLabelByRoundedCordinates {
    [self.textLabel setCenter:CGPointMake(roundf(self.view.center.x + 0.4), self.textLabel.center.y)];
    self.positioningCode.text = @"[self.textLabel setCenter:CGPointMake(roundf(self.view.center.x + 0.4), self.textLabel.center.y)];";
    [self updateXYLabels];
}

- (void)updateXYLabels {
    self.xLocation.text = [NSString stringWithFormat:@"%f", self.textLabel.frame.origin.x];
    self.yLoaction.text = [NSString stringWithFormat:@"%f", self.textLabel.frame.origin.y];
}

#pragma mark - Theme Visual Elements (Not relevent)

- (void)themeVisualElements {
    [self roundVisualElements];
    [self shadowVisualElements];
}

- (void)shadowVisualElements {
    self.locationInfoView.layer.shadowOffset = CGSizeMake(2, 2);
    self.locationInfoView.layer.shadowRadius = 2;
    self.locationInfoView.layer.shadowOpacity = 0.8;
    self.locationInfoView.layer.shadowColor = [UIColor blackColor].CGColor;
}

- (void)roundVisualElements {
    self.locationInfoView.layer.cornerRadius = 6;
}

@end
