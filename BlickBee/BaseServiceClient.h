//
//  BaseServiceClient.h
//  BlickBee
//
//  Created by Kunal Chelani on 11/7/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
//#define BASE_URL_STRING @"http://blickbee.com/ios_Testing/request.php"
#define BASE_URL_STRING @"http://blickbee.com/APIS/request.php"
@interface BaseServiceClient : NSObject
-(NSURL*) getBaseURL;
-(void) printApi:(NSURL*)url;
-(void) showNoNetworkAlert;

@end
