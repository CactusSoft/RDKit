//
//  NSObject+RDRuntime.m
//  RDKit
//
//  Created by Alexey Dozortsev on 12/7/12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "NSObject+RDRuntime.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject(RDKitRunTime)

+ (void)swizzleMethod:(SEL)origSel withMethod:(SEL)altSel
{
    Class class = [self class];
    Method origMethod = class_getInstanceMethod(class, origSel);
    Method altMethod = class_getInstanceMethod(class, altSel);
    if (class_addMethod(class, origSel, method_getImplementation(altMethod), method_getTypeEncoding(altMethod))) {
        class_replaceMethod(class, altSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, altMethod);
    }
}

@end
