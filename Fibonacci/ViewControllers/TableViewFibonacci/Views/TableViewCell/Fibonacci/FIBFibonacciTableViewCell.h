//
//  FIBFibonacciTableViewCell.h
//  Fibonacci
//
//  Created by Gabriel Massana on 2/2/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "FIBTableViewCell.h"

@class FIBFibonacci;

@interface FIBFibonacciTableViewCell : FIBTableViewCell

/**
 Updates the cell with the givem fibonacci object.
 
 @param fibonacci - the fibonacci object to update the cell.
 */
- (void)updateCellWithFibonacci:(FIBFibonacci *)fibonacci;

@end
