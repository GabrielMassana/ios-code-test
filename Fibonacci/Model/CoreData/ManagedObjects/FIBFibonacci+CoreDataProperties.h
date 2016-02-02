//
//  FIBFibonacci+CoreDataProperties.h
//  
//
//  Created by Gabriel Massana on 2/2/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FIBFibonacci.h"

NS_ASSUME_NONNULL_BEGIN

@interface FIBFibonacci (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *n;
@property (nullable, nonatomic, retain) NSNumber *sequence;

@end

NS_ASSUME_NONNULL_END
