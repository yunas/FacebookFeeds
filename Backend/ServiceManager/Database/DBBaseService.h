//
//  BaseService.h
//  IOTab
//
//  Created by Yunas Qazi on 2/17/12.
//  Copyright (c) 2012 Coeus Solutions GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ServiceCompletion)(NSArray *responseArr);
typedef void (^ServiceError)(NSError *error);


@interface DBBaseService : NSManagedObject
// Core Data
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void) flushDatabase;

@end

