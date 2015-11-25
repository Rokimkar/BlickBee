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
#import "OrderServiceClient.h"

@interface MyOrdersViewController ()

@end

@implementation MyOrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.MyOrdersTableView registerNib:[UINib nibWithNibName:@"MyOrdersTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyOrdersTableViewCell"];
    SWRevealViewController *swRevealVC = self.revealViewController;
    if(swRevealVC){
        UIImage *image =[UIImage imageNamed:@"menu.png"];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.bounds = CGRectMake(0, 0, image.size.width-30, image.size.height-30);
        self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]init];
        [btn addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:image forState:UIControlStateNormal];
        UIBarButtonItem *menuButton = [[UIBarButtonItem alloc]initWithCustomView:btn];
        //        [self.navigationItem.leftBarButtonItem setTarget: self.revealViewController];
        //        [self.navigationItem.leftBarButtonItem setAction: @selector( revealToggle: )];
        self.navigationItem.leftBarButtonItem = menuButton;
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        self.revealViewController.panGestureRecognizer.delegate=self;
        self.navigationController.navigationBar.barTintColor=RGBA(246, 71, 17, 1);
        swRevealVC.rearViewRevealWidth=270.0f;
    }
    OrderServiceClient *client = [[OrderServiceClient alloc] init];
    [client getAllOrdersWithSuccess:^(NSMutableArray *orderaArray) {
        
    } failure:^(NSError *error) {
        
    }];
    
    self.title=@"My Orders";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
