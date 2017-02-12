//
//  NetworkBaseService+DigitalLogixService.m
//  MySocialFeeds
//
//  Created by yunas on 2/12/17.
//  Copyright © 2017 AppsFoundry. All rights reserved.
//

#import "DigitalLogixService.h"
#import "DLFeed.h"


@implementation DigitalLogixService

-(void) getFeeds:(void (^)(NSArray *feedsArr))successBlock
         failure:(void (^)(NSError *error))failureBlock{

    [super makeRequestWithMethod:@""
                   andParameters:nil
                    withResponse:^(id response) {
                        NSMutableArray *feeds = [NSMutableArray new];
                        
                        NSArray *responseFeeds = [[NSArray arrayWithObject:response]lastObject];//[@"data"];
                        for (NSDictionary *dict in responseFeeds) {
                            DLFeed *feed = [DLFeed getFeedWithDict:dict];
                            [feeds addObject:feed];
                        }
                        successBlock(feeds);
                    } failure:^(NSError *error) {
                        
                        failureBlock (error);
                    }];
    
}


@end
