//
//  AddressConfirmationTableViewCell.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/30/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "AddressConfirmationTableViewCell.h"
#import "BlickbeeAppManager.h"
#import "Product.h"

@implementation AddressConfirmationTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void) bindDataForOrder{
    self.labelForPaymentMode.text=@"COD";
    NSInteger totalAmount=0;
    NSInteger totalQuantity=0;
    for(int i=0;i<[BlickbeeAppManager sharedInstance].selectedProducts.count;i++){
        NSInteger productCost=0;
        Product *product=[[Product alloc]init];
        product = [[BlickbeeAppManager sharedInstance].selectedProducts objectAtIndex:i];
        productCost=[product.productPrice integerValue];
        totalQuantity+=[product.productPrice integerValue];
        totalAmount+=([product.selectedProductQuantity integerValue]*[product.productPrice integerValue]);
    }
    self.labelForTotalAmount.text=[NSString stringWithFormat:@"%@ %ld",@"₹",(long)totalAmount];
    self.labelForTotalQuantity.text=[NSString stringWithFormat:@"%ld",totalQuantity];
}

@end
