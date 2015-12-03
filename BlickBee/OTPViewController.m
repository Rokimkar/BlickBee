//
//  OTPViewController.m
//  BlickBee
//
//  Created by Kunal Chelani on 11/29/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "OTPViewController.h"
#import "LoginServiceClient.h"
#import "SWRevealViewController.h"
#import "ChangePasswordViewController.h"
@interface OTPViewController ()
{
    NSInteger count;
}
@end

@implementation OTPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    count=60;
    self.resendOTPBtn.userInteractionEnabled=NO;
    self.progressUpdateTimer =[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];

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

- (IBAction)verifyBtnPressed:(id)sender {
    if ([self.otpTextField.text isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"" message:@"Please enter the otp." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
        return;
    }
    LoginServiceClient *client = [[LoginServiceClient alloc] init];
    [client verifyOTPWithOTP:self.otpTextField.text WithSuccess:^(User *user) {
        UIStoryboard *storyBoard  = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        if(self.isFromSignUp){
            SWRevealViewController *cont = [storyBoard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
//            [self presentViewController:cont animated:YES completion:^{
//                
//            }];
            [self.navigationController pushViewController:cont animated:YES];
        }
        else{
            ChangePasswordViewController *cont = [storyBoard instantiateViewControllerWithIdentifier:@"ChangePasswordViewController"];
//            [self presentViewController:cont animated:YES completion:^{
//            }];
            [self.navigationController pushViewController:cont animated:YES];
        }
    } failure:^(NSError *error) {
        
    }];
}
-(void) updateProgress:(NSTimer *)updatedTimer{
    if (count>0) {
        [self.resendOTPBtn setTitle:[NSString stringWithFormat:@"%ld",(long)count] forState:UIControlStateNormal];
        [self.resendOTPBtn setTitle:[NSString stringWithFormat:@"%ld",(long)count] forState:UIControlStateHighlighted];
        self.resendOTPBtn.userInteractionEnabled=NO;
        count--;
    }
    else{
        [self.resendOTPBtn setTitle:@"Resend OTP" forState:UIControlStateNormal];
        [self.resendOTPBtn setTitle:@"Resend OTP" forState:UIControlStateHighlighted];
        self.resendOTPBtn.userInteractionEnabled=YES;
        [self.progressUpdateTimer invalidate];
        self.progressUpdateTimer=nil;
    }
}

- (IBAction)resendOtp:(id)sender {
    LoginServiceClient *client = [[LoginServiceClient alloc] init];
    [client resendOTPWithSuccess:^{
        
    } failure:^(NSError *error) {
        
    }];
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
