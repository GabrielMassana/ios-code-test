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
    self.textLabel.text = [NSString stringWithFormat:@"F(%@): %llu", fibonacci.n, fibonacci.sequence.unsignedLongLongValue];
}

@end
