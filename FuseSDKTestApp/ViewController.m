//
//  ViewController.m
//  FuseSDKTestApp
//
//  Created by Robert Segal on 2015-08-08.
//  Copyright (c) 2015 Get Set Games Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onPlayButton:(id)sender {
     [[UIApplication sharedApplication].delegate performSelector:@selector(onPlayButton)];
}

@end
