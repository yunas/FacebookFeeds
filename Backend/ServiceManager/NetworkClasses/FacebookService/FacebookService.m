//
//  FacebookService.m
//  MySocialFeeds
//
//  Created by Yunas Qazi on 9/9/14.
//  Copyright (c) 2014 AppsFoundry. All rights reserved.
//

#import "FacebookService.h"
#import "Feed.h"

#define kFBGraphURL     @"https://graph.facebook.com/"
#define kFBAPP_ID       @"546062422104406"
#define kFBAPP_SECRET   @"b4b96d7d1670e085ddffc8094f7f759f"

#define kFBGraphPageURL @"https://graph.facebook.com/dubizzle/feed?type=normal&access_token="
//I have used normal here to get refined images, else I can work with low size (130x130) small images too

@implementation FacebookService

-(void) getFacebookFeeds:(void (^)(NSArray *feedsArr))successBlock
                 failure:(void (^)(NSError *error))failureBlock{
    //There are 2 steps involved in fetching feeds in order to use graph api
    //1. Authenticate yourself with facebook
    //2. Pass accesstoken to get feeds
    
    


    NSMutableString *strToAccessToken = [NSMutableString new];
    [strToAccessToken appendString:kFBGraphURL];
    [strToAccessToken appendString:[NSString stringWithFormat:@"/oauth/access_token?client_id=%@",kFBAPP_ID]];
    [strToAccessToken appendString:[NSString stringWithFormat:@"&client_secret=%@&grant_type=client_credentials",kFBAPP_SECRET]];
    
    [super makeRequestWithUrl:strToAccessToken
                andParameters:nil
              withRequestType:RequestType_GET
             withResponseType:ResponseType_PLAIN_HTML
             withHeaderValues:nil
                 withResponse:^(id response) {
        
                     //GOT ACCESS TOKEN PARSE IT
                     
                     NSString *responseStr = [[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
                     NSArray *arr = [responseStr componentsSeparatedByString:@"="];
                     NSString *accessToken = [arr[1]  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                     
                     NSString *urlStr = [kFBGraphPageURL stringByAppendingString:accessToken];
                     
                        [super makeRequestWithUrl:urlStr
                                    andParameters:nil
                                  withRequestType:RequestType_GET
                                 withResponseType:ResponseType_JSON
                                 withHeaderValues:nil
                                     withResponse:^(id response) {
                                         
                                         //GOT FEEDS PARSE IT
                                         NSMutableArray *feeds = [NSMutableArray new];
                                         
                                         NSArray *responseFeeds = response[@"data"];
                                         for (NSDictionary *dict in responseFeeds) {
                                               Feed *feed = [Feed getFeedWithoutContextWithDict:dict withAccessToken:accessToken];
                                               [feeds addObject:feed];
                                         }
                                         successBlock(feeds);
                                     } failure:^(NSError *error) {
                                         
                                         failureBlock (error);
                                     }];
                     
                     
    } failure:^(NSError *error) {
        failureBlock(error);
        
        
    }];
    
    
}

@end
