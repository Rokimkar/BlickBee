//
//  ChangePasswordViewController.h
//  BlickBee
//
//  Created by Kunal Chelani on 11/30/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "ViewController.h"

@interface ChangePasswordViewController : ViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *proceedBtnPressed;

@end
