//
//  RDRSSSampleController.m
//  RDKit
//
//  Created by Alexey Dozortsev on 27.02.13.
//  Copyright (c) 2013 Alexey Dozortsev. All rights reserved.
//

#import "RDRSSSampleController.h"
#import "RDRSSView.h"

@interface RDRSSSampleController ()<RDRSSViewDataSource>

@end


@implementation RDRSSSampleController

+ (NSString*)group
{
    return @"User Interface";
}

+ (NSString*)title
{
    return @"RDRSSView";
}

+ (NSString*)subtitle
{
    return @"Sample for RDRSSView";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
	
    RDRSSView* rssView = [[RDRSSView alloc] initWithFrame:UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsetsMake(30, 30, 30, 30))];
    rssView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    rssView.backgroundColor = [UIColor redColor];
    [self.view addSubview:rssView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - RDRSSViewDataSource
- (UIView*)viewForRssWithTitle:(NSString*)title date:(NSDate*)date
{
    return nil;
}

- (void)reuseView:(UIView*)view forRssWithTitle:(NSString*)title date:(NSDate*)date
{
    
}

@end
