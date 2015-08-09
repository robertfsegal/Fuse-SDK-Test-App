//
//  CustomEventUITableViewCell.m
//  FuseSDKTestApp
//
//  Created by Robert Segal on 2015-08-09.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import "CustomEventUITableViewCell.h"
#import "CustomEventUITableView.h"
#import "FuseSDK.h"

@implementation CustomEventUITableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)onCustomEventStepper:(id)sender
{
    UIStepper *s      = (UIStepper *)sender;
    NSNumber  *sValue = [NSNumber numberWithDouble:s.value];
    
    self.customEventValue.text = [sValue stringValue];
    
    id t = [self superview];
    
    while (t && [t isKindOfClass:[UITableView class]] == NO)
    {
        t = [t superview];
    }
    
    if (t)
    {
        [(CustomEventUITableView *)t onCustomEventStepper:self];
        
        NSNumber *n = [NSNumber numberWithInteger:[(UITableView *)t indexPathForCell:self].row + 1];
        
        [FuseSDK registerCustomEvent:[n intValue] withInt:[sValue intValue]];
    }
}

@end

@implementation CustomEventUITableViewCellData
@end
