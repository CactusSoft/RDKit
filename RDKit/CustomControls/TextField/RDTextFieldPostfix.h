//
//  RDTextFieldPostfix.h
//  RDKit
//
//  Created by Alexey Dozortsev on 12/3/12.
//  Copyright (c) 2012 Alexey Dozortsev. All rights reserved.
//

#import "RDTextField.h"

@interface RDTextFieldPostfix : RDTextField

@property (nonatomic, strong) NSString* postfix;
@property (nonatomic, strong) UIColor*  postfixColor;
@property (nonatomic, strong) UIFont*   postfixFont;

@property (nonatomic, strong) NSString* postfixPlaceholder;
@property (nonatomic, strong) UIColor*  postfixPlaceholderColor;
@property (nonatomic, strong) UIFont*   postfixPlaceholderFont;

@end
