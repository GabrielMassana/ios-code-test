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

- (void)updateCellWithFibonacci:(FIBFibonacci *)fibonacci;

@end
