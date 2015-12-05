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
#import "CartFooterView.h"
#import "CartTableViewCell.h"
#import "DeliveryDetailViewController.h"

@interface CartViewController ()<openHomeVC,changePriceLabelInCartViewController>{
    CartTableView *cartTableView;
    NSMutableArray *selectedProductArray;
    NSInteger totalAmount;
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
        cartTableView = [[CartTableView alloc]initWithFrame:CGRectMake(0,109, getScreenWidth(), getScreenHeight()-166) andProductsArray:[[BlickbeeAppManager sharedInstance] selectedProducts]];
        cartTableView.openHomeVCDelegate=self;
        cartTableView.changePriceLabelInCartViewControllerDelegate=self;
        cartTableView.separatorColor=[UIColor clearColor];
        [self.view addSubview:cartTableView];
        [self.view bringSubviewToFront:cartTableView];
        cartTableView.backgroundColor=RGBA(225, 225, 225, 1);
//        CartFooterView* footerView = [[CartFooterView alloc] initWithFrame:CGRectMake(0, 0, getScreenWidth(), 100)];
        CartFooterView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"CartFooterView" owner:self options:nil] objectAtIndex:0];
        [footerView prepareView];
        cartTableView.tableFooterView = footerView;

    }
    if([[BlickbeeAppManager sharedInstance]selectedProducts].count==0){
        [self.view bringSubviewToFront:self.imageViewForCartViewController];
        [self.view bringSubviewToFront:self.startShoppingButtonClicked];
    }
    [self setTotalPriceLabel];
    [[self.startShoppingButtonClicked layer]setBorderColor:[UIColor blackColor].CGColor];
    [[self.startShoppingButtonClicked layer]setBorderWidth:1.0f];
    self.startShoppingButtonClicked.layer.cornerRadius = 0.0;
    [self.startShoppingButtonClicked setBackgroundColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[BlickbeeAppManager sharedInstance] archiveSelectedProducts];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)changePriceLabel{
    [self setTotalPriceLabel];
}

-(void)setTotalPriceLabel{
    totalAmount=0;
    for(int i=0;i<[BlickbeeAppManager sharedInstance].selectedProducts.count;i++){
        Product *product=[[Product alloc]init];
        product = [[BlickbeeAppManager sharedInstance].selectedProducts objectAtIndex:i];
        totalAmount+=([product.selectedProductQuantity integerValue]*[product.productPrice integerValue]);
    }
    if(totalAmount==0){
        [self.proceedButtonClicked setHidden:YES];
    }
    self.labelForSubtotal.text=[NSString stringWithFormat:@"%@ %ld",@"₹",(long)totalAmount];
    self.labelForDelivery.text=@"Free";
    self.labelForTotal.text=[NSString stringWithFormat:@"%@ %ld",@"₹",(long)totalAmount];
}

-(void)addAlertView{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Your order must be greater than ₹ 250" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alertView show];
}

-(void)openHomeVC{
    [self.navigationController popToRootViewControllerAnimated:[BlickbeeAppManager sharedInstance].homeViewController];
}

- (IBAction)startShoppingButtonClicked:(id)sender {
    [self openHomeVC];
}
- (IBAction)proceedButtonClicked:(id)sender {
    if(totalAmount<250 ){
        [self addAlertView];
    }
    else{
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        DeliveryDetailViewController *deliveryDetailViewController = [storyBoard instantiateViewControllerWithIdentifier:@"DeliveryDetailViewController"];
        [self.navigationController pushViewController:deliveryDetailViewController animated:YES];
    }
}

-(void) presentHome{

    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
