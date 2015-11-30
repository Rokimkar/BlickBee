//
//  DeliveryDetailTableView.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/19/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "DeliveryDetailTableView.h"

@implementation DeliveryDetailTableView

-(id) initWithFrames:(CGRect)frame{
    
    self.dataSource=self;
    self.delegate=self;
    [self registerNib:[UINib nibWithNibName:@"DeliveryDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"DeliveryDetailTableViewCell"];
    [self registerNib:[UINib nibWithNibName:@"DeliveryTimeTableViewCell" bundle:nil] forCellReuseIdentifier:@"DeliveryTimeTableViewCell"];
    [self registerNib:[UINib nibWithNibName:@"AddAddressTableViewCell" bundle:nil] forCellReuseIdentifier:@"AddAddressTableViewCell"];
    self.backgroundColor=RGBA(225, 225, 225, 1);
    return [self initWithFrame:frame];
}

- (NSInteger) numberOfSectionsInTableView : (UITableView *)tableView{
    return 2;
}

-(NSInteger) tableView :(UITableView *)tableView numberOfRowsInSection:(NSInteger) section{
    if(section==1){
        if ([BlickbeeAppManager sharedInstance].userAddresses.count==2) {
            return [BlickbeeAppManager sharedInstance].userAddresses.count;
        }
        else{
            return [BlickbeeAppManager sharedInstance].userAddresses.count+1;
        }
    }
    return 2;
}

-(UITableViewCell *)tableView : (UITableView *)tableView cellForRowAtIndexPath : (NSIndexPath *) indexPath{
    UITableViewCell *cell;
    if(indexPath.row==0 && indexPath.section==0){
      DeliveryDetailTableViewCell  *cellOne = (DeliveryDetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DeliveryDetailTableViewCell"];
        if(cellOne==nil){
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DeliveryDetailTableViewCell" owner:self options:nil];
            cellOne = [nib objectAtIndex:0];
        }
        cellOne.imageViewFordeliveryDetail.image=[UIImage imageNamed:@"2_a.png"];
        return  cellOne;
    }
    else if(indexPath.row==1 && indexPath.section==0){
        cell = (DeliveryTimeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DeliveryTimeTableViewCell"];
        if(cell==nil){
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DeliveryTimeTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
    }
    if (indexPath.section==1){
        if ([BlickbeeAppManager sharedInstance].userAddresses.count==0) {
            cell = (AddAddressTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"AddAddressTableViewCell"];
            if(cell==nil){
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AddAddressTableViewCell" owner:self options:nil];
                cell = [nib objectAtIndex:0];
            }
            ((AddAddressTableViewCell *)cell).addressDelegate=self;
        }
        else if ([BlickbeeAppManager sharedInstance].userAddresses.count==1) {
            if (indexPath.row==0){
                cell = (DeliveryAddressTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DeliveryAddressTableViewCell"];
                if(cell==nil){
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DeliveryAddressTableViewCell" owner:self options:nil];
                    cell = [nib objectAtIndex:0];
                }
                ((DeliveryAddressTableViewCell *)cell).editBtnDelegate=self;

                [((DeliveryAddressTableViewCell*)cell) bindData:[[BlickbeeAppManager sharedInstance].userAddresses objectAtIndex:indexPath.row]];
            }
            else{
                cell = (AddAddressTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"AddAddressTableViewCell"];
                if(cell==nil){
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AddAddressTableViewCell" owner:self options:nil];
                    cell = [nib objectAtIndex:0];
                }
                ((AddAddressTableViewCell *)cell).addressDelegate=self;
            }
        }
        else if ([BlickbeeAppManager sharedInstance].userAddresses.count==2) {
            cell = (DeliveryAddressTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DeliveryAddressTableViewCell"];
            if(cell==nil){
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DeliveryAddressTableViewCell" owner:self options:nil];
                cell = [nib objectAtIndex:0];
            }
            ((DeliveryAddressTableViewCell *)cell).editBtnDelegate=self;
            [((DeliveryAddressTableViewCell*)cell) bindData:[[BlickbeeAppManager sharedInstance].userAddresses objectAtIndex:indexPath.row]];
        }
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *header=@"Select delivery address :";
    return header;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

-(CGFloat) tableView:(UITableView *) tableView heightForHeaderInSection :(NSInteger) section{
    if(section==1){
        return 35;
    }
    return 0;
}

-(CGFloat) tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==1&&indexPath.section==0){
        return 110;
    }
    if(indexPath.section==1){
            if ([BlickbeeAppManager sharedInstance].userAddresses.count==0) {
                return 70;
            }
            else if ([BlickbeeAppManager sharedInstance].userAddresses.count==1) {
                if (indexPath.row==0){
                    return 150;
                }
                else{
                    return 70;
                }
            }
            else if ([BlickbeeAppManager sharedInstance].userAddresses.count==2) {
                return 150;
            }
    }
    return 90;
}
-(void) openAddressPopUp{
    [self.addressDelegate openNewAddress];
}
-(void) editBtnClickedWith:(Address*)address{
    [self.addressDelegate editAddressWithPrevAddress:address];
}
-(void) removeBtnClicked{
    [self reloadData];
}


@end
