//
//  FeedTableViewCell.m
//  MySocialFeeds
//
//  Created by Yunas Qazi on 9/9/14.
//  Copyright (c) 2014 AppsFoundry. All rights reserved.
//

#import "FeedTableViewCell.h"

@implementation FeedTableViewCell


#pragma mark - Constraints

-(void) initConstraints{
    
//    
//    NSDictionary *metrics = @{@"ivWidth": @60,
//                              @"ivHeight": @60,
//                              @"ivHSpacing":@33,
//                              @"lblWidth": @200,
//                              @"lblHeight": @21,
//                              @"topMargin": @10,
//                              @"leftMargin":@7,
//                              @"rightMargin": @20,
//                              @"ivBottomMargin":@19,
//                              @"lblBottomMargin":@5,
//                              };
//    
    
    
    
    
    
}

#pragma mark - Standard Methods


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initConstraints];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
