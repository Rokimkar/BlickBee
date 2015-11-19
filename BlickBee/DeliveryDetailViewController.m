//
//  DeliveryDetailViewController.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/19/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "DeliveryDetailViewController.h"
#import "DeliveryDetailTableView.h"

@interface DeliveryDetailViewController (){
    DeliveryDetailTableView *deliveryDetailTableView;
}

@end

@implementation DeliveryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    deliveryDetailTableView = [[DeliveryDetailTableView alloc]initWithFrames :CGRectMake(0,0, getScreenWidth(), getScreenHeight())];
    deliveryDetailTableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:deliveryDetailTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
