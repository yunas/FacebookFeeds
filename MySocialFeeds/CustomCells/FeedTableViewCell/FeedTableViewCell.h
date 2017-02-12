//
//  FeedTableViewCell.h
//  MySocialFeeds
//
//  Created by Yunas Qazi on 9/9/14.
//  Copyright (c) 2014 AppsFoundry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedTableViewCell : UITableViewCell


@property (nonatomic, strong) IBOutlet UIImageView *imgViewFeed;
@property (nonatomic, strong) IBOutlet UILabel     *lblCategory;
@property (nonatomic, strong) IBOutlet UILabel     *lblLocation;
@property (nonatomic, strong) IBOutlet UILabel     *lblEventName;
@property (nonatomic, strong) IBOutlet UILabel     *lblDate;
@property (nonatomic, strong) IBOutlet UIButton     *btnDetail;

@end
