//
//  BaseViewController.m
//  BlickBee
//
//  Created by Kunal Chelani on 12/6/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "BaseViewController.h"
#import "UIFont+Custom.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.navigationController) {
        self.navigationController.navigationBar.titleTextAttributes =  @{
                                                                         NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                         NSFontAttributeName: [UIFont getProximaNovaBoldWithSize:18.0],
                                                                         }
        ;
        
}
    UIImage *image =[UIImage imageNamed:@"back.png"];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.bounds = CGRectMake(-30, 0, image.size.width-40, image.size.height-40);
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]init];
    [btn addTarget:self action:@selector(moveBack) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:image forState:UIControlStateNormal];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = menuButton;
    
}

-(void)moveBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
