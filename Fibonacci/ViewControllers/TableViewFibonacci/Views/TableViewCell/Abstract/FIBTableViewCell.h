//
//  FIBTableViewCell.h
//  Fibonacci
//
//  Created by Gabriel Massana on 2/2/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FIBTableViewCell : UITableViewCell

+ (NSString *)reuseIdentifier;

- (void)layoutByApplyingConstraints;

@end
