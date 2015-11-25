//
//  MyOrdersTableView.h
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/23/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrdersTableView : UITableView

-(id) initWithFrame:(CGRect)frame andOrdersArray:(NSMutableArray*) ordersArray;

@property (nonatomic,strong) NSMutableArray *myOrdersArray;

@end
