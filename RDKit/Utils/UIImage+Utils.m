//
//  UIImage+Utils.m
//  RDKit
//
//  Created by Alexey Dozortsev on 03.12.12.
//  Edited by Anna Goman on 04.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "UIImage+Utils.h"

@implementation UIImage (Utils)

+ (id)stretchableFromCenterImageNamed:(NSString *)name
{
    UIImage* image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}

- (UIImage *)scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (UIImage *)scaleProportionalToSize:(CGSize)size
{
    if (self.size.width>self.size.height) {//landscape
        size=CGSizeMake((self.size.width/self.size.height)*size.height, size.height);
    } else {//potrait
        size=CGSizeMake(size.width, (self.size.height/self.size.width)*size.width);
    }
    return [self scaleToSize:size];
}

@end
