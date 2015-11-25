//
//  MyOrdersViewController.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/23/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "MyOrdersViewController.h"
#import "MyOrdersTableViewCell.h"
#import "SWRevealViewController.h"

@interface MyOrdersViewController ()

@end

@implementation MyOrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.MyOrdersTableView registerNib:[UINib nibWithNibName:@"MyOrdersTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyOrdersTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
