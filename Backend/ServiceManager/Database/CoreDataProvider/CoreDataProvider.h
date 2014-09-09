//
//  CoreDataService.h
//  IOTab
//
//  Created by Yunas Qazi on 4/26/12.
//  Copyright (c) 2012 Coeus Solutions GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataProvider : NSObject


// Core Data
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
-(void) flushDatabase;

+ (CoreDataProvider *) instance;

@end
