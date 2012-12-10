//
//  NSArray+BlocksExtension.h
//  RDKit
//
//  Created by Alexey Dozortsev on 07.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (BlocksExtension)
- (id)objectWithBlock:(BOOL(^)(id object))compare;
- (NSMutableArray*)objectsWithBlock:(BOOL(^)(id object))compare;
- (NSUInteger)countOfObjectsWithBlock:(BOOL(^)(id object))compare;
- (id)objectAtIndex:(NSUInteger)index withCondition:(BOOL(^)(id object))compare;
@end

@interface NSMutableArray (BlocksExtension)
- (id)objectWithBlock:(BOOL(^)(id object))compare;
- (NSMutableArray*)objectsWithBlock:(BOOL(^)(id object))compare;
- (NSUInteger)countOfObjectsWithBlock:(BOOL(^)(id object))compare;
- (id)objectAtIndex:(NSUInteger)index withCondition:(BOOL(^)(id object))compare;
@end
