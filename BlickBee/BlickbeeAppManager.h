//
//  BlickbeeAppManager.h
//  BlickBee
//
//  Created by Kunal Chelani on 11/16/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "HomeViewController.h"
#import "SWRevealViewController.h"
@interface BlickbeeAppManager : NSObject

+ (BlickbeeAppManager*)sharedInstance;
@property (nonatomic,strong) User *user;
@property (nonatomic,strong) NSMutableArray *selectedProducts;
@property (nonatomic,strong) NSMutableArray *userAddresses;
@property (nonatomic,strong) NSMutableArray *regionsArray;
@property (nonatomic,strong) HomeViewController *homeViewController;

-(void) archiveSelectedProducts;

-(NSMutableArray*) updateWithNewSearchedArray:(NSMutableArray*) repoArray;

-(void) getSelectedProductsArrayWithUpdatedPricesWithCompletionBlock:(void(^)(bool success, NSMutableArray* selectedProdsArray))completionBlock;

@end
