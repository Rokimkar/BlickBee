//
//  HomeViewController.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/4/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "HomeViewController.h"
#import "SWRevealViewController.h"
#import "TopZoneView.h"
#import "ProductsServiceClient.h"
#import "TopZoneCollectionViewCell.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *swRevealVC = self.revealViewController;
    if(swRevealVC){
        UIImage *image =[UIImage imageNamed:@"menu.png"];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.bounds = CGRectMake(0, 0, image.size.width-30, image.size.height-30);
        self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]init];
        [btn addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:image forState:UIControlStateNormal];
        UIBarButtonItem *menuButton = [[UIBarButtonItem alloc]initWithCustomView:btn];
//        [self.navigationItem.leftBarButtonItem setTarget: self.revealViewController];
//        [self.navigationItem.leftBarButtonItem setAction: @selector( revealToggle: )];
        self.navigationItem.leftBarButtonItem = menuButton;
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        self.revealViewController.panGestureRecognizer.delegate=self;
        self.navigationController.navigationBar.barTintColor=RGBA(246, 71, 17, 1);
        swRevealVC.rearViewRevealWidth=270.0f;
        [self.homeTableView registerNib:[UINib nibWithNibName:@"TopZoneCollectionViewCell" bundle:nil] forCellReuseIdentifier:@"TopZoneCollectionViewCell"];
        ProductsServiceClient *client = [[ProductsServiceClient alloc] init];
        [client fetchProdctRepoWithSuccess:^(ProductRepo *repo) {
            self.productRepo=repo;
            [self.homeTableView reloadData];
        } failure:^(NSError *error) {
            
        }];
    }
    self.title = @"BlickBee";
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //self.navigationItem.leftBarButtonItem=[UIBarButtonItem alloc]init
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    if (indexPath.section==0) {
        TopZoneView *topZoneView = [[TopZoneView alloc] initWithFrame:CGRectMake(0, 0, getScreenWidth(), getScreenWidth()*288.0/720.0) andItems:self.productRepo.offersArray];
        [cell addSubview:topZoneView];
    }
    else if(indexPath.section==1){
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, getScreenWidth(), getScreenWidth()*192/320)];
        [imgView setContentMode:UIViewContentModeScaleAspectFit];
        imgView.image = [UIImage imageNamed:@"fruits_vector"];
        [cell addSubview:imgView];
    }
    else if(indexPath.section==2){
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, getScreenWidth(), getScreenWidth()*192/320)];
        [imgView setContentMode:UIViewContentModeScaleAspectFit];
        imgView.image = [UIImage imageNamed:@"veg_vector"];
        [cell addSubview:imgView];
    }
    [cell setBackgroundColor:[UIColor whiteColor]];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return getScreenWidth()*288.0/720.0;
    }
    else
        return getScreenWidth()*192.0/320.0;

}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    if (section==0 || section==1) {
//        return 10;
//    }
//    return 0;
//}

//section=1 fruit section=2 vegetable

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
