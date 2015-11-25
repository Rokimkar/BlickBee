//
//  ProductViewController.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/12/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "ProductViewController.h"
#import "CartViewController.h"
#import "BaseTableView.h"
#import "BlickBeePrefix.pch"
#import "BlickbeeAppManager.h"

@interface ProductViewController (){
    BaseTableView *productTableView;
}

@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    productTableView = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, getScreenWidth(), getScreenHeight()) andProductsArray:self.productArray];
    productTableView.separatorColor=[UIColor clearColor];
    productTableView.backgroundColor=RGBA(225, 225, 225, 1);
    [self.view addSubview:productTableView];
    [self.view bringSubviewToFront:self.floatingBtn];
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"cartViewControllerSegue"]){
        CartViewController *cartViewController = [segue destinationViewController];
        cartViewController.productArray=[[BlickbeeAppManager sharedInstance] selectedProducts];
    }
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(productTableView){
        [productTableView reloadData];
    }
}

-(void) awakeFromNib{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
