//
//  BaseService.m
//  IOTab
//
//  Created by Yunas Qazi on 2/17/12.
//  Copyright (c) 2012 Coeus Solutions GmbH. All rights reserved.
//

#import "DBBaseService.h"
#import "CoreDataProvider.h"

@implementation DBBaseService

// Core Data
@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;

- (id)init
{
    self = [super init];
    if (self) {

    }
    return self;
}



#pragma mark singleton
- (void)saveContext{
    
    [[CoreDataProvider instance] saveContext];
}
- (NSManagedObjectContext *)managedObjectContext
{
    return [[CoreDataProvider instance] managedObjectContext];
}


- (NSManagedObjectModel *)managedObjectModel
{

    return [[CoreDataProvider instance] managedObjectModel];
}
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    return [[CoreDataProvider instance] persistentStoreCoordinator];
}
- (NSURL *)applicationDocumentsDirectory
{
    return [[CoreDataProvider instance] applicationDocumentsDirectory];
}

- (void) flushDatabase{

    [[CoreDataProvider instance] flushDatabase];

}

@end
