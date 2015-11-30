//
//  CartViewController.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/17/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "CartViewController.h"
#import "CartTableView.h"
#import "Product.h"
#import "BlickbeeAppManager.h"

@interface CartViewController (){
    CartTableView *cartTableView;
    NSMutableArray *selectedProductArray;
}

@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Product *product = [[Product alloc]init];
    selectedProductArray = [[NSMutableArray alloc]init];
    if(self.productArray == nil){
        self.productArray=[[BlickbeeAppManager sharedInstance]selectedProducts];
    }
    BOOL addCartTable = NO;
    for(int i=0;i<self.productArray.count;i++){
        product=self.productArray[i];
        if(![product.selectedProductQuantity isEqualToString:@"0"]){
            [selectedProductArray addObject:product];
            addCartTable=YES;
        }
    }
    if(addCartTable==YES){
        cartTableView = [[CartTableView alloc]initWithFrame:CGRectMake(0,109, getScreenWidth(), getScreenHeight()-176) andProductsArray:[[BlickbeeAppManager sharedInstance] selectedProducts]];
        cartTableView.separatorColor=[UIColor clearColor];
        [self.view addSubview:cartTableView];
        [self.view bringSubviewToFront:cartTableView];
        cartTableView.backgroundColor=RGBA(225, 225, 225, 1);
    }
    self.labelForSubtotal.text=@"₹ 732.0";
    self.labelForDelivery.text=@"Free";
    self.labelForTotal.text=@"₹ 732.0";
    if([[BlickbeeAppManager sharedInstance]selectedProducts].count==0){
        [self.view bringSubviewToFront:self.imageViewForCartViewController];
        [self.view bringSubviewToFront:self.startShoppingButtonClicked];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)startShoppingButtonClicked:(id)sender {
}
- (IBAction)proceedButtonClicked:(id)sender {
    
    
}
@end
