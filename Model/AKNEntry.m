#import "AKNEntry.h"


@interface AKNEntry ()

// Private interface goes here.

@end


@implementation AKNEntry

static const NSInteger AKN_ENTRY_LIMIT = 10000;

- (void)awakeFromInsert
{
    [super awakeFromInsert];
    
    self.createdAt = [NSDate date];
}

+ (void)loadExampleDataContinuously
{
    // 説明: GCDで裏側のスレッドに飛ばして、3秒に1つずつEntryを追加しています。
    // 実際のプロジェクトでこんなメソッドは書かないと思いますので、カウンタの処理などが少しばかり雑ですが、ご了承下さい。
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        for( NSInteger count=1; count<=AKN_ENTRY_LIMIT; count++ ){
            AKNEntry *entry = [AKNEntry createEntity];
            entry.title = [NSString stringWithFormat:@"タイトル No.%d", count];
            entry.body = [NSString stringWithFormat:@"本文 No.%d", count];
            [entry.managedObjectContext saveToPersistentStoreAndWait];
            [NSThread sleepForTimeInterval:3.0];
        }
    });
}


@end
