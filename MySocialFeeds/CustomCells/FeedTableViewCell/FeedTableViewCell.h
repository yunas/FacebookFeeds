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
@property (nonatomic, strong) IBOutlet UILabel     *lblTitle;
@property (nonatomic, strong) IBOutlet UILabel     *lblDetail;


@end
