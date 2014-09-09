//
//  Feed.h
//  MySocialFeeds
//
//  Created by Yunas Qazi on 9/9/14.
//  Copyright (c) 2014 AppsFoundry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBBaseService.h"


@interface Feed : DBBaseService

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * subTitle;
@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSDate * dateModified;
@property (nonatomic, retain) NSString * imageLink;
@property (nonatomic, retain) NSString * link;


+(Feed*) getFeedWithoutContextWithDict:(NSDictionary*)dict withAccessToken:(NSString *)accessToken;
+(NSArray*) getAllFeeds;

@end
