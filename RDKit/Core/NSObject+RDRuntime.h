//
//  NSObject+RDRuntime.h
//  RDKit
//
//  Created by Alexey Dozortsev on 07.12.12.
//  Copyright (c) 2012 Alexey Dozortsev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(RDKitRuntime)

+ (void)swizzleMethod:(SEL)origSel withMethod:(SEL)altSel;

@end
