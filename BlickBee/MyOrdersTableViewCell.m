//
//  MyOrdersTableViewCell.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/23/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "MyOrdersTableViewCell.h"

@implementation MyOrdersTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void) bindData : (Order *)myOrder{
    [self setBackgroundColor:RGBA(225, 225, 225, 1)];
    self.item=myOrder;
    self.labelForOrderDate.text=myOrder.orderCreatedDate;
    self.labelForOrderID.text=myOrder.uniqueOrderId;
    self.labelForPrice.text=myOrder.orderAmount;
    self.imageViewForStatus.image=[UIImage imageNamed:@"2_a.png"];
    [self.imageViewForStatus sizeToFit];
}

- (IBAction)buttonPressedViewOrder:(id)sender{
    [self.launchOrderDetailVCDelegate launchOrderDetailVC : self.item];
}
@end
