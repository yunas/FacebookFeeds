//
//  NSDate+MySocialFeeds.m
//  MySocialFeeds
//
//  Created by Yunas Qazi on 9/9/14.
//  Copyright (c) 2014 AppsFoundry. All rights reserved.
//

#import "NSDate+MySocialFeeds.h"

@implementation NSDate (MySocialFeeds)


+(NSString*) getFormat:(DATEFORMAT)format{
    
    NSString *dateFormatStr = @"dd-MM-YYYY";
    
    if (format == DATEFORMAT_FACEBOOK) {
//        2014-07-17T16:59:33+0000
        dateFormatStr = @"yyyy-MM-dd'T'HH:mm:ssZZZ";
    }
    else if (format == DATEFORMAT_MYSOCIALFEEDS_CUSTOM){
        dateFormatStr = @"dd/MM/YYYY";
    }
    else if (format == DATEFORMAT_MYSOCIALFEEDS_DIGITAL_LOGIX){
        dateFormatStr = @"dd/MM/yyyy HH:mm tt";
//        10/02/2017 10:14 PM
    }
    
    
    return dateFormatStr;
}


+(NSDate*) dateWithFormat:(DATEFORMAT)dateFormat fromString:(NSString*)dateStr{
    NSDate *date = nil;
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:[NSDate getFormat:dateFormat]];
    date = [formatter dateFromString:dateStr];

    return date;
}


-(NSString *) toStringWithFormat:(DATEFORMAT)dateFormat{
    NSString *dateStr = nil;
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:[NSDate getFormat:dateFormat]];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    dateStr = [formatter stringFromDate:self];
    return dateStr;
}

@end
