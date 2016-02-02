//
//  ViewController.m
//  Fibonacci
//
//  Created by Gabriel Massana on 2/2/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "FIBTableViewFibonacciViewController.h"

#import <CoreDataFullStack/CoreDataFullStack.h>
#import <PureLayout/PureLayout.h>

#import "FIBFibonacci.h"
#import "FIBFibonacciTableViewCell.h"

@interface FIBTableViewFibonacciViewController () <UITableViewDataSource, UITableViewDelegate, CDFTableViewFetchedResultsControllerDelegate>

/**
 The table view to display the fibonacci sequence.
 */
@property (nonatomic, strong) UITableView *tableView;

/**
 Fetch result controller to handle table view updates.
 */
@property (nonatomic, strong) CDFTableViewFetchedResultsController *fetchedResultsController;

/**
 Sort descriptors for the fetch request of the FRC.
 */
@property (nonatomic, strong) NSArray *sortDescriptorsForFetchRequest;

/**
 Fetch request of the FRC.
 */
@property (nonatomic, strong) NSFetchRequest *fetchRequest;

/**
 Register cell classes to be used on the table view.
 */
- (void)registerCells;

/**
 Request new data.
 */
- (void)refresh;

@end

@implementation FIBTableViewFibonacciViewController

#pragma mark - ViewLifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.tableView];

    [self registerCells];
    
    [self refresh];

    [self updateViewConstraints];
}

#pragma mark - Subviews

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [UITableView newAutoLayoutView];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
    }
    
    return _tableView;
}

#pragma mark - Constraints

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    /*----------------*/
    
    [self.tableView autoPinEdgesToSuperviewEdges];
}

#pragma mark - RegisterCells

- (void)registerCells
{
    [self.tableView registerClass:[FIBFibonacciTableViewCell class]
           forCellReuseIdentifier:[FIBFibonacciTableViewCell reuseIdentifier]];
}

#pragma mark - Refresh

- (void)refresh
{
    if (self.fetchedResultsController.fetchedObjects.count == 0)
    {
        //Operation to calculate Fibonacci sequence
    }
}

#pragma mark - FetchResultsController

- (CDFTableViewFetchedResultsController *)fetchedResultsController
{
    if (!_fetchedResultsController)
    {
        _fetchedResultsController = [[CDFTableViewFetchedResultsController alloc] initWithFetchRequest:self.fetchRequest
                                                                                  managedObjectContext:[CDFCoreDataManager sharedInstance].managedObjectContext
                                                                                    sectionNameKeyPath:nil
                                                                                             cacheName:nil];
        
        _fetchedResultsController.frcDelegate = self;
        _fetchedResultsController.tableView = self.tableView;
        _fetchedResultsController.updateRowAnimation = UITableViewRowAnimationNone;
        
        [_fetchedResultsController performFetch:nil];
    }
    
    return _fetchedResultsController;
}

- (NSFetchRequest *)fetchRequest
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    fetchRequest.entity = [NSEntityDescription entityForName:NSStringFromClass([FIBFibonacci class])
                                      inManagedObjectContext:[CDFCoreDataManager sharedInstance].managedObjectContext];
    
    fetchRequest.sortDescriptors = self.sortDescriptorsForFetchRequest;
    
    return fetchRequest;
}

- (NSArray *)sortDescriptorsForFetchRequest
{
    NSSortDescriptor *indexSort = [NSSortDescriptor sortDescriptorWithKey:@"n"
                                                                ascending:YES];
    
    return @[indexSort];
}

#pragma mark -  UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger fetchedRowsCount = self.fetchedResultsController.fetchedObjects.count;
    
    return fetchedRowsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FIBFibonacciTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[FIBFibonacciTableViewCell reuseIdentifier]
                                                             forIndexPath:indexPath];
    
    FIBFibonacci *fibonacci = self.fetchedResultsController.fetchedObjects[indexPath.row];
    
    [cell updateCellWithFibonacci:fibonacci];
    
    /*---------------------*/
    
    [cell layoutByApplyingConstraints];
    
    /*---------------------*/
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

#pragma mark - CDFTableViewFetchedResultsControllerDelegate

- (void)didUpdateContent
{
    NSLog(@"didUpdateContent");
}

- (void)willUpdateCellAtIndexPath:(NSIndexPath *)indexPath
{
    FIBFibonacci *fibonacci = self.fetchedResultsController.fetchedObjects[indexPath.row];
    
    FIBFibonacciTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    [cell updateCellWithFibonacci:fibonacci];
}

@end
