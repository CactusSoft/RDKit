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
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) UIColor  *textColor;
@property (nonatomic, retain) UIFont   *font;
@property (nonatomic, retain) UIColor  *insetColor;
@property (nonatomic, retain) UIColor  *borderColor;
@property (nonatomic, assign) BOOL     isBordered;
@property (nonatomic, assign) BOOL     isGlassed;
@property (nonatomic, retain) UIImage  *backgroindImage;

@property (nonatomic, assign) RDBadgeAllignment badgeAllignment;

@property(nonatomic,readwrite) CGFloat cornerRoundness;

- (id)initWithString:(NSString *)badgeString position:(CGPoint)position;

@end
