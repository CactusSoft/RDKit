//
//  RDNetworking.m
//  RDKit
//
//  Created by Alexey Dozortsev on 07.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDNetworking.h"

static NSString* const RDNetworkActivityNotification = @"RDNetworkActivityNotification";

static volatile NSUInteger networkActivityCounter = 0;

@interface RDNetworkManager()
+ (void)beginNetworkActivity;
+ (void)endNetworkActivity;
@end

@implementation RDNetworkManager

+ (id)sharedManager
{
    static dispatch_once_t once;
    static id sharedManager;
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

#pragma mark network statistic
- (NSUInteger)networkActivityCount
{
    return networkActivityCounter;
}

#pragma mark private
+ (void)beginNetworkActivity
{
    @synchronized(self) {
        if (networkActivityCounter == 0) {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
            [[NSNotificationCenter defaultCenter] postNotificationName:RDNetworkActivityNotification object:self];
        }
        networkActivityCounter++;
    }
}

+ (void)endNetworkActivity
{
    @synchronized(self) {
        NSAssert(networkActivityCounter > 0, @"Calls of beginNetworkActivity and endNetworkActivity must be paired");
        networkActivityCounter--;
        if (networkActivityCounter == 0) {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            [[NSNotificationCenter defaultCenter] postNotificationName:RDNetworkActivityNotification object:self];
        }
    }
}

@end
