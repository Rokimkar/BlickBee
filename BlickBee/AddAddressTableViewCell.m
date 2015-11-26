//
//  AddAddressTableViewCell.m
//  BlickBee
//
//  Created by Kunal Chelani on 11/25/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "AddAddressTableViewCell.h"

@implementation AddAddressTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)addAddressBtn:(id)sender {
    [self.addressDelegate openAddressPopUp];
}

@end
