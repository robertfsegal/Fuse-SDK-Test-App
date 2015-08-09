//
//  CustomEventViewController.h
//  FuseSDKTestApp
//
//  Created by Robert Segal on 2015-08-09.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomEventUITableView.h"

@interface CustomEventViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *clearAllEventsButton;
@property (weak, nonatomic) IBOutlet CustomEventUITableView *tableViewEvents;
@end
