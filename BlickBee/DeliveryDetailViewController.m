//
//  DeliveryDetailViewController.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/19/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "DeliveryDetailViewController.h"
#import "OrderServiceClient.h"
#import "AddAddressViewController.h"
@interface DeliveryDetailViewController ()<addressUpdated>{
    DeliveryDetailTableView *deliveryDetailTableView;
}

@end

@implementation DeliveryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    deliveryDetailTableView = [[DeliveryDetailTableView alloc]initWithFrames :CGRectMake(0,0, getScreenWidth(), getScreenHeight()-100)];
    deliveryDetailTableView.addressDelegate=self;
    deliveryDetailTableView.separatorColor=[UIColor clearColor];
    deliveryDetailTableView.backgroundColor=RGBA(225, 225, 225, 1);
    [self.view addSubview:deliveryDetailTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)proceedToPaymentBtnPressed:(id)sender {
    
    OrderServiceClient *client = [[OrderServiceClient alloc] init];
    
    if ([BlickbeeAppManager sharedInstance].userAddresses.count>0) {
        Address *address = [[BlickbeeAppManager sharedInstance].userAddresses objectAtIndex:0];
        [client makeOrderWithProductArray:[BlickbeeAppManager sharedInstance].selectedProducts andAddress:address WithSuccess:^(Order *order) {
            
        } failure:^(NSError *error) {
            
        }];
    }
    
    
}

-(void) openNewAddress{
    AddAddressViewController *cont = [[AddAddressViewController alloc] initWithNibName:@"AddAddressViewController" bundle:nil];
    cont.addressDelegate=self;
    UINavigationController *navcont = [[UINavigationController alloc] initWithRootViewController:cont];
    [self.navigationController presentViewController:navcont animated:YES completion:^{
        
    }];
}

-(void) addressUpdated{
    [deliveryDetailTableView reloadData];
}


@end
