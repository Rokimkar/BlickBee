//
//  UserInfoViewController.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 12/27/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "UserInfoViewController.h"
#import "SWRevealViewController.h"
#import "BlickbeePrefix.pch"
#import "LoginServiceClient.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *swRevealVC = self.revealViewController;
    if(swRevealVC){
        UIImage *image =[UIImage imageNamed:@"menu.png"];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.bounds = CGRectMake(0, 0, image.size.width-40, image.size.height-40);
        self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]init];
        [btn addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:image forState:UIControlStateNormal];
        UIBarButtonItem *menuButton = [[UIBarButtonItem alloc]initWithCustomView:btn];
        self.navigationItem.leftBarButtonItem = menuButton;
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        self.revealViewController.panGestureRecognizer.delegate=self;
        self.navigationController.navigationBar.barTintColor=RGBA(246, 71, 17, 1);
        [self.navigationItem.leftBarButtonItem setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        //swRevealVC.rearViewRevealWidth=270.0f;
        //[swRevealVC revealToggleAnimated:YES];
    }
    self.user = [[BlickbeeAppManager sharedInstance]user];
    self.labelForEmail.text=self.user.email;
    self.labelForMobNumb.text=self.user.phone;
    self.textForName.text=self.user.name;
    self.title=@"My Profile";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self prepareView];
    [self.view setBackgroundColor:RGBA(235, 235, 235, 1)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) prepareView{
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 1;
    border.borderColor = [UIColor whiteColor].CGColor;
        border.frame = CGRectMake(0, self.textForName.frame.size.height - borderWidth, self.textForName.frame.size.width, self.textForName.frame.size.height);
    border.borderWidth = borderWidth;
    [self.textForName.layer addSublayer:border];
    self.textForName.layer.masksToBounds = YES;
}

- (IBAction)updateButtonClicked:(id)sender {
    NSString *name = self.textForName.text;
    LoginServiceClient *client=[[LoginServiceClient alloc]init];
    [client changeNameWithNew:name withSuccess:^{
    } failure:^(NSError *error) {
        
    }];
    
//    self.user.name = name;
//    self.textForName.text=[[BlickbeeAppManager sharedInstance]user].name;
    }
@end
