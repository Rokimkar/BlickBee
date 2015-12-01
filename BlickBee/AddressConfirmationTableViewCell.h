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
@property (strong,nonatomic) NSString *totalQuantity;
@property (strong,nonatomic) NSString *totalAmount;
-(void) bindDataForOrder;
@end
