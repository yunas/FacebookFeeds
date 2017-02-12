//
//  FeedTableViewCell.m
//  MySocialFeeds
//
//  Created by Yunas Qazi on 9/9/14.
//  Copyright (c) 2014 AppsFoundry. All rights reserved.
//

#import "FeedTableViewCell.h"

@implementation FeedTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
