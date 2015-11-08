//
//  BaseServiceClient.m
//  BlickBee
//
//  Created by Kunal Chelani on 11/7/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "BaseServiceClient.h"

@implementation BaseServiceClient

-(NSURL*) getBaseURL{
    
    return [NSURL URLWithString:BASE_URL_STRING];
}
-(void) printApi:(NSURL*)url{
    NSLog(@"API --- %@",url.absoluteString);
    
}
-(void) showNoNetworkAlert
{
    [[[UIAlertView alloc] initWithTitle:@"Network not available." message:@"Please check your network connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
}


@end
