//
//  CustomEventUITableView.m
//  FuseSDKTestApp
//
//  Created by Robert Segal on 2015-08-09.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import "CustomEventUITableView.h"
#import "CustomEventUITableViewCell.h"

@interface CustomEventUITableView()
@property NSMutableDictionary *arrCustomEvents;
@end

@implementation CustomEventUITableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)viewDidLoad
{
    if (!self.arrCustomEvents)
    {
        self.arrCustomEvents = [NSMutableDictionary dictionary];
    }
    
    for (int i = 0; i < 10; i++)
    {
        CustomEventUITableViewCellData* d = [[CustomEventUITableViewCellData alloc] init];
        
        d.value = @"0";
        
        self.arrCustomEvents[[NSNumber numberWithInt:i]] = d;
    }
    
    [self reloadData];
}

-(void)onCustomEventStepper:(id)sender
{
    CustomEventUITableViewCell *c = (CustomEventUITableViewCell *)sender;
    
    NSIndexPath *i = [self indexPathForCell:c];
  
    CustomEventUITableViewCellData* d = [[CustomEventUITableViewCellData alloc] init];
    
    d.value = [[NSNumber numberWithDouble:((CustomEventUITableViewCell *)sender).customEventStepper.value] stringValue];
    
    self.arrCustomEvents[[NSNumber numberWithInteger:i.row]] = d;
    

    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"FuseMessageLog"
                                                        object:nil
                                                      userInfo:@{@"message" : [NSString stringWithFormat:@"custom event %d set to %@", i.row, d.value]} ];
}

-(void)clearData
{
    for (NSNumber *n in [self.arrCustomEvents allKeys])
    {
        CustomEventUITableViewCellData *d = self.arrCustomEvents[n];
        d.value = @"0";
    }
}


@end
