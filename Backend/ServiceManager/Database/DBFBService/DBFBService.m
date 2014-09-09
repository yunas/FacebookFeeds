//
//  DBFBService.m
//  MySocialFeeds
//
//  Created by Yunas Qazi on 9/9/14.
//  Copyright (c) 2014 AppsFoundry. All rights reserved.
//

#import "DBFBService.h"
#import "Feed.h"

@implementation DBFBService


-(NSArray*) getFeeds{
    NSArray *feeds = nil;
    feeds = [Feed getAllFeeds];
    return feeds;
}

@end
