//
//  FIBFibonacciTableViewCell.m
//  Fibonacci
//
//  Created by Gabriel Massana on 2/2/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "FIBFibonacciTableViewCell.h"

#import "FIBFibonacci.h"

@implementation FIBFibonacciTableViewCell

- (void)updateCellWithFibonacci:(FIBFibonacci *)fibonacci
{
    //TODO: Update cell and done.
    NSLog(@"sequence = %llu", fibonacci.sequence.unsignedLongLongValue);
    NSLog(@"n        = %ld", fibonacci.n.integerValue);
}

@end
