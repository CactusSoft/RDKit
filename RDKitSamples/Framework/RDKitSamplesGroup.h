//
//  RDKitSamplesGroup.h
//  RDKit
//
//  Created by Alexey Dozortsev on 12/3/12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RDKitSamplesGroup : NSObject
@property (nonatomic, readonly) NSString* name;
@property (nonatomic, readonly) NSArray*  sampleClasses;
- (id)initWithName:(NSString*)name;
- (void)addObject:(Class)sampleClass;
@end
