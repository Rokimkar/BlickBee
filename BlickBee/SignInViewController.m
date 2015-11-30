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
{
    BOOL securityEntry;
}
@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    securityEntry=YES;
    self.passTextField.secureTextEntry = securityEntry;
    // Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self prepareView];
    // Your layout logic here
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
    securityEntry=!securityEntry;
    self.passTextField.secureTextEntry = securityEntry;
}
- (IBAction)forgotPassword:(id)sender {
}

-(void) prepareView{
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 1;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, self.emailTxtField.frame.size.height - borderWidth, self.emailTxtField.frame.size.width, self.emailTxtField.frame.size.height);
    border.borderWidth = borderWidth;
    [self.emailTxtField.layer addSublayer:border];
    self.emailTxtField.layer.masksToBounds = YES;
    
    
    CALayer *border2 = [CALayer layer];
    border2.borderColor = [UIColor whiteColor].CGColor;
    border2.frame = CGRectMake(0, self.passTextField.frame.size.height - borderWidth, self.passTextField.frame.size.width, self.passTextField.frame.size.height);
    border2.borderWidth = borderWidth;
    [self.passTextField.layer addSublayer:border2];
    self.passTextField.layer.masksToBounds = YES;
    
    
    self.loginBtn.layer.cornerRadius = 17.0;
    self.loginBtn.layer.borderWidth = 2.0;
    self.loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;

    CALayer *border3 = [CALayer layer];
    CGFloat borderWidth3 = 1;
    border3.borderColor = [UIColor whiteColor].CGColor;
    border3.frame = CGRectMake(0, self.signUpBtn.frame.size.height - borderWidth3, self.signUpBtn.frame.size.width, self.signUpBtn.frame.size.height);
    border3.borderWidth = borderWidth3;
    [self.signUpBtn.layer addSublayer:border3];
    self.signUpBtn.layer.masksToBounds = YES;
    
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
