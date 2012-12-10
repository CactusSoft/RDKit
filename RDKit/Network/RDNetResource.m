//
//  RDNetResource.m
//  RDKit
//
//  Created by Alexey Dozortsev on 07.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDNetResource.h"
#import "NSMutableArray+WeakReferences.h"

@interface RDNetResource()
{
    NSMutableArray* _delegates;
}
@end

@implementation RDNetResource

@synthesize state = _state;

- (void)setState:(RDNetResourceState)state
{
    RDNetResourceState prevState = _state;
    _state = state;
    for (id<RDNetResourceDelegate> delegate in _delegates) {
        [delegate resource:self didChangeState:prevState to:_state];
    }
}

- (id)init
{
    self = [super init];
    if (self) {
        _delegates = [NSMutableArray arrayWithWeakReferences];
    }
    return self;
}

- (void)subscribe:(id<RDNetResourceDelegate>)delegate
{
    [_delegates addObject:delegate];
}

- (void)unsubscribe:(id<RDNetResourceDelegate>)delegate
{
    [_delegates removeObject:delegate];
}

- (void)load
{
}

- (void)cancel
{
}

- (void)dealloc
{
    for (id<RDNetResourceDelegate> delegate in _delegates) {
        [delegate resourceWillDelete:self];
    }
}

@end
