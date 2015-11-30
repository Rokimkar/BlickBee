//
//  AddressConfirmationTableViewCell.h
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/30/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"

@interface AddressConfirmationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelForTotalAmount;

@property (weak, nonatomic) IBOutlet UILabel *labelForTotalQuantity;
@property (weak, nonatomic) IBOutlet UILabel *labelForPaymentMode;


-(void) bindDataForOrder : (Order *) order;
@end
