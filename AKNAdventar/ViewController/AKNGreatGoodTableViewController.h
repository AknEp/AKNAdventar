//
//  AKNGreatGoodTableViewController.h
//  AKNAdventar
//
//  Created by Satoshi SUZUKI on 2013/12/24.
//  Copyright (c) 2013年 AknEp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKNEntryID;

@interface AKNGreatGoodTableViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@end

@interface AKNGreatGoodTableViewCell : UITableViewCell

@property (nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic) IBOutlet UILabel *bodyLabel;

@property (nonatomic, strong) AKNEntryID *entryID;
// 全てメインスレッドで発生する事が保証できていれば、AKNEntry を直接渡してもOKですね。 今回の例ではObjectIDを経由する意味はあまりなかったかもしれない。。。

@end