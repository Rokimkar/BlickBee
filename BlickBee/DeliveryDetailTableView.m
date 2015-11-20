//
//  DeliveryDetailTableView.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/19/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "DeliveryDetailTableView.h"
#import "DeliveryDetailTableViewCell.h"
#import "DeliveryTimeTableViewCell.h"

@implementation DeliveryDetailTableView

-(id) initWithFrames:(CGRect)frame{
    
    self.dataSource=self;
    self.delegate=self;
    [self registerNib:[UINib nibWithNibName:@"DeliveryDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"DeliveryDetailTableViewCell"];
    [self registerNib:[UINib nibWithNibName:@"DeliveryTimeTableViewCell" bundle:nil] forCellReuseIdentifier:@"DeliveryTimeTableViewCell"];
    self.backgroundColor=RGBA(225, 225, 225, 1);
    return [self initWithFrame:frame];
}

- (NSInteger) numberOfSectionsInTableView : (UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView :(UITableView *)tableView numberOfRowsInSection:(NSInteger) section{
    return 2;
}

-(UITableViewCell *)tableView : (UITableView *)tableView cellForRowAtIndexPath : (NSIndexPath *) indexPath{
    DeliveryDetailTableViewCell *cell = (DeliveryDetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DeliveryDetailTableViewCell"];
    if(cell==nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DeliveryDetailTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    if(indexPath.row==0){
    }
    else if(indexPath.row==1){
        DeliveryTimeTableViewCell *cell = (DeliveryTimeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DeliveryTimeTableViewCell"];
        if(cell==nil){
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DeliveryTimeTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        return cell;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

-(CGFloat) tableView:(UITableView *) tableView heightForHeaderInSection :(NSInteger) section{
    return 0;
}

-(CGFloat) tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==1){
        return 110;
    }
    return 90;
}

@end
