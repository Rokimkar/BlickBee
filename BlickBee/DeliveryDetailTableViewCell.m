//
//  DeliveryDetailTableViewCell.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/19/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "DeliveryDetailTableViewCell.h"

@implementation DeliveryDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void) bindData : (UIImage *) image{
    self.imageViewFordeliveryDetail.image=image;
    self.imageViewFordeliveryDetail.sizeToFit;
}

@end
