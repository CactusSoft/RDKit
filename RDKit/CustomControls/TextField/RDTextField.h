//
//  RDTextField.h
//  RDKit
//
//  Created by Alexey Dozortsev on 12/3/12.
//  Copyright (c) 2012 Alexey Dozortsev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDTextField : UITextField
@property (nonatomic, strong) UIImage* inputBackground;
@property (nonatomic, assign) UIEdgeInsets textInsets;
@end
