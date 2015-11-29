//
//  ChangePasswordViewController.m
//  BlickBee
//
//  Created by Kunal Chelani on 11/30/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "LoginServiceClient.h"
@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{// return NO to disallow editing.
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField*)aTextField
{
    [aTextField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
}
- (IBAction)proceedBtnPressed:(id)sender {
    NSString *msg=@"";
    if ([self.passwordTextField.text isEqualToString:@""]) {
        msg=@"Please enter the password.";
    }
    if ([self.confirmPasswordTextField.text isEqualToString:@""]) {
        msg=@"Please confirm the password.";
    }
    if (![self.passwordTextField.text isEqualToString:self.confirmPasswordTextField.text]) {
        msg=@"The confirmed password do not match with the password entered";
    }
    if (![msg isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return;
    }
    
//    [self.navigationController popToRootViewControllerAnimated:YES];

    
//    LoginServiceClient *client = [[LoginServiceClient alloc] init];
//    [client changePasswordWithNewPassword:self.passwordTextField.text withSuccess:^{
//    } failure:^(NSError *error) {
//    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
