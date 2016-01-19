//
//  ReferalServiceClient.h
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 1/19/16.
//  Copyright © 2016 Sanchit Kumar Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseServiceClient.h"

@interface ReferalServiceClient : BaseServiceClient

-(void) validateCodeWithDeviceId : (NSString *)deviceId withSuccess:(void (^) (User* user))success failure:(void (^) (NSError *error)) failure;


@end
