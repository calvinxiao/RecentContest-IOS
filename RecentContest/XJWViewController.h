//
//  XJWViewController.h
//  RecentContest
//
//  Created by Calvin Xiao on 9/15/14.
//  Copyright (c) 2014 XJW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJWViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *list;

@end
