//
//  CustomEventUITableViewCell.h
//  FuseSDKTestApp
//
//  Created by Robert Segal on 2015-08-09.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomEventUITableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIStepper *customEventStepper;
@property (weak, nonatomic) IBOutlet UILabel *customEventValue;
@end

@interface CustomEventUITableViewCellData : NSObject
@property (copy, nonatomic)  NSString *value;
@end
