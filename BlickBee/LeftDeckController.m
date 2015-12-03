//
//  LeftDeckController.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/4/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "LeftDeckController.h"
#import "LeftDeckTableViewCell.h"
#import "BlickbeePrefix.pch"
#import "MyOrdersViewController.h"
#import "iRate.h"
#import "SWRevealViewController.h"
#import "HomeViewController.h"
#import "BlickbeeAppManager.h"
#import "AccountSettingsViewController.h"
#import "ShareViewController.h"
#import "AboutUsViewController.h"
#import "SignInViewController.h"
@interface LeftDeckController (){
    NSArray *itemsArray;
    NSArray *imageArray;
    CGSize screenSize;
    NSString *selectedCategory;
    NSArray *subCategoriesArray;
}

@end

@implementation LeftDeckController

- (void)viewDidLoad {
    [super viewDidLoad];
    screenSize=([UIScreen mainScreen]).bounds.size;
    itemsArray = [[NSArray alloc]initWithObjects:@"Home",@"My Orders",@"Account Settings",@"Notification",@"Customer Service",@"Rate Us",@"Share",@"About Us",@"LogOut",nil];
    imageArray = [[NSArray alloc]initWithObjects:@"home.png",@"my_orders.png",@"settings.png",@"notifications.png",@"customerservice.png",@"rateus.png",@"share.png",@"customerservice.png", @"power17.png",nil];
    // Do any additional setup after loading the view.
    [self.itemListingTableView registerNib:[UINib nibWithNibName:@"LeftDeckTableViewCell" bundle:nil] forCellReuseIdentifier:@"LeftDeckTableViewCell"];
    self.itemListingTableView.scrollEnabled=NO;
    self.itemListingTableView.separatorColor=[UIColor clearColor];
    self.view.backgroundColor=RGBA(232, 233, 232, 1);
    self.itemListingTableView.backgroundView=nil;
    self.itemListingTableView.backgroundColor=RGBA(232, 233, 232, 1);
}

- (NSInteger) numberOfSectionsInTableView : (UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView :(UITableView *)tableView numberOfRowsInSection:(NSInteger) section{
        return itemsArray.count;
}

-(UITableViewCell *)tableView : (UITableView *)tableView cellForRowAtIndexPath : (NSIndexPath *) indexPath{
    LeftDeckTableViewCell *cell= (LeftDeckTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"LeftDeckTableViewCell"];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LeftDeckTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
        cell.labelForDeckItem.text=[itemsArray objectAtIndex:indexPath.row];
        cell.imageForDeckItem.image=[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
        if(indexPath.row>4){
            cell.backgroundColor=RGBA(232,233, 232, 1);
        }
    return cell;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 15)];
    [headerView setBackgroundColor:RGBA(255, 255, 255, 1)];
    return headerView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SWRevealViewController *revealVC = self.revealViewController;
    
    if (indexPath.row==0){
        HomeViewController *homeVC = [BlickbeeAppManager sharedInstance].homeViewController;
        UINavigationController *NVC = [[UINavigationController alloc]initWithRootViewController:homeVC];
        NVC.navigationBar.barTintColor=RGBA(247, 71, 17, 1);
        [revealVC revealToggle:homeVC];
        [revealVC setFrontViewController:NVC];
    }
    else if(indexPath.row==1){
        MyOrdersViewController *myOrderVC = [storyboard instantiateViewControllerWithIdentifier:@"MyOrdersViewController"];
        UINavigationController *NVC = [[UINavigationController alloc]initWithRootViewController:myOrderVC];
        [revealVC setFrontViewController:NVC];
    }
    else if(indexPath.row==2){
        AccountSettingsViewController *myOrderVC = [storyboard instantiateViewControllerWithIdentifier:@"AccountSettingsViewController"];
        UINavigationController *NVC = [[UINavigationController alloc]initWithRootViewController:myOrderVC];
        [revealVC setFrontViewController:NVC];
    }
    else if(indexPath.row==4){
        NSString *string = @"8386068784";
        NSURL *phoneUrl = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@",string]];
        if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
            [[UIApplication sharedApplication] openURL:phoneUrl];
        } else
        {
            UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [calert show];
        }
    }
    else if(indexPath.row==5){
        [[iRate sharedInstance]promptForRating];
    }
    else if (indexPath.row==6){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ShareViewController *shareCont = [storyboard instantiateViewControllerWithIdentifier:@"ShareViewController"];
        UINavigationController *NVC = [[UINavigationController alloc]initWithRootViewController:shareCont];
        [revealVC setFrontViewController:NVC];
    }

    else if(indexPath.row==7){
        AboutUsViewController *abtUsVC = [storyboard instantiateViewControllerWithIdentifier:@"AboutUsViewController"];
        UINavigationController *NVC = [[UINavigationController alloc]initWithRootViewController:abtUsVC];
        NVC.navigationBar.barTintColor=RGBA(247, 71, 17, 1);
        //[revealVC revealToggle:abtUsVC];
        [revealVC setFrontViewController:NVC animated:YES];
    }
    else if(indexPath.row==8){
        [BlickbeeAppManager sharedInstance].user = [[User alloc] init];
        if (revealVC) {
            [revealVC.navigationController popToRootViewControllerAnimated:YES];
        }
        else{
            UIStoryboard *storyBoard  = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            SignInViewController *cont = [storyBoard instantiateViewControllerWithIdentifier:@"SignInViewController"];
            [self presentViewController:cont animated:YES completion:^{
                
            }];
        }
    }
}

- (CGFloat) tableView: (UITableView *)
tableView heightForRowAtIndexPath: (NSIndexPath *)indexPath{
    return 48;
}

-(CGFloat) tableView:(UITableView *) tableView heightForHeaderInSection :(NSInteger) section{
    return 15;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
