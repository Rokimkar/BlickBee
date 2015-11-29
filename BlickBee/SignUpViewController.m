//
//  SignUpViewController.m
//  BlickBee
//
//  Created by Kunal Chelani on 11/15/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "SignUpViewController.h"
#import "LoginServiceClient.h"
#import "BlickbeeAppManager.h"
#import "SWRevealViewController.h"
#import "OTPViewController.h"
@interface SignUpViewController ()

@end

@implementation SignUpViewController

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


- (IBAction)signUpBtn:(id)sender {
    
    LoginServiceClient *client = [[LoginServiceClient alloc] init];
    NSMutableDictionary *credentialsDict = [[NSMutableDictionary alloc] init];
    [credentialsDict setObject:self.emailTextField.text forKey:@"email"];
    [credentialsDict setObject:self.passwordTextField.text forKey:@"password"];
    [credentialsDict setObject:@"kjhskjhaskjhasdkjsahk" forKey:@"access_token"];
    [credentialsDict setObject:self.phoneTextField.text forKey:@"phone"];
    [credentialsDict setObject:self.nameTextField.text forKey:@"name"];
    [credentialsDict setObject:@"kjhskjhaskjhasdkjsahk" forKey:@"device_id"];
    
    [client signUpWithDictionary:credentialsDict WithSuccess:^(User *user) {
        
        if (user.userId && ![user.userId isEqualToString:@""]) {
            
            [[BlickbeeAppManager sharedInstance] setUser:user];
            UIStoryboard *storyBoard  = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//            SWRevealViewController *cont = [storyBoard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
            OTPViewController *cont = [storyBoard instantiateViewControllerWithIdentifier:@"OTPViewController"];
            [self presentViewController:cont animated:YES completion:^{
                
            }];
            
        }
        
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
