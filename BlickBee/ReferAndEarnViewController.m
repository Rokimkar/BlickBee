//
//  ReferAndEarnViewController.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 1/14/16.
//  Copyright © 2016 Sanchit Kumar Singh. All rights reserved.
//

#import "ReferAndEarnViewController.h"

@interface ReferAndEarnViewController ()

@end

@implementation ReferAndEarnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *swRevealVC = self.revealViewController;
    if(swRevealVC){
        UIImage *image =[UIImage imageNamed:@"menu.png"];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.bounds = CGRectMake(0, 0, image.size.width-40, image.size.height-40);
        self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]init];
        [btn addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:image forState:UIControlStateNormal];
        UIBarButtonItem *menuButton = [[UIBarButtonItem alloc]initWithCustomView:btn];
        self.navigationItem.leftBarButtonItem = menuButton;
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        self.revealViewController.panGestureRecognizer.delegate=self;
        self.navigationController.navigationBar.barTintColor=RGBA(246, 71, 17, 1);
        [self.navigationItem.leftBarButtonItem setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        [swRevealVC revealToggleAnimated:YES];
    }
    self.title=@"Refer and Earn";
    [self.view setBackgroundColor:RGBA(225, 225, 225, 1)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
