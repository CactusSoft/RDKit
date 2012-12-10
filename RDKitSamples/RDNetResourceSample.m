//
//  RDNetResourceSample.m
//  RDKit
//
//  Created by Alexey Dozortsev on 12/7/12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDNetResourceSample.h"
#import "RDNetworking.h"
#import "RDNetResource.h"

@interface RDNetResourceSample ()
{
    UILabel* _networkActivityCountLabel;
}

- (void)networkActivityChanged:(NSNotification*)notification;

@end


@implementation RDNetResourceSample

+ (NSString*)group
{
    return @"Network resource";
}

+ (NSString*)title
{
    return @"RDNetResource";
}

+ (NSString*)subtitle
{
    return @"Sample for RDNetResource";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _networkActivityCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 30)];
    _networkActivityCountLabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth;
    _networkActivityCountLabel.textAlignment = NSTextAlignmentCenter;
    _networkActivityCountLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_networkActivityCountLabel];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkActivityChanged:) name:RDNetworkActivityNotification object:nil];
    [self networkActivityChanged:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    
}

#pragma mark - notifications
- (void)networkActivityChanged:(NSNotification*)notification
{
    _networkActivityCountLabel.text = [NSString stringWithFormat:@"Network activity count : %3d", 3];
}

@end
