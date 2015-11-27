//
//  OrderConfirmationViewController.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/27/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "OrderConfirmationViewController.h"
#import "SWRevealViewController.h"
#import "BlickbeeAppManager.h"

@interface OrderConfirmationViewController ()

@end

@implementation OrderConfirmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.labelForOrderID.textColor=RGBA(213, 43, 16, 1);
    self.view.backgroundColor=RGBA(225, 225, 226, 1);
    [[self.shopMoreButtonPressed layer]setBorderColor:[UIColor blackColor].CGColor];
    [[self.shopMoreButtonPressed layer]setBorderWidth:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shopMoreButtonPressed:(id)sender {
    [self.navigationController popToViewController:[BlickbeeAppManager sharedInstance].homeViewController animated:YES];
}
@end
