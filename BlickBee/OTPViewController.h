//
//  OTPViewController.h
//  BlickBee
//
//  Created by Kunal Chelani on 11/29/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "ViewController.h"
#import "BaseViewController.h"
@interface OTPViewController : BaseViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *otpTextField;
@property (weak, nonatomic) IBOutlet UIButton *verifyOTPBtn;
@property (weak, nonatomic) IBOutlet UIButton *resendOTPBtn;
@property (strong,nonatomic) NSTimer *progressUpdateTimer;
@property (strong,nonatomic) NSString *phoneNumber;
@property (assign,nonatomic) BOOL isFromSignUp;
@property (assign,nonatomic) BOOL isForgotPassword;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topSpaceConstraint;

@end
