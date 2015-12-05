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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
