//
//  AddToCartTableViewCell.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/15/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "AddToCartTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "BlickbeeAppManager.h"
#import "BlickbeePrefix.pch"

@implementation AddToCartTableViewCell{
    NSInteger items;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) bindData:(Product*)product andQuantityAdded:(NSString *)quantity{
    if(items<0||items>10){
        items=1;
    }
    self.itemData=product;
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
    
    [self.labelForProductName setNumberOfLines:0];
    self.labelForProductName.text=product.productName;
    [self.labelForProductName sizeToFit];
    self.labelForItemCount.text=[NSString stringWithFormat:@"%ld",(long)items];
    self.labelForPrice.text=product.productPrice;
    self.labelForQuantity.text=product.productQuantity;
    self.imageViewForAddToCart.image = [UIImage imageNamed:@"cart_green.png"];
    self.labelForItemCount.text=quantity;
    self.backgroundColor=RGBA(225, 225, 225, 1);
}

- (IBAction)addButtonClicked:(id)sender {
    if(items<10){
    items+=1;
    }
    [self.reloadTableCellDelegate addClicked:self.itemData];
    
    
}
- (IBAction)subtractButtonClicked:(id)sender {
    if(items!=0){
    items-=1;
    }
    if([self.itemData.selectedProductQuantity isEqualToString:@"0"]){
        if([[[BlickbeeAppManager sharedInstance] selectedProducts] containsObject:self.itemData]){
        [[[BlickbeeAppManager sharedInstance] selectedProducts] removeObject:self.itemData];
        }
    }
    [self.reloadTableCellDelegate subtractClicked:self.itemData];
}
@end
