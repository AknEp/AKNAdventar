//
//  AKNGoodViewController.h
//  AKNAdventar
//
//  Created by Satoshi SUZUKI on 2013/12/24.
//  Copyright (c) 2013年 AknEp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKNGoodTableViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@end


@interface AKNGoodTableViewCell : UITableViewCell

@property (nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic) IBOutlet UILabel *bodyLabel;

@end