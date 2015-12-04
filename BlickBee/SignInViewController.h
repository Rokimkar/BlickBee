//
//  SignInViewController.h
//  BlickBee
//
//  Created by Kunal Chelani on 11/15/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignInViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailTxtField;
@property (weak, nonatomic) IBOutlet UITextField *passTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *signUpBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centreYConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topSpaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *smallWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bigWidthConstraint;

@end
