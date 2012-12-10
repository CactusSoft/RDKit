//
//  UIImage+Utils.h
//  RDKit
//
//  Created by Alexey Dozortsev on 03.12.12.
//  Edited by Anna Goman on 04.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utils)

+ (id)stretchableFromCenterImageNamed:(NSString *)name;

- (UIImage *)scaleToSize:(CGSize)size;
- (UIImage *)scaleProportionalToSize:(CGSize)size;

@end
