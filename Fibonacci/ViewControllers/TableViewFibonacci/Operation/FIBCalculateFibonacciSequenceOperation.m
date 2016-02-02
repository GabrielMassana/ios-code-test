//
//  FIBCalculateFibonacciSequenceOperation.m
//  Fibonacci
//
//  Created by Gabriel Massana on 2/2/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "FIBCalculateFibonacciSequenceOperation.h"

#import <CoreDataFullStack/CoreDataFullStack.h>

#import "FIBFibonacci.h"

@implementation FIBCalculateFibonacciSequenceOperation

#pragma mark - Identifier

@synthesize identifier = _identifier;

- (NSString *)identifier
{
    if (!_identifier)
    {
        _identifier = [NSString stringWithFormat:@"FIBCalculateFibonacciSequenceOperation"];
    }
    
    return _identifier;
}

#pragma mark - Start

- (void)start
{
    [super start];

    NSUInteger integer = NSUIntegerMax;
    NSLog(@"%@", @(integer));
    
    [self didSucceedWithResult:nil];
}

#pragma mark - Cancel

- (void)cancel
{
    [super cancel];
    
    [self didSucceedWithResult:nil];
}

@end
