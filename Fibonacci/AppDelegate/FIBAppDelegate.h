//
//  AppDelegate.h
//  Fibonacci
//
//  Created by Gabriel Massana on 2/2/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Operation Queue Identifier for local operations.
 */
extern NSString *const kFIBLocalOperationQueueTypeIdentifier;

@interface FIBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

