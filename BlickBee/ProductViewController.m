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
#import "WYPopoverController.h"


@interface ProductViewController ()<chngValForFlotingBtn,optionSelected>{
    BaseTableView *productTableView;
    WYPopoverController *optionsPopoverController;
    UIButton *optionsBtn;
}

@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    optionsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    optionsBtn.bounds = CGRectMake(0, 0, 100, 44);
    [optionsBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [optionsBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]init];
    [optionsBtn addTarget:self action:@selector(optionsButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *optionsMenuButton = [[UIBarButtonItem alloc]initWithCustomView:optionsBtn];
    self.navigationItem.leftItemsSupplementBackButton = YES;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:optionsMenuButton, nil];
    productTableView = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, getScreenWidth(), getScreenHeight()) andProductsArray:nil];
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

-(void) setNavOptionButton{
    switch (self.deliveryOptions) {
        case kFruits:
            [optionsBtn setTitle:@"Fruits" forState:UIControlStateNormal];
            [optionsBtn setTitle:@"Fruits" forState:UIControlStateHighlighted];
            break;
        case kVegetables:
            [optionsBtn setTitle:@"Vegetables" forState:UIControlStateNormal];
            [optionsBtn setTitle:@"Vegetables" forState:UIControlStateHighlighted];
            break;
        default:
            break;
    }
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[BlickbeeAppManager sharedInstance] archiveSelectedProducts];
}

-(void) prepareView{
    
    switch (self.deliveryOptions) {
        case kFruits:
            productTableView.productArray=self.productRepo.fruitsArray;
            break;
        case kVegetables:
            productTableView.productArray=self.productRepo.vegetablesArray;
            break;
        default:
            break;
    }
    [productTableView reloadData];
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
        [self prepareView];
    }
    [self setNavOptionButton];

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


-(void)changeValOfFloatingBtn{
//    NSInteger prevVal = [self.floatingBtn.titleLabel.text integerValue];
//    [self.floatingBtn setTitle:[NSString stringWithFormat:@"%ld",(long)(prevVal+val)] forState:UIControlStateNormal];
    
    int flotingBtnCount=0;
    for(int i=0;i<[BlickbeeAppManager sharedInstance].selectedProducts.count;i++){
        Product *product=[[Product alloc]init];
        product = [[BlickbeeAppManager sharedInstance].selectedProducts objectAtIndex:i];
        flotingBtnCount+=product.selectedProductQuantity.integerValue;
    }
    [self.floatingBtn setTitle:[NSString stringWithFormat:@"%d",flotingBtnCount] forState:UIControlStateNormal];
}

-(void) awakeFromNib{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) optionsButtonPressed:(id)sender
{
    UIView *btn = (UIView *)sender;
    OptionsPopOverViewControllerTableViewController *controller = [[OptionsPopOverViewControllerTableViewController alloc] init];
    controller.optionSelectedDelegate = self;
    controller.preferredContentSize = CGSizeMake(120, 88);
    UINavigationController *contentViewController = [[UINavigationController alloc] initWithRootViewController:controller];
    optionsPopoverController = [[WYPopoverController alloc] initWithContentViewController:contentViewController];
    optionsPopoverController.delegate = self;
    optionsPopoverController.passthroughViews = @[btn];
    optionsPopoverController.popoverLayoutMargins = UIEdgeInsetsMake(10, 10, 10, 10);
    optionsPopoverController.wantsDefaultContentAppearance = NO;
    optionsPopoverController.theme.arrowBase = 16;
    optionsPopoverController.theme.arrowHeight = 8;
    [optionsPopoverController presentPopoverFromRect:btn.bounds
                                              inView:btn
                            permittedArrowDirections:WYPopoverArrowDirectionAny
                                            animated:YES
                                             options:WYPopoverAnimationOptionFadeWithScale];
}


#pragma mark - WYPopoverControllerDelegate

- (void)popoverControllerDidPresentPopover:(WYPopoverController *)controller{
    //NSLog(@"popoverControllerDidPresentPopover");
    
}

- (BOOL)popoverControllerShouldDismissPopover:(WYPopoverController *)controller{
    return YES;
}

- (void)popoverControllerDidDismissPopover:(WYPopoverController *)controller
{
    
    if (controller == optionsPopoverController)
    {
        optionsPopoverController.delegate = nil;
        optionsPopoverController = nil;
    }
    //NSLog(@"%@",[self inPagePlayerView].settingsButton.titleLabel.text);
    //NSLog(@"%@",[[SettingsManager sharedInstance] getStreamingQualityString]);
    
}

- (BOOL)popoverControllerShouldIgnoreKeyboardBounds:(WYPopoverController *)popoverController
{
    return YES;
}

- (void)popoverController:(WYPopoverController *)popoverController willTranslatePopoverWithYOffset:(float *)value
{
    // keyboard is shown and the popover will be moved up by 163 pixels for example ( *value = 163 )
    *value = 0; // set value to 0 if you want to avoid the popover to be moved
}

-(void) optionSelected:(DeliveryOptions)optionSelected{
    if (self.deliveryOptions!=optionSelected) {
        self.deliveryOptions=optionSelected;
        [self prepareView];
        [self setNavOptionButton];
    }
    [optionsPopoverController dismissPopoverAnimated:YES completion:^{
        [self popoverControllerDidDismissPopover:optionsPopoverController];
    }];
}


@end
