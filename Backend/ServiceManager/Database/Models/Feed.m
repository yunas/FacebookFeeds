//
//  Feed.m
//  MySocialFeeds
//
//  Created by Yunas Qazi on 9/9/14.
//  Copyright (c) 2014 AppsFoundry. All rights reserved.
//

#import "Feed.h"
#import "NSDate+MySocialFeeds.h"
#import "CoreDataProvider.h"

#define kFBPAGE_PICTURE_LINK @"https://graph.facebook.com/dubizzle/picture?type=normal&access_token"

typedef enum {
    POST_TYPE_NONE,
    POST_TYPE_STATUS,
    POST_TYPE_SHARED_STORY,
    POST_TYPE_PHOTO,
    POST_TYPE_ADDED_PHOTOS,
    POST_TYPE_LINK,
}POST_TYPE;

@implementation Feed

@dynamic title;
@dynamic subTitle;
@dynamic dateCreated;
@dynamic dateModified;
@dynamic imageLink;
@dynamic link;


-(void) parseFeed:(NSDictionary *)dict withAccessToken:(NSString*)accessToken{

// GET FEED TYPE TO PARSE
    POST_TYPE type = POST_TYPE_NONE;
    if ([dict[@"type"] isEqualToString:@"status"]) {
        type = POST_TYPE_STATUS;
    }
    else if ([dict[@"type"] isEqualToString:@"shared_story"]) {
        type = POST_TYPE_SHARED_STORY;
    }
    else if ([dict[@"type"] isEqualToString:@"photo"]) {
        type = POST_TYPE_PHOTO;
    }
    else if ([dict[@"type"] isEqualToString:@"added_photos"]) {
        type = POST_TYPE_ADDED_PHOTOS;
    }
    else if ([dict[@"type"] isEqualToString:@"link"]) {
        type = POST_TYPE_LINK;
    }
    
    
//SET TITLE
    if (type == POST_TYPE_STATUS || type == POST_TYPE_PHOTO) {
        if (dict[@"message"]) {
            [self setTitle:dict[@"message"]];
        }
        else{

            [self setTitle:dict[@"story"]];
        }
    }
    else if (type == POST_TYPE_LINK){
                [self setTitle:dict[@"message"]];
    }
    else if (type == POST_TYPE_ADDED_PHOTOS ||  type == POST_TYPE_SHARED_STORY ){
                [self setTitle:dict[@"description"]];
    }
    else{
            [self setTitle:@"Not found"];
    }

//SET SUBTITLE
    if (type == POST_TYPE_STATUS || type == POST_TYPE_PHOTO) {
        if (dict[@"message"]) {
             [self setSubTitle:dict[@"message"]];
        }
        else{
            [self setSubTitle:dict[@"story"]];
        }

    }
    else if (type == POST_TYPE_LINK){

    }
    else if (type == POST_TYPE_ADDED_PHOTOS || type == POST_TYPE_ADDED_PHOTOS || type == POST_TYPE_SHARED_STORY ){
        [self setSubTitle:dict[@"description"]];
    }
    else{
        [self setSubTitle:@"Not found"];
    }

//SET LINK
    if (type == POST_TYPE_STATUS) {
        [self setLink:[NSString stringWithFormat:@"%@%@",@"https://www.facebook.com/",dict[@"id"]]];
    }
    else if (type == POST_TYPE_PHOTO || type == POST_TYPE_ADDED_PHOTOS || type == POST_TYPE_SHARED_STORY || type == POST_TYPE_LINK){
        [self setLink:dict[@"link"]];
    }

//SET IMAGE LINK
    if (type == POST_TYPE_STATUS) {
        [self setImageLink:[kFBPAGE_PICTURE_LINK stringByAppendingString:accessToken]];
    }
    else if (type == POST_TYPE_PHOTO || type == POST_TYPE_ADDED_PHOTOS || type == POST_TYPE_SHARED_STORY || type == POST_TYPE_LINK){

        [self setImageLink:dict[@"picture"]];
    }
    

    [self setDateCreated:[NSDate dateWithFormat:DATEFORMAT_FACEBOOK fromString:dict[@"created_time"]]];
//    [self setDateModified:[NSDate dateWithFormat:DATEFORMAT_FACEBOOK fromString:dict[@"updated_time"]]];
    
}


+(Feed*) getFeedWithoutContextWithDict:(NSDictionary*)dict withAccessToken:(NSString *)accessToken{

    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Feed" inManagedObjectContext:[[CoreDataProvider instance] managedObjectContext]];
    Feed *feed = (Feed *)[[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:[[CoreDataProvider instance]managedObjectContext]];

    [feed parseFeed:dict withAccessToken:accessToken];
    [[CoreDataProvider instance] saveContext];
    return feed;
}


+(NSArray*) getAllFeeds{
    NSArray *feedsArr = nil;
	
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:
                                              @"Feed" inManagedObjectContext:[[CoreDataProvider instance]managedObjectContext]];
    NSFetchRequest *request = [NSFetchRequest new];
    [request setEntity:entityDescription];
    
    NSError *error=nil;
    NSArray *array = [[[CoreDataProvider instance]managedObjectContext] executeFetchRequest:request error:&error];
    
    if ([array count]) {
        feedsArr = [NSMutableArray arrayWithArray:array];
    }
	return feedsArr;

}




@end
