//
//  ProductViewController.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/12/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "ProductViewController.h"
#import "CartViewController.h"
#import "BaseTableView.h"
#import "BlickBeePrefix.pch"
#import "BlickbeeAppManager.h"


@interface ProductViewController ()<chngValForFlotingBtn>{
    BaseTableView *productTableView;
}

@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    productTableView = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, getScreenWidth(), getScreenHeight()) andProductsArray:self.productArray];
    productTableView.separatorColor=[UIColor clearColor];
    productTableView.backgroundColor=RGBA(225, 225, 225, 1);
    productTableView.changeFlotingBtnDelegate=self;
    [self.view addSubview:productTableView];
    [self.view bringSubviewToFront:self.floatingBtn];
    int flotingBtnCount=0;
    for(int i=0;i<[BlickbeeAppManager sharedInstance].selectedProducts.count;i++){
        Product *product=[[Product alloc]init];
       product = [[BlickbeeAppManager sharedInstance].selectedProducts objectAtIndex:i];
        flotingBtnCount+=product.selectedProductQuantity.integerValue;
    }
    [self.floatingBtn setTitle:[NSString stringWithFormat:@"%d",flotingBtnCount] forState:UIControlStateNormal];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if(![self.floatingBtn.titleLabel.text isEqualToString:@"0"]){
    if([segue.identifier isEqualToString:@"cartViewControllerSegue"]){
        CartViewController *cartViewController = [segue destinationViewController];
        cartViewController.productArray=[[BlickbeeAppManager sharedInstance] selectedProducts];
    }
    }
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if(productTableView){
        [productTableView reloadData];
    }
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    int flotingBtnCount=0;
    for(int i=0;i<[BlickbeeAppManager sharedInstance].selectedProducts.count;i++){
        Product *product=[[Product alloc]init];
        product = [[BlickbeeAppManager sharedInstance].selectedProducts objectAtIndex:i];
        flotingBtnCount+=product.selectedProductQuantity.integerValue;
    }
    [self.floatingBtn setTitle:[NSString stringWithFormat:@"%d",flotingBtnCount] forState:UIControlStateNormal];
}


-(void)changeValOfFloatingBtn : (NSInteger) val{
    NSInteger prevVal = [self.floatingBtn.titleLabel.text integerValue];
    [self.floatingBtn setTitle:[NSString stringWithFormat:@"%ld",(long)(prevVal+val)] forState:UIControlStateNormal];
}

-(void) awakeFromNib{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
