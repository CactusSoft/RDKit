//
//  RDNetworking.h
//  RDKit
//
//  Created by Alexey Dozortsev on 12/7/12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* RDNetworkActivityNotification;


@interface RDNetworkManager : NSObject

+ (id)sharedManager;

#pragma mark - statistic
- (NSUInteger)networkActivityCount;

@end
