//
//  AKNGreatGoodTableViewController.m
//  AKNAdventar
//
//  Created by Satoshi SUZUKI on 2013/12/24.
//  Copyright (c) 2013年 AknEp. All rights reserved.
//

#import "AKNGreatGoodTableViewController.h"

#import "AKNEntry.h"

@interface AKNGreatGoodTableViewController ()

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation AKNGreatGoodTableViewController

#pragma mark initializatin

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self didInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self didInit];
    }
    return self;
}

- (void)didInit
{
    self.fetchedResultsController = [AKNEntry fetchAllSortedBy:@"createdAt" ascending:NO withPredicate:nil groupBy:nil delegate:self];
    //    self.fetchedResultsController = [AKNEntry fetchAllWithDelegate:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.fetchedResultsController fetchedObjects] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    AKNGreatGoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    AKNEntry *entry = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.entryID = entry.objectID;
    
    return cell;
}

#pragma mark - FetchedResultsController Delegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            if (controller.fetchedObjects.count > 1) {
                [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            } else {
                [tableView reloadRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationNone];
            }
            break;
            
        case NSFetchedResultsChangeDelete:
            if (controller.fetchedObjects.count > 0) {
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            } else {
                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }
            break;
            
        case NSFetchedResultsChangeUpdate:
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

@end

@interface AKNGreatGoodTableViewCell ()

@end

@implementation AKNGreatGoodTableViewCell

- (AKNEntry *)entry
{
    return (AKNEntry *)[[NSManagedObjectContext contextForCurrentThread] objectWithID:self.entryID];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    AKNEntry *entry = [self entry];
    self.titleLabel.text = entry.title;
    self.bodyLabel.text = entry.body;
}

// 今回はやりませんでしたが、オブジェクトの変化を既に表示されているセルに対しても行いたい場合、ビューをNSNoticifationCenterのobserverにした方がコードが簡略化されますね。

@end