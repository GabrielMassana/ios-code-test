//
//  AppDelegate.m
//  Fibonacci
//
//  Created by Gabriel Massana on 2/2/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "FIBAppDelegate.h"

#import <CoreDataFullStack/CoreDataFullStack.h>
#import <CoreOperation/CoreOperation.h>

#import "FIBTableViewFibonacciViewController.h"

NSString *const kFIBLocalOperationQueueTypeIdentifier = @"kFIBLocalOperationQueueTypeIdentifier";

@interface FIBAppDelegate () <CDFCoreDataManagerDelegate>

@end

@implementation FIBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [CDFCoreDataManager sharedInstance].delegate = self;

    /*-------------------*/

    self.window.backgroundColor = [UIColor clearColor];
    self.window.clipsToBounds = NO;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - Window

- (UIWindow *)window
{
    if (!_window)
    {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
        _window.rootViewController = [[FIBTableViewFibonacciViewController alloc] init];
    }
    
    return _window;
}

#pragma mark - CDFCoreDataManagerDelegate

- (NSString *)coreDataModelName
{
    return @"fibonacci";
}

#pragma mark - OperationQueues

- (void)registerOperationQueues
{
    //Local Background Operation Queue
    NSOperationQueue *localDataOperationQueue = [[NSOperationQueue alloc] init];
    localDataOperationQueue.qualityOfService = NSQualityOfServiceUserInteractive;
    localDataOperationQueue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount;
    
    [[COMOperationQueueManager sharedInstance] registerOperationQueue:localDataOperationQueue
                                             operationQueueIdentifier:kFIBLocalOperationQueueTypeIdentifier];
}

@end
