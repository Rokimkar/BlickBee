//
//  BlickbeeAppManager.m
//  BlickBee
//
//  Created by Kunal Chelani on 11/16/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "BlickbeeAppManager.h"
#import "Archiver.h"
#import "SelectedProductRepo.h"
#import "Product.h"
@implementation BlickbeeAppManager



+ (BlickbeeAppManager*)sharedInstance {
    static BlickbeeAppManager *_sharedInstance;
    if(!_sharedInstance) {
        static dispatch_once_t oncePredicate;
        dispatch_once(&oncePredicate, ^{
            _sharedInstance = [[super allocWithZone:nil] init];
            // Init the dictionary
        });
    }
    return _sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedInstance];
}

-(id)init
{
    self = [super init];
    self.user = [[User alloc] init];
//    self.selectedProducts = [[NSMutableArray alloc]init];
    self.userAddresses = [[NSMutableArray alloc] init];
    self.regionsArray = [[NSMutableArray alloc] init];
    [self readDataFromArchiver];
    return self;
    
}


- (id)copyWithZone:(NSZone *)zone {
    return self;
}

#if (!__has_feature(objc_arc))

- (id)retain {
    
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX;  //denotes an object that cannot be released
}

- (oneway void)release {
    //do nothing
}



- (id)autorelease {
    return self;
}
#endif

//
//-(void) setSelectedProducts:(NSMutableArray *)selectedProducts{
//    _selectedProducts=selectedProducts;
//    [self archiveSelectedProducts];
//}

-(void) archiveSelectedProducts{
    SelectedProductRepo *selectedProductRepo = [[SelectedProductRepo alloc] init];
    selectedProductRepo.selectedProdsArray=_selectedProducts;
    BOOL fileSaved = [Archiver persist:selectedProductRepo key:@"SelectedProductRepo"];
    if (fileSaved) {
        NSLog(@"SelectedProductRepo saved");
    }
    else{
        NSLog(@"SelectedProductRepo not saved");
    }
}

-(void) readDataFromArchiver
{
    SelectedProductRepo *productRepo = [Archiver retrieve:@"SelectedProductRepo"];
    _selectedProducts=productRepo.selectedProdsArray;
    if (!_selectedProducts) {
        _selectedProducts = [[NSMutableArray alloc] init];
    }
}

-(void) matchSelectedProductsWithNewProductRepo:(ProductRepo*)productRepo{
    
    if (self.selectedProducts && self.selectedProducts.count>0) {
        
        for (Product* selectedProduct in self.selectedProducts) {
            
            if ([selectedProduct.productCatId isEqualToString:@"1"]) {
                //veg
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"productId == %@",selectedProduct.productId];
                NSArray* array = [productRepo.vegetablesArray filteredArrayUsingPredicate:predicate];
                if (array && array.count>0) {
                    [self updateProduct:[array objectAtIndex:0] withSelectedProduct:selectedProduct];
                }
            }
            else if ([selectedProduct.productCatId isEqualToString:@"2"]) {
                //fruits
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"productId == %@",selectedProduct.productId];
                NSArray* array = [productRepo.fruitsArray filteredArrayUsingPredicate:predicate];
                if (array && array.count>0) {
                    [self updateProduct:[array objectAtIndex:0] withSelectedProduct:selectedProduct];
                }
            }
        }
    }
}

-(void) updateProduct:(Product*)fetchedProduct withSelectedProduct:(Product*)selectedProduct{
    fetchedProduct.selectedProductQuantity=selectedProduct.selectedProductQuantity;
    selectedProduct=fetchedProduct;
}

@end
