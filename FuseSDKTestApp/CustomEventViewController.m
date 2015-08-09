//
//  CustomEventViewController.m
//  FuseSDKTestApp
//
//  Created by Robert Segal on 2015-08-09.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import "CustomEventViewController.h"
#import "CustomEventUITableViewCell.h"
#import "FuseSDK.h"

@interface CustomEventViewController ()
@end

@implementation CustomEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [(CustomEventUITableView *)self.tableViewEvents viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onClearAllEventsButton:(id)sender
{
    for (int i = 1 ; i <= 10; i++)
    {
        [FuseSDK registerCustomEvent:i withInt:0];
    }
    
    for (int i = 11 ; i <= 20; i++)
    {
        [FuseSDK registerCustomEvent:i withString:@""];
    }
    
    [(CustomEventUITableView *)self.tableViewEvents clearData];
    [self.tableViewEvents reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomEventUITableViewCellIdentifier";
    
    CustomEventUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Custom event %@",
                           [[NSNumber numberWithInteger:indexPath.row + 1] stringValue]];
    
    CustomEventUITableView *t = (CustomEventUITableView *)tableView;
    
    CustomEventUITableViewCellData *d = t.arrCustomEvents[[NSNumber numberWithInteger:indexPath.row]];
    
    cell.customEventValue.text    = d.value;
    cell.customEventStepper.value = [d.value doubleValue];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
