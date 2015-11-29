//
//  PrivacyPolicyandTermsViewController.h
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/29/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrivacyPolicyandTermsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webViewForPrivacyPolicy;
@property (strong,nonatomic) NSURL *url;
@property (strong,nonatomic) NSString *name;
@end
