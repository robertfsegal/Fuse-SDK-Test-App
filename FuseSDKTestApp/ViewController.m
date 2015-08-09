//
//  ViewController.m
//  FuseSDKTestApp
//
//  Created by Robert Segal on 2015-08-08.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import "ViewController.h"
#import "FuseSDK.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(logMessage:)
                                                 name:@"FuseMessageLog"
                                               object:nil];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onPlayButton:(id)sender {
     [[UIApplication sharedApplication].delegate performSelector:@selector(onPlayButton)];
}
- (IBAction)onReloadButton:(id)sender {
    [self.tableView reloadData];
}
- (IBAction)onClearButton:(id)sender {
    self.textViewLog.text = @"";
}

-(void)logMessage:(NSNotification *)n
{
    self.textViewLog.text = [NSString stringWithFormat:@"%@\n\n%@", self.textViewLog.text, n.userInfo[@"message"]];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[FuseSDK get] GetAdZoneList].count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *zone = [[FuseSDK get] GetAdZoneList][indexPath.row];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"FuseZoneSelected"
                                                        object:nil
                                                      userInfo:@{@"zone": zone} ];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"FuseMessageLog"
                                                        object:nil
                                                      userInfo:@{@"message" : [NSString stringWithFormat:@"showing zone %@", zone]} ];

    [FuseSDK preloadAdForZoneID:zone];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
//    NSDictionary *book = [[self.sections valueForKey:[[[self.sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    NSArray *arr = [[FuseSDK get] GetAdZoneList];
    
    cell.textLabel.text = arr[indexPath.row];//[book objectForKey:@"title"];
//    cell.detailTextLabel.text = [book objectForKey:@"description"];
    
    return cell;
}

@end
