//
//  ProductViewController.h
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/12/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductViewController : UIViewController
@property (weak,nonatomic) NSMutableArray *productArray;
@property (weak, nonatomic) IBOutlet UIButton *floatingBtn;

@end
