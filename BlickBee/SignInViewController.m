//
//  SignInViewController.m
//  BlickBee
//
//  Created by Kunal Chelani on 11/15/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "SignInViewController.h"
#import "LoginServiceClient.h"
#import "SWRevealViewController.h"
#import "BlickbeeAppManager.h"
@interface SignInViewController ()

@end

@implementation SignInViewController

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

- (IBAction)loginBtn:(id)sender {
    LoginServiceClient *client = [[LoginServiceClient alloc] init];
    NSMutableDictionary *credentialsDict = [[NSMutableDictionary alloc] init];
    [credentialsDict setObject:self.emailTxtField.text forKey:@"email"];
    [credentialsDict setObject:self.passTextField.text forKey:@"password"];
    [credentialsDict setObject:@"kjhskjhaskjhasdkjsahk" forKey:@"access_token"];
    
    [client signInWithDictionary:credentialsDict WithSuccess:^(User *user) {
        
        if (user.userId && ![user.userId isEqualToString:@""]) {
            
            [[BlickbeeAppManager sharedInstance] setUser:user];
            UIStoryboard *storyBoard  = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            SWRevealViewController *cont = [storyBoard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
            [self presentViewController:cont animated:YES completion:^{
                
            }];
            
        }
        
    } failure:^(NSError *error) {
        
    }];
}

- (IBAction)showPassword:(id)sender {
}
- (IBAction)forgotPassword:(id)sender {
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
