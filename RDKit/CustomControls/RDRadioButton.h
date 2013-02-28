//
//  RDRadioButton.h
//  RDKit
//
//  Created by Alexey Dozortsev on 28.02.13.
//  Copyright (c) 2013 Alexey Dozortsev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDRadioButton : UIControl

@property (nonatomic, readonly) NSString* valueId;
@property (nonatomic, readonly) NSString* groupId;
@property (nonatomic, strong)   UIImage* backgroundImage;
@property (nonatomic, strong)   UIImage* checkmarkImage;
@property (nonatomic, assign)   BOOL on;

- (id)initWithFrame:(CGRect)frame valueId:(NSString*)valueId groudId:(NSString*)groupId;

@end
