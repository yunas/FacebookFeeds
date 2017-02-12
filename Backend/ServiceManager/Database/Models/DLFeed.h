//
//  Feed.h
//  MySocialFeeds
//
//  Created by Yunas Qazi on 9/9/14.
//  Copyright (c) 2014 AppsFoundry. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DLFeed : NSObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * event;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * imageLink;
@property (nonatomic, retain) NSString * feedId;
@property (nonatomic, retain) NSDate * date;



//+(Feed*) getFeedWithoutContextWithDict:(NSDictionary*)dict withAccessToken:(NSString *)accessToken;
//+(NSArray*) getAllFeeds;
+(DLFeed*) getFeedWithDict:(NSDictionary*)dict;

@end
