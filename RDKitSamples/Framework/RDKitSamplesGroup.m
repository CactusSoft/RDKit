//
//  RDKitSamplesGroup.m
//  RDKit
//
//  Created by Alexey Dozortsev on 12/3/12.
//  Copyright (c) 2012 Alexey Dozortsev. All rights reserved.
//

#import "RDKitSamplesGroup.h"

#pragma mark - RDKitSamplesGroup
@interface RDKitSamplesGroup()
{
    NSString* _name;
    NSMutableArray* _sampleClasses;
}
@end


@implementation RDKitSamplesGroup

@synthesize name = _name;
@synthesize sampleClasses = _sampleClasses;

- (id)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        _name = name;
        _sampleClasses = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addObject:(Class)sampleClass
{
    [_sampleClasses addObject:sampleClass];
}

@end
