//
//  FIBFibonacci.m
//  
//
//  Created by Gabriel Massana on 2/2/16.
//
//

#import "FIBFibonacci.h"

#import <CoreDataFullStack/CoreDataFullStack.h>

@implementation FIBFibonacci

+ (instancetype)fetchFibonacciNumberWithN:(NSUInteger)n
                     managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"n == %@", @(n)];
    
    FIBFibonacci *fibonacci = [CDFRetrievalService retrieveFirstEntryForEntityClass:[FIBFibonacci class]
                                                                          predicate:predicate
                                                               managedObjectContext:managedObjectContext];
    
    return fibonacci;
}

@end
