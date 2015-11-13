//
//  BaseTableView.h
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/9/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableView : UITableView
@property (weak,nonatomic) NSMutableArray *productArray;
-(id) initWithFrame:(CGRect)frame andProductsArray:(NSMutableArray*) prodsArray;
@end
