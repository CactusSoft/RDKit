//
//  RDKitSampleController.h
//  RDKit
//
//  Created by Alexey Dozortsev on 12/3/12.
//  Copyright (c) 2012 Alexey Dozortsev. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark for create and add controller to samples, JUST INHERIT from this class

@interface RDKitSampleController : UIViewController
+ (NSString*)group;
+ (NSString*)title;
+ (NSString*)subtitle;
@end