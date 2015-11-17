//
//  ProductViewController.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/12/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "ProductViewController.h"
#import "BaseTableView.h"
#import "BlickBeePrefix.pch"

@interface ProductViewController (){
    BaseTableView *productTableView;
}

@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    productTableView = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, getScreenWidth(), getScreenHeight()) andProductsArray:self.productArray];
    productTableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:productTableView];
    [self.view bringSubviewToFront:self.floatingBtn];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void) awakeFromNib{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
