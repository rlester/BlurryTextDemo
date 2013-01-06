//
//  ViewController.h
//  BlurryTextDemo
//
//  Created by Rob Lester on 12/23/12.
//  Copyright (c) 2012 Rob Lester. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel* textLabel;
@property (nonatomic, strong) IBOutlet UILabel* xLocation;
@property (nonatomic, strong) IBOutlet UILabel* yLoaction;
@property (nonatomic, strong) IBOutlet UILabel* positioningCode;
@property (nonatomic, strong) IBOutlet UIView* locationInfoView;
@property (nonatomic, strong) IBOutlet UISegmentedControl* segmentedControls;

- (IBAction)segmentedControlsAction:(id)sender;

@end
