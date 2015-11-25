//
//  BaseTableView.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/9/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "BaseTableView.h"
#import "BaseTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "BlickbeePrefix.pch"
#import "Product.h"
#import "AddToCartTableViewCell.h"

@interface BaseTableView() <reloadTable,productProtocolDelegate>{
    
}
@end

@implementation BaseTableView{
    NSMutableArray *indexPathArray;
}

-(id) initWithFrame:(CGRect)frame andProductsArray:(NSMutableArray*) prodsArray{
    
    self.productArray=prodsArray;
    self.dataSource=self;
    self.delegate=self;
    [self registerNib:[UINib nibWithNibName:@"BaseTableViewCell" bundle:nil] forCellReuseIdentifier:@"BaseTableViewCell"];
    self.backgroundColor=RGBA(0, 0, 255, 1);
    indexPathArray = [[NSMutableArray alloc]init];
    return [self initWithFrame:frame];
}

-(void) productRecievedFromCell: (Product*) product{
    NSInteger row = [self.productArray indexOfObject:product];
    if (row>=0 && row<self.productArray.count) {
        product.selectedProductQuantity=@"1";
        [self reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }
//    self.indexpth = [NSIndexPath indexPathForRow:row inSection:0];
//    [indexPathArray addObject:self.indexpth];
}

-(void) addClicked:(Product *) product{
    NSInteger row = [self.productArray indexOfObject:product];
    if (row>=0 && row<self.productArray.count) {
        product.selectedProductQuantity=[NSString stringWithFormat:@"%ld",(long)([product.selectedProductQuantity integerValue]+1)];
        [self reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }
}
-(void) subtractClicked:(Product *) product{
    NSInteger row = [self.productArray indexOfObject:product];
    if (row>=0 && row<self.productArray.count) {
        if(![product.selectedProductQuantity isEqualToString:@"0"]){
        product.selectedProductQuantity=[NSString stringWithFormat:@"%ld",(long)([product.selectedProductQuantity integerValue]-1)];
        [self reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
        }
    }
}



- (NSInteger) numberOfSectionsInTableView : (UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView :(UITableView *)tableView numberOfRowsInSection:(NSInteger) section{
    return self.productArray.count+1;
}

-(UITableViewCell *)tableView : (UITableView *)tableView cellForRowAtIndexPath : (NSIndexPath *) indexPath{
    
    //productqaty >0 - addtocart
    //else - bAsetableviewcell
    
    if (indexPath.row==self.productArray.count) {
        
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.backgroundColor = RGBA(225, 225, 225, 1);
        return cell;
    }
    
    
    BaseTableViewCell *cell= (BaseTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"BaseTableViewCell"];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BaseTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    Product *product = [self.productArray objectAtIndex:indexPath.row];
       cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.productDelegate=self;
   // cell.imageViewForCart.image=[UIImage imageNamed:@"cartadd.png"];
    [cell bindData:product];
    if(![product.selectedProductQuantity isEqualToString:@"0"]){
        AddToCartTableViewCell *coverCell = (AddToCartTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"AddToCartTableViewCell"];
        if(coverCell == nil){
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AddToCartTableViewCell" owner:self options:nil];
            coverCell = [nib objectAtIndex:0];
        }
        coverCell.reloadTableCellDelegate=self;
        [coverCell bindData:[self.productArray objectAtIndex:indexPath.row] andQuantityAdded:product.selectedProductQuantity];
        coverCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return coverCell;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

-(CGFloat) tableView:(UITableView *) tableView heightForHeaderInSection :(NSInteger) section{
    return 0;
}

-(CGFloat) tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELL_HEIGHT;
}

@end
