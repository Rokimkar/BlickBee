//
//  BaseTableView.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/9/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "BaseTableView.h"
#import "BaseTableViewCell.h"
#import "product.h"
#import "UIImageView+AFNetworking.h"

@implementation BaseTableView

-(id) initWithFrame:(CGRect)frame andProductsArray:(NSMutableArray*) prodsArray{
    
    self.productArray=prodsArray;
    self.dataSource=self;
    self.delegate=self;
    [self registerNib:[UINib nibWithNibName:@"BaseTableViewCell" bundle:nil] forCellReuseIdentifier:@"BaseTableViewCell"];
    self.backgroundColor=RGBA(0, 0, 255, 1);
    return [self initWithFrame:frame];
}

- (NSInteger) numberOfSectionsInTableView : (UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView :(UITableView *)tableView numberOfRowsInSection:(NSInteger) section{
    return self.productArray.count;
}

-(UITableViewCell *)tableView : (UITableView *)tableView cellForRowAtIndexPath : (NSIndexPath *) indexPath{
    BaseTableViewCell *cell= (BaseTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"BaseTableViewCell"];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BaseTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    Product *product = [self.productArray objectAtIndex:indexPath.row];
    if([product.productImages objectAtIndex:0]){
        NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:[product.productImages objectAtIndex:0]] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
        [cell.imageViewForProduct setImageWithURLRequest:req placeholderImage:[UIImage imageNamed:@"my orders empty.png"] success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
            
            if (!request) {
                cell.imageViewForProduct.image=image;
                cell.imageViewForProduct.contentMode=UIViewContentModeScaleToFill;
            }
            else{
                
                [UIView transitionWithView:cell.imageViewForProduct duration:1.0f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    cell.imageViewForProduct.image=image;
                    cell.imageViewForProduct.contentMode=UIViewContentModeScaleToFill;
                } completion:^(BOOL finished) {
                    
                }];
            }
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        }];
    }
    cell.labelForProductName.text=product.productName;
    cell.labelForProductPrice.text=product.productPrice;
    cell.labelForProductQuantity.text=product.productQuantity;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.imageViewForCart.image=[UIImage imageNamed:@"cartadd.png"];
    cell.backgroundColor=RGBA(225, 225, 225, 1);
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

-(CGFloat) tableView:(UITableView *) tableView heightForHeaderInSection :(NSInteger) section{
    return 0;
}

-(CGFloat) tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

@end
