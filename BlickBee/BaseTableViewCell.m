//
//  BaseTableViewCell.m
//  
//
//  Created by Sanchit Kumar Singh on 11/9/15.
//
//

#import "BaseTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "BlickbeeAppManager.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addToCartClicked:(id)sender {
    
    //delegate - product
    [self.productDelegate productRecievedFromCell:self.item];
    if(![[[BlickbeeAppManager sharedInstance] selectedProducts] containsObject:self.item]){
    [[[BlickbeeAppManager sharedInstance] selectedProducts] addObject:self.item];
    }
}


//bind- product
-(void) bindData:(Product*)product{
    self.item=product;
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
    
    self.labelForProductPrice.text=product.productPrice;
    self.labelForProductQuantity.text=product.productQuantity;
    [self.addToCartClicked setBackgroundImage:[UIImage imageNamed:@"cartadd.png"] forState:UIControlStateNormal];
    
    self.backgroundColor=RGBA(225, 225, 225, 1);
}

@end
