//
//  BlickbeeAppManager.h
//  BlickBee
//
//  Created by Kunal Chelani on 11/16/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface BlickbeeAppManager : NSObject

+ (BlickbeeAppManager*)sharedInstance;
@property (nonatomic,strong) User *user;

@end
