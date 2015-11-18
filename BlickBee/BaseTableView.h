//
//  BaseTableView.h
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/9/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#define CELL_HEIGHT 105

@interface BaseTableView : UITableView
-(id) initWithFrame:(CGRect)frame andProductsArray:(NSMutableArray*) prodsArray;

@property (strong,nonatomic) NSMutableArray *productArray;
@property (strong,nonatomic) NSIndexPath *indexpth;
@end
