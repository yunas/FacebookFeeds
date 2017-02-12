//
//  NetworkBaseService+DigitalLogixService.h
//  MySocialFeeds
//
//  Created by yunas on 2/12/17.
//  Copyright © 2017 AppsFoundry. All rights reserved.
//

#import "NetworkBaseService.h"


@interface DigitalLogixService : NetworkBaseService


-(void) getFeeds:(void (^)(NSArray *feedsArr))successBlock
         failure:(void (^)(NSError *error))failureBlock;


@end
