//
//  HomeViewController.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/4/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "HomeViewController.h"
#import "SWRevealViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *swRevealVC = self.revealViewController;
    if(swRevealVC){
        [self.navigationItem.leftBarButtonItem setTarget: self.revealViewController];
        [self.navigationItem.leftBarButtonItem setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        swRevealVC.rearViewRevealWidth=130.0f;
    }
    self.title = @"BlickBee";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
