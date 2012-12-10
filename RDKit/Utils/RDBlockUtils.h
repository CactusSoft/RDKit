//
//  RDBlockUtils.h
//  RDKit
//
//  Created by Anna Goman on 04.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

void RunBlockAfterDelay(NSTimeInterval delay, void (^block)(void));
void RunBlockInMainThread(void (^block)(void));
void RunBlockInBackgroundThread(void (^block)(void));
