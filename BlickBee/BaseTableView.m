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
    self.quantitySelected = [[NSMutableArray alloc] init];
    for(int i=0;i<self.productArray.count;i++){
        [self.quantitySelected addObject:@"0"];
    }
    return [self initWithFrame:frame];
}

-(void) productRecievedFromCell: (Product*) product{
    NSInteger row = [self.productArray indexOfObject:product];
    if (row>=0 && row<self.productArray.count) {
            self.quantitySelected[row]=@"1";
        [self reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:NO];
    }
//    self.indexpth = [NSIndexPath indexPathForRow:row inSection:0];
//    [indexPathArray addObject:self.indexpth];
}

-(void) addClicked:(Product *) product{
    NSInteger row = [self.productArray indexOfObject:product];
    if (row>=0 && row<self.productArray.count) {
        self.quantitySelected[row]=[NSString stringWithFormat:@"%ld",(long)([self.quantitySelected[row] integerValue]+1)];
        [self reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:NO];
    }
}
-(void) subtractClicked:(Product *) product{
    NSInteger row = [self.productArray indexOfObject:product];
    if (row>=0 && row<self.productArray.count) {
        self.quantitySelected[row]=[NSString stringWithFormat:@"%ld",(long)([self.quantitySelected[row] integerValue]-1)];
        [self reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:NO];
    }
}



- (NSInteger) numberOfSectionsInTableView : (UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView :(UITableView *)tableView numberOfRowsInSection:(NSInteger) section{
    return self.productArray.count;
}

-(UITableViewCell *)tableView : (UITableView *)tableView cellForRowAtIndexPath : (NSIndexPath *) indexPath{
    
    //productqaty >0 - addtocart
    //else - bAsetableviewcell
    
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
    if(![[self.quantitySelected objectAtIndex:indexPath.row] isEqualToString:@"0"]){
        AddToCartTableViewCell *coverCell = (AddToCartTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"AddToCartTableViewCell"];
        if(coverCell == nil){
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AddToCartTableViewCell" owner:self options:nil];
            coverCell = [nib objectAtIndex:0];
        }
        coverCell.reloadTableCellDelegate=self;
        [coverCell bindData:[self.productArray objectAtIndex:indexPath.row] andQuantityAdded:[self.quantitySelected objectAtIndex:indexPath.row]];
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
    return 105;
}


//delegate - product
//prodsarray - productid - index
//index - indexpath - reload



@end
