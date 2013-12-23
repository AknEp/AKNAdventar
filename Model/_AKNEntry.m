// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AKNEntry.m instead.

#import "_AKNEntry.h"

const struct AKNEntryAttributes AKNEntryAttributes = {
	.body = @"body",
	.createdAt = @"createdAt",
	.title = @"title",
};

const struct AKNEntryRelationships AKNEntryRelationships = {
};

const struct AKNEntryFetchedProperties AKNEntryFetchedProperties = {
};

@implementation AKNEntryID
@end

@implementation _AKNEntry

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Entry";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Entry" inManagedObjectContext:moc_];
}

- (AKNEntryID*)objectID {
	return (AKNEntryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic body;






@dynamic createdAt;






@dynamic title;











@end
