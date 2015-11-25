//
//  BlickbeeAppManager.m
//  BlickBee
//
//  Created by Kunal Chelani on 11/16/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "BlickbeeAppManager.h"

@implementation BlickbeeAppManager


+ (BlickbeeAppManager*)sharedInstance {
    static BlickbeeAppManager *_sharedInstance;
    if(!_sharedInstance) {
        static dispatch_once_t oncePredicate;
        dispatch_once(&oncePredicate, ^{
            _sharedInstance = [[super allocWithZone:nil] init];
            // Init the dictionary
        });
    }
    return _sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedInstance];
}

-(id)init
{
    self = [super init];
    self.user = [[User alloc] init];
    self.selectedProducts = [[NSMutableArray alloc]init];
    self.userAddresses = [[NSMutableArray alloc] init];
    return self;
    
}


- (id)copyWithZone:(NSZone *)zone {
    return self;
}

#if (!__has_feature(objc_arc))

- (id)retain {
    
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX;  //denotes an object that cannot be released
}

- (oneway void)release {
    //do nothing
}



- (id)autorelease {
    return self;
}
#endif


@end
