//
//  OrdersDetailTableViewCell.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/26/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "OrdersDetailTableViewCell.h"

#import "UIImageView+AFNetworking.h"

@implementation OrdersDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)bindDataWithProduct : (OrderedProduct *) product{
    self.labelForCost.text=product.productAmount;
    self.labelForQty.text=product.productQty;
    //self.labelForTotalCost.text=
    if(product.productImage){
        NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:product.productImage] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
        [self.imageViewForProduct setImageWithURLRequest:req placeholderImage:[UIImage imageNamed:@"my orders empty.png"] success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
            
            if (!request) {
                self.imageViewForProduct.image=image;
                self.imageViewForProduct.contentMode=UIViewContentModeScaleToFill;
            }
            else{
                
                [UIView transitionWithView:self.imageViewForProduct duration:1.0f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    self.imageViewForProduct.image=image;
                    self.imageViewForProduct.contentMode=UIViewContentModeScaleToFill;
                } completion:^(BOOL finished) {
                    
                }];
            }
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        }];
    }
    self.labelForTotalCost.text=[NSString stringWithFormat:@"%ld",(long)([product.productQty integerValue])*([product.productAmount integerValue])];
}


@end
