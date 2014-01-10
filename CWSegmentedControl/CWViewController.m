//
//  CWViewController.m
//  CWSegmentedControl
//
//  Created by ly on 14-1-10.
//  Copyright (c) 2014年 ly. All rights reserved.
//

#import "CWViewController.h"
#import "CWSegmentedControl.h"

#define CachedImage(name) [UIImage imageNamed:name]

@interface CWViewController ()

@end

@implementation CWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    NSArray *normalImages = @[CachedImage(@"navigationbar_left"), CachedImage(@"navigationbar_middle"), CachedImage(@"navigationbar_right")];
    NSArray *highlightImages = @[CachedImage(@"navigationbar_left_select"), CachedImage(@"navigationbar_middle_select"), CachedImage(@"navigationbar_right_select")];
    
    CWSegmentedControl *control = [[CWSegmentedControl alloc] initWithItems:@[@"选项 A", @"选项 B", @"选项 C"] normalImages:normalImages highlightImages:highlightImages];
    
    control.frame = CGRectMake((320-225)/2.0, 67, 225.0, 30.0);
    
    [self.view addSubview:control];
}


@end
