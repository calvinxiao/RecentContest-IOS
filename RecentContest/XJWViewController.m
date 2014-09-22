//
//  XJWViewController.m
//  RecentContest
//
//  Created by Calvin Xiao on 9/15/14.
//  Copyright (c) 2014 XJW. All rights reserved.
//

#import "XJWViewController.h"
#import "XJWTableViewCell.h"

@interface XJWViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *lbCurrentTime;

@end

@implementation XJWViewController

- (IBAction)refreshButtonClick:(UIButton *)sender {
    [self updateDataFromJson];
    [self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.list != nil)
        return [self.list count];
    return 0;
}

- (XJWTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XJWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    NSDictionary *s = [self.list objectAtIndex:indexPath.row];
    cell.lbGameType.text = [s objectForKey:@"access"];
    if ([cell.lbGameType.text isEqualToString: @""])
        cell.lbGameType.text = @"Unknown";
    cell.lbGameName.text = [s objectForKey:@"name"];
    cell.lbGameTime.text = [s objectForKey:@"start_time"];
    cell.lbGameHost.text = [s objectForKey:@"oj"];
    cell.lbGameWeekday.text = [s objectForKey:@"week"];
    //need accessoryType when link function are developed.
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void) updateDataFromJson
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://contests.acmicpc.info/contests.json"]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *jsonParsingError = nil;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:response options:0 error: &jsonParsingError];
    self.list = json;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self callUpdate];
    [self updateDataFromJson];
}

- (void) viewDidUnload{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.list = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)callUpdate
{
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}

-(void)updateTimer
{
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateInStringFormated=[dateformatter stringFromDate:[NSDate date]];
    self.lbCurrentTime.text = dateInStringFormated;
}

@end
