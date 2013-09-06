//
//  NSMutableArray+WeakReferences.h
//  RDKit
//
//  Created by Alexey Dozortsev on 10.12.12.
//  Copyright (c) 2012 Alexey Dozortsev. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableArray (WeakReferences)

+ (id)arrayWithWeakReferences;

+ (id)arrayWithWeakReferencesWithCapacity:(NSUInteger)capacity;

@end
