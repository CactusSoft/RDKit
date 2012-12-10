//
//  NSMutableArray+WeakReferences.m
//  RDKit
//
//  Created by Alexey Dozortsev on 10.12.12.
//  Copyright (c) 2012 Alexey Dozortsev. All rights reserved.
//

#import "NSMutableArray+WeakReferences.h"

@implementation NSMutableArray (WeakReferences)

+ (id)arrayWithWeakReferences
{
    return [self arrayWithWeakReferencesWithCapacity:0];
}

+ (id)arrayWithWeakReferencesWithCapacity:(NSUInteger)capacity;
{
    CFArrayCallBacks callbacks = {0, NULL, NULL, CFCopyDescription, CFEqual};
    return (__bridge id)(CFArrayCreateMutable(0, capacity, &callbacks));
}

@end
