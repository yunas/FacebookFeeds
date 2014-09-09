//
//  ServiceManager.m
//  MySocialFeeds
//
//  Created by Yunas Qazi on 9/9/14.
//  Copyright (c) 2014 AppsFoundry. All rights reserved.
//

#import "ServiceManager.h"
#import "FacebookService.h"
#import "DBFBService.h"


@implementation ServiceManager

-(void) getSocialFeeds:(void (^)(NSArray *feedsArr))successBlock
                    failure:(void (^)(NSError *error))failureBlock{
    
    
    //Now first look into the database if there are feeds get them if they are not
    //get from server and save them.
    
    DBFBService *dbFbService = [DBFBService new];
    NSArray *feeds = [dbFbService getFeeds];
    
    if (feeds.count) {
        NSLog(@"FEEDS from LOCAL DB");
        successBlock(feeds);
    }
    else{
        FacebookService *fbService = [FacebookService new];
        [fbService getFacebookFeeds:^(NSArray *feedsArr) {
        NSLog(@"FEEDS from Server");
            successBlock(feedsArr);
        } failure:^(NSError *error) {
            failureBlock(error);
        }];
    }
    
    
    
}

@end
