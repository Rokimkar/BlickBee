//
//  FirstOrderDetailCell.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/26/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "FirstOrderDetailCell.h"
#import "Order.h"

@implementation FirstOrderDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)bindData : (Order *)order{
    self.imageViewForStatus.image = [UIImage imageNamed:@"2_a.png"];
    [self.imageViewForStatus sizeToFit];
    self.labelForOrderID.text=order.uniqueOrderId;
    self.labelForAmount.text=[NSString stringWithFormat:@"%@ %@",@"₹",order.orderAmount];
    self.labelForDate.text=order.orderCreatedDate;
}

@end
