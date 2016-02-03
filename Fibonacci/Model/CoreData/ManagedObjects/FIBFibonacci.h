//
//  FIBFibonacci.h
//  
//
//  Created by Gabriel Massana on 2/2/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface FIBFibonacci : NSManagedObject

/**
 Fetch a FIBFibonacci with the given n.
 
 @param n - the n value of the fibonacci sequence.
 @param managedObjectContext - the Context where the fetch should be called.
 
 @return a FIBFibonacci instance.
 */
+ (instancetype)fetchFibonacciNumberWithN:(NSUInteger)n
                     managedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "FIBFibonacci+CoreDataProperties.h"
