//
//  DrawingViewController.m
//  DrawingApp
//
//  Created by mcm2737 on 10/9/13.
//  Copyright (c) 2013 Absolutely Learning. All rights reserved.
//

#import "DrawingViewController.h"
#import "TouchTrackerView.h"
#import "UIBezierPath-Smoothing.h"

@interface DrawingViewController ()

@end

@implementation DrawingViewController

- (void) clear
{
    [(TouchTrackerView *)self.view clear];
}

- (void) loadView
{
    [super loadView];
    self.view = [[TouchTrackerView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
// RESIZABLE(self.view);
    
    self.view.backgroundColor = [UIColor yellowColor];
	// self.navigationItem.rightBarButtonItem = BARBUTTON(@"Action", @selector(action:));
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self clear];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


/* - (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
} */

@end
