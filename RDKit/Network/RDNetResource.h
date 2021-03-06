//
//  RDNetResource.h
//  RDKit
//
//  Created by Alexey Dozortsev on 07.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RDNetResourceState) {
    RDNetResourceStateInvalid = 0,
    RDNetResourceStateLoading,
    RDNetResourceStateProcessing,
    RDNetResourceStateCanceled,
    RDNetResourceStateFailed,
    RDNetResourceStateReady
};

@protocol RDNetResource;


@protocol RDNetResourceDelegate <NSObject>
@required
- (void)resource:(id<RDNetResource>)resource didChangeState:(RDNetResourceState)fromState to:(RDNetResourceState)toState;
- (void)resourceWillDelete:(id<RDNetResource>)resource;
@end


@protocol RDNetResource <NSObject>
@required

@property (nonatomic, readonly) RDNetResourceState state;

- (void)subscribe:(id<RDNetResourceDelegate>)delegate;
- (void)unsubscribe:(id<RDNetResourceDelegate>)delegate;

- (void)load;
- (void)reload;
- (void)cancel;

@end


@interface RDNetResource : NSObject<RDNetResource>

@end
