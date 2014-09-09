//
//  ServiceManager.h
//  MySocialFeeds
//
//  Created by Yunas Qazi on 9/9/14.
//  Copyright (c) 2014 AppsFoundry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceManager : NSObject


-(void) getSocialFeeds:(void (^)(NSArray *feedsArr))successBlock
                    failure:(void (^)(NSError *error))failureBlock;



@end
