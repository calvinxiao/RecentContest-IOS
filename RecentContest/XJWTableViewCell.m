//
//  XJWTableViewCell.m
//  RecentContest
//
//  Created by Calvin Xiao on 9/22/14.
//  Copyright (c) 2014 XJW. All rights reserved.
//

#import "XJWTableViewCell.h"

@implementation XJWTableViewCell

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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
