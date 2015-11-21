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
//    NSMutableAttributedString *subtotal = [[NSMutableAttributedString alloc]initWithString:@"Subtotal\n ₹ 732.0"];
//    NSMutableAttributedString *delivery =[[NSMutableAttributedString alloc]initWithString:@"Delivery\n Free"];
//    NSMutableAttributedString *total =[[NSMutableAttributedString alloc]initWithString:@"Total\n ₹ 732.0"];
//    NSDictionary *attribute1 = @{NSForegroundColorAttributeName: RGBA(223, 65, 16, 1),
//                                 NSFontAttributeName: [UIFont  systemFontOfSize:12],
//                                 };

//    [subtotal addAttributes:attribute1 range:NSMakeRange(8,7)];
//    
//    [self.labelForSubtotal setAttributedText:subtotal];
//    [delivery addAttributes:attribute1 range:NSMakeRange(8,4)];
    //[self.labelForDelivery setAttributedText:delivery];
    self.labelForSubtotal.text=@"₹ 732.0";
    self.labelForDelivery.text=@"Free";
    self.labelForTotal.text=@"₹ 732.0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)startShoppingButtonClicked:(id)sender {
}
- (IBAction)proceedButtonClicked:(id)sender {
}
@end
