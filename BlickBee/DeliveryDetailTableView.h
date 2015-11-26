//
//  DeliveryDetailTableView.h
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/19/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddAddressTableViewCell.h"

@protocol openNewAddress <NSObject>

-(void) openNewAddress;

@end

@interface DeliveryDetailTableView : UITableView<openAddressPopUp>
-(id) initWithFrames:(CGRect)frame;
@property (nonatomic,strong) id<openNewAddress> addressDelegate;

@end
