// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AKNEntry.h instead.

#import <CoreData/CoreData.h>


extern const struct AKNEntryAttributes {
	__unsafe_unretained NSString *body;
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *title;
} AKNEntryAttributes;

extern const struct AKNEntryRelationships {
} AKNEntryRelationships;

extern const struct AKNEntryFetchedProperties {
} AKNEntryFetchedProperties;






@interface AKNEntryID : NSManagedObjectID {}
@end

@interface _AKNEntry : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (AKNEntryID*)objectID;





@property (nonatomic, strong) NSString* body;



//- (BOOL)validateBody:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* createdAt;



//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;






@end

@interface _AKNEntry (CoreDataGeneratedAccessors)

@end

@interface _AKNEntry (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveBody;
- (void)setPrimitiveBody:(NSString*)value;




- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




@end
