//
//  NSDate+MySocialFeeds.h
//  MySocialFeeds
//
//  Created by Yunas Qazi on 9/9/14.
//  Copyright (c) 2014 AppsFoundry. All rights reserved.
//

#import <Foundation/Foundation.h>

//ADDED ENUM FOR REUSABILITY... TWITTER Might have its own format
typedef enum {
    DATEFORMAT_NONE,
    DATEFORMAT_FACEBOOK,
    DATEFORMAT_MYSOCIALFEEDS_CUSTOM,
}DATEFORMAT;

@interface NSDate (MySocialFeeds)


//CLASS LEVEL METHOD BECAUSE WE NEED ONE SUCH INSTANCE
+(NSDate*) dateWithFormat:(DATEFORMAT)dateFormat fromString:(NSString*)dateStr;
-(NSString *) toStringWithFormat:(DATEFORMAT)dateFormat;

@end
