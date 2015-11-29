//
//  OTPViewController.h
//  BlickBee
//
//  Created by Kunal Chelani on 11/29/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "ViewController.h"

@interface OTPViewController : ViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *otpTextField;
@property (weak, nonatomic) IBOutlet UIButton *verifyOTPBtn;
@property (weak, nonatomic) IBOutlet UIButton *resendOTPBtn;
@property (strong,nonatomic) NSTimer *progressUpdateTimer;

@end
