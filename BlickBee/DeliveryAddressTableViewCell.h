//
//  DeliveryAddressTableViewCell.h
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/20/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Address.h"
@interface DeliveryAddressTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelForAddressOne;
@property (weak, nonatomic) IBOutlet UILabel *labelForAddressTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelForAddressThree;
@property (weak, nonatomic) IBOutlet UIButton *editButtonClicked;
@property (weak, nonatomic) IBOutlet UIButton *removeButtonClicked;
- (IBAction)editButtonClicked:(id)sender;
- (IBAction)removeButtonClicked:(id)sender;
-(void) bindData:(Address*)address;

@end
