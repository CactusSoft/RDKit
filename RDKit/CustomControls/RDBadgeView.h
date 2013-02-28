//
//  RDBadgeView.h
//  FourEnvelope
//
//  Created by Alexey Dozortsev on 03.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RDBadgeAllignment) {
    RDBadgeAllignmentRight = 0,
    RDBadgeAllignmentLeft,
    RDBadgeAllignmentCenter,
};

@interface RDBadgeView : UIView

@property (nonatomic, strong) NSString* text;
@property (nonatomic, strong) UIColor*  textColor;
@property (nonatomic, strong) UIFont*   font;
@property (nonatomic, strong) UIColor*  insetColor;
@property (nonatomic, strong) UIColor*  borderColor;
@property (nonatomic, assign) CGFloat   cornerRoundness;
@property (nonatomic, assign) BOOL      isBordered;
@property (nonatomic, assign) BOOL      isGlassed;
@property (nonatomic, strong) UIImage*  backgroindImage;
@property (nonatomic, assign) RDBadgeAllignment badgeAllignment;

- (id)initWithString:(NSString *)badgeString position:(CGPoint)position;

@end
