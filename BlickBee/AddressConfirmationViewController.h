//
//  AddressConfirmationViewController.h
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/30/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Address.h"
#import "Order.h"
@interface AddressConfirmationViewController : UIViewController
@property (strong, nonatomic) Address *address;
@property (strong, nonatomic) Order *orderItem;
@property (weak, nonatomic) IBOutlet UITableView *addressConfirmationTableView;
@end
