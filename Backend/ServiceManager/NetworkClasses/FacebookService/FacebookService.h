//
//  FacebookService.h
//  MySocialFeeds
//
//  Created by Yunas Qazi on 9/9/14.
//  Copyright (c) 2014 AppsFoundry. All rights reserved.
//

#import "NetworkBaseService.h"

@interface FacebookService : NetworkBaseService

-(void) getFacebookFeeds:(void (^)(NSArray *feedsArr))successBlock
                 failure:(void (^)(NSError *error))failureBlock;

@end
