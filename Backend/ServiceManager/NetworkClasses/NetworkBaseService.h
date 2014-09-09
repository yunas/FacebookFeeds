//
//  BaseService.h
//  1860Munchen
//
//  Created by Coeus on 22/07/2014.
//  Copyright (c) 2014 Coeus Solutions GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ResponseBlock)(id JSONObject);
typedef void(^FailureBlock) (NSError *error);

typedef enum {
    ResponseType_JSON,
    ResponseType_PLAIN_HTML,
    ResponseType_XML,
}ResponseType;

typedef enum {
    RequestType_GET,
    RequestType_POST,
}RequestType;


@interface NetworkBaseService : NSObject

-(void) makeRequestWithUrl:(NSString*)url
             andParameters:(NSDictionary*)params
           withRequestType:(RequestType)requestType
          withResponseType:(ResponseType)responseType
          withHeaderValues:(NSDictionary*)headerParams
              withResponse:(void (^)(id response))success
                   failure:(void (^)(NSError *error))fail;


-(void) makeRequestWithMethod:(NSString*)method
                andParameters:(NSDictionary*)params
                 withResponse:(void (^)(id response))success
                      failure:(void (^)(NSError *error))fail;


@end
