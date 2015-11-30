//
//  AddressConfirmationTableViewCell.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/30/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "AddressConfirmationTableViewCell.h"

@implementation AddressConfirmationTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void) bindDataForOrder : (Order *) order{
    self.labelForTotalAmount.text=[NSString stringWithFormat:@"%@ %@",order.payuItemCurrency,order.orderAmount];
    self.labelForPaymentMode.text=order.paymentMethod;
    self.labelForTotalQuantity.text=[NSString  stringWithFormat:@"%ld",(long)order.orderedProducts.count];
}

@end
