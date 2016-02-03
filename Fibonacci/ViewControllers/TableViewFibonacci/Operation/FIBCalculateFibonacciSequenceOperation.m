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

@interface FIBCalculateFibonacciSequenceOperation ()

/**
 Check if a sum with unsigned integers will cause integer overflow.
 
 @param first - first integer to be added.
 @param second - second integer to be added.
 
 @return YES if the sum will overflow, NO otherwise.
 */
- (BOOL)integerWillOverflow:(NSUInteger)first second:(NSUInteger)second;

@end

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

    __block NSUInteger fibonacci = 0;
    __block NSUInteger first = 0;
    __block NSUInteger second = 1;
    
    __weak typeof(self) weakSelf = self;

    [[CDFCoreDataManager sharedInstance].backgroundManagedObjectContext performBlockAndWait:^
     {
         for (NSUInteger n = 0 ; n < NSUIntegerMax ; n++)
         {
             // calculate Fibonnaci numbers
             if (n <= 1)
             {
                 fibonacci = n;
             }
             else
             {
                 if ([weakSelf integerWillOverflow:first second:second])
                 {
                     break;
                 }
                 else
                 {
                     fibonacci = first + second;
                     first = second;
                     second = fibonacci;
                 }
             }
             
             //Create Core Data objects
             FIBFibonacci *newFibonacci = [FIBFibonacci fetchFibonacciNumberWithN:n
                                                             managedObjectContext:[CDFCoreDataManager sharedInstance].backgroundManagedObjectContext];
             
             if (!newFibonacci)
             {
                 newFibonacci = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([FIBFibonacci class])
                                                              inManagedObjectContext:[CDFCoreDataManager sharedInstance].backgroundManagedObjectContext];
             }
             
             newFibonacci.n = @(n);
             newFibonacci.sequence = @(fibonacci);
         }
         
         [[CDFCoreDataManager sharedInstance].backgroundManagedObjectContext save:nil];
     }];
    
    [self didSucceedWithResult:@(fibonacci)];
}

#pragma mark - Overflow

- (BOOL)integerWillOverflow:(NSUInteger)first second:(NSUInteger)second
{
    BOOL willOverflow = NO;
    
    if (first > 0 &&
        second > NSUIntegerMax - first)
    {
        willOverflow = YES;
    }
    
    return willOverflow;
}

#pragma mark - Cancel

- (void)cancel
{
    [super cancel];
    
    [self didSucceedWithResult:nil];
}

@end
