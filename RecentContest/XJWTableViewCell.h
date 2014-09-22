//
//  XJWTableViewCell.h
//  RecentContest
//
//  Created by Calvin Xiao on 9/22/14.
//  Copyright (c) 2014 XJW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJWTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbGameType;
@property (weak, nonatomic) IBOutlet UILabel *lbGameName;
@property (weak, nonatomic) IBOutlet UILabel *lbGameHost;
@property (weak, nonatomic) IBOutlet UILabel *lbGameTime;
@property (weak, nonatomic) IBOutlet UILabel *lbGameWeekday;

@end
