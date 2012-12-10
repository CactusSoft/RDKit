//
//  RDCheckBox.h
//  RDKit
//
//  Created by Alexey Dozortsev on 12/3/12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RDCheckBoxAlignment) {
    RDCheckBoxAlignmentRight = 0,
    RDCheckBoxAlignmentLeft,
};

@interface RDCheckBox : UIControl
@property (nonatomic, retain) UIImage*  backgroundImage;
@property (nonatomic, retain) UIImage*  checkMarkImage;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) UIColor*  titleColor;
@property (nonatomic, strong) UIFont*   titleFont;
@property (nonatomic, assign) RDCheckBoxAlignment alignment;
@property (nonatomic, assign) BOOL on;
@end
