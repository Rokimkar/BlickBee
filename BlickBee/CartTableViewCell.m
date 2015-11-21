//
//  CartTableViewCell.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/17/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "CartTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "BlickbeeAppManager.h"

@implementation CartTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

-(void) bindData : (Product *) product{
    self.item=product;
    self.labelForProductTitle.text=product.productName;
    self.labelForPrice.text=product.productPrice;
    self.labelForUnitQuantity.text=product.productQuantity;
    self.labelForQuantity.text=product.selectedProductQuantity;
    if([product.productImages objectAtIndex:0]){
        NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:[product.productImages objectAtIndex:0]] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
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
}

- (IBAction)addButtonClicked:(id)sender {
    if (![self.item.selectedProductQuantity isEqualToString:@"10"] ) {
    self.item.selectedProductQuantity = [NSString stringWithFormat:@"%ld",(long)([self.item.selectedProductQuantity integerValue]+1)];
        [self.reloadCellDelegate reloadCellWithProduct:self.item];
    }
}
- (IBAction)subtractButtonClicked:(id)sender {
    if([self.item.selectedProductQuantity isEqualToString:@"0"]){
        if([[[BlickbeeAppManager sharedInstance] selectedProducts] containsObject:self.item]){
                [[[BlickbeeAppManager sharedInstance] selectedProducts] removeObject:self.item];
            //[self.reloadCellDelegate reloadCellWithProduct:self.item];
        }
    }
    else{
        self.item.selectedProductQuantity = [NSString stringWithFormat:@"%ld",(long)([self.item.selectedProductQuantity integerValue]-1)];
        if([self.item.selectedProductQuantity isEqualToString:@"0"]){
            if([[[BlickbeeAppManager sharedInstance] selectedProducts] containsObject:self.item]){
                [[[BlickbeeAppManager sharedInstance] selectedProducts] removeObject:self.item];
            }
        }
        [self.reloadCellDelegate reloadCellWithProduct:self.item];
    }
}
@end
