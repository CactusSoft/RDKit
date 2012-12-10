//
//  RDCheckBox.h
//  RDKit
//
//  Created by Alexey Dozortsev on 03.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDCheckBox : UIControl
@property (nonatomic, retain) UIImage* backgroundImage;
@property (nonatomic, retain) UIImage* checkmarkImage;
@property (nonatomic, assign) BOOL on;
@end

