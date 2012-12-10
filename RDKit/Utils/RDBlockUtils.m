//
//  RDBlockUtils.m
//  RDKit
//
//  Created by Anna Goman on 04.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDBlockUtils.h"

void RunBlockAfterDelay(NSTimeInterval delay, void (^block)(void))
{
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC*delay), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

void RunBlockInMainThread(void (^block)(void))
{
    dispatch_async(dispatch_get_main_queue(), block);
}

void RunBlockInBackgroundThread(void (^block)(void))
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}
