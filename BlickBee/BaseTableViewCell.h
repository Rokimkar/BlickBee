//
//  BaseTableViewCell.h
//  
//
//  Created by Sanchit Kumar Singh on 11/9/15.
//
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewForProduct;
@property (weak, nonatomic) IBOutlet UILabel *labelForProductName;
@property (weak, nonatomic) IBOutlet UILabel *labelForProductPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelForProductQuantity;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewForCart;

@end
