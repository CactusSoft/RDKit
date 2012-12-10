//
//  RDKitSampleController.m
//  RDKit
//
//  Created by Alexey Dozortsev on 03.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDKitSampleController.h"

@interface RDKitSampleController ()

@end

@implementation RDKitSampleController

+ (NSString*)group
{
    return @"";
}

+ (NSString*)title
{
    return NSStringFromClass(self);
}

+ (NSString*)subtitle
{
    return nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = [isa title];
}

@end
