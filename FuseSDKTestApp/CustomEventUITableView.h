//
//  CustomEventUITableView.h
//  FuseSDKTestApp
//
//  Created by Robert Segal on 2015-08-09.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomEventUITableView : UITableView

-(void)onCustomEventStepper:(id)sender;
-(void)clearData;
-(void)viewDidLoad;

@property (nonatomic, readonly) NSMutableDictionary *arrCustomEvents;
@end
