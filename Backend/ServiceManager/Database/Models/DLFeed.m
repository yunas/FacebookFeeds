//
//  DLFeed.m
//  MySocialFeeds
//
//  Created by yunas on 2/12/17.
//  Copyright © 2017 AppsFoundry. All rights reserved.
//

#import "DLFeed.h"
#import "NSDate+MySocialFeeds.h"


@implementation DLFeed


@synthesize category,event,location,imageLink;
@synthesize date;


-(void) parseFeed:(NSDictionary *)dict{
    
    // GET FEED TYPE TO PARSE
    
    [self setCategory:dict[@"category"]];
    [self setEvent:dict[@"eventname"]];
    [self setFeedId:dict[@"id"]];
    [self setLocation:dict[@"location"]];
    [self setImageLink:dict[@"picturename"]];
    [self setDate:[NSDate dateWithFormat:DATEFORMAT_MYSOCIALFEEDS_DIGITAL_LOGIX fromString:dict[@"date"]]];
    
}


+(DLFeed*) getFeedWithDict:(NSDictionary*)dict{
    
    DLFeed *feed = [DLFeed new];
    [feed parseFeed:dict];
    return feed;
}





@end
