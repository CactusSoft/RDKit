//
//  NSArray+BlocksExtension.m
//  RDKit
//
//  Created by Alexey Dozortsev on 27.03.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "NSArray+BlocksExtension.h"

@implementation NSArray (BlocksExtension)

- (id)objectWithBlock:(BOOL(^)(id object))compare
{
    for (id object in self) {
        if (compare(object)) {
            return object;
        }
    }
    return nil;
}

- (NSMutableArray*)objectsWithBlock:(BOOL(^)(id object))compare
{
    NSMutableArray* objects = [NSMutableArray arrayWithCapacity:self.count];
    for (id object in self) {
        if (compare(object)) {
            [objects addObject:object];
        }
    }
    return objects;
}

- (NSUInteger)countOfObjectsWithBlock:(BOOL(^)(id object))compare
{
    NSUInteger count = 0;
    for (id object in self) {
        if (compare(object)) {
            count++;
        }
    }
    return count;
}

- (id)objectAtIndex:(NSUInteger)index withCondition:(BOOL(^)(id object))compare
{
    NSUInteger localIndex = 0;
    for (id object in self) {
        if (compare(object)) {
            if (localIndex == index) {
                return object;
            }
            localIndex++;
        }
    }
    return nil;
}

@end


@implementation NSMutableArray (BlocksExtension)

- (id)objectWithBlock:(BOOL(^)(id object))compare
{
    for (id object in self) {
        if (compare(object)) {
            return object;
        }
    }
    return nil;
}

- (NSMutableArray*)objectsWithBlock:(BOOL(^)(id object))compare
{
    NSMutableArray* objects = [NSMutableArray arrayWithCapacity:self.count];
    for (id object in self) {
        if (compare(object)) {
            [objects addObject:object];
        }
    }
    return objects;
}

- (NSUInteger)countOfObjectsWithBlock:(BOOL(^)(id object))compare
{
    NSUInteger count = 0;
    for (id object in self) {
        if (compare(object)) {
            count++;
        }
    }
    return count;
}

- (id)objectAtIndex:(NSUInteger)index withCondition:(BOOL(^)(id object))compare
{
    NSUInteger localIndex = 0;
    for (id object in self) {
        if (compare(object)) {
            if (localIndex == index) {
                return object;
            }
            localIndex++;
        }
    }
    return nil;
}

@end
