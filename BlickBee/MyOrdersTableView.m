//
//  MyOrdersTableView.m
//  BlickBee
//
//  Created by Sanchit Kumar Singh on 11/23/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "MyOrdersTableView.h"
#import "MyOrdersTableViewCell.h"

@implementation MyOrdersTableView

-(id) initWithFrame:(CGRect)frame andProductsArray:(NSMutableArray*) prodsArray{
    
    self.dataSource=self;
    self.delegate=self;
    [self registerNib:[UINib nibWithNibName:@"MyOrdersTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyOrdersTableViewCell"];
    self.backgroundColor=RGBA(0, 0, 255, 1);
    return [self initWithFrame:frame];
}

- (NSInteger) numberOfSectionsInTableView : (UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView :(UITableView *)tableView numberOfRowsInSection:(NSInteger) section{
    return 1;
}

-(UITableViewCell *)tableView : (UITableView *)tableView cellForRowAtIndexPath : (NSIndexPath *) indexPath{
    MyOrdersTableViewCell *cell;
    return cell;
}

-(CGFloat) tableView:(UITableView *) tableView heightForHeaderInSection :(NSInteger) section{
    return 0;
}

-(CGFloat) tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}


@end
