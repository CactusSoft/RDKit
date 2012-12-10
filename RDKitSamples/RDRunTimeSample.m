//
//  RDRunTimeSample.m
//  RDKit
//
//  Created by Alexey Dozortsev on 12/10/12.
//  Copyright (c) 2012 Alexey Dozortsev. All rights reserved.
//

#import "RDRunTimeSample.h"
#import "NSObject+RDRuntime.h"

@interface RDRunTimeSample ()

@end

@implementation RDRunTimeSample

+ (NSString*)group
{
    return @"Runtime";
}

+ (NSString*)title
{
    return @"RDRuntime";
}

+ (NSString*)subtitle
{
    return @"Sample for core runtime";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel* label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.textAlignment = UITextAlignmentCenter;
    label.text = @"Not implemented";
    [self.view addSubview:label];
}

@end
