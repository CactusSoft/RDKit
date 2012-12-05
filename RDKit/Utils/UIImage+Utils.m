//
//  UIImage+Utils.m
//  RDKit
//
//  Created by Alexey Dozortsev on 12/3/12.
//  Copyright (c) 2012 Alexey Dozortsev. All rights reserved.
//

#import "UIImage+Utils.h"

@implementation UIImage (Utils)

+ (id)stretchableFromCenterImageNamed:(NSString *)name
{
    UIImage* image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}

@end
