//
//  RDBadgeView.m
//  FourEnvelope
//
//  Created by Alexey Dozortsev on 03.12.12.
//  Copyright (c) 2012 CactusSoft. All rights reserved.
//

#import "RDBadgeView.h"

@interface RDBadgeView()

- (void)updateFrame;
- (void)initialize;

@end


@implementation RDBadgeView

#pragma mark - setters/getters

@synthesize text = _text;

-(void)setBadgeAllignment:(RDBadgeAllignment)badgeAllignment
{
    _badgeAllignment = badgeAllignment;
    [self updateFrame];
}

- (void)setText:(NSString *)text
{
    _text = text;
    [self updateFrame];
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    [self updateFrame];
}

- (void)setCornerRoundness:(CGFloat)cornerRoundness
{
    _cornerRoundness = cornerRoundness;
    [self updateFrame];
}

- (void)setBackgroindImage:(UIImage *)backgroindImage
{
    _backgroindImage = [backgroindImage stretchableImageWithLeftCapWidth:floorf(backgroindImage.size.width/2) topCapHeight:floorf(backgroindImage.size.height/2)];
    [self updateFrame];
}

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.text = @"";
        [self initialize];
        [self updateFrame];
    }
    return self;
}

- (id)initWithString:(NSString *)badgeString position:(CGPoint)position
{
    self = [super initWithFrame:CGRectMake(position.x, position.y, 25, 25)];
	if (self!=nil) {
        self.text = badgeString;
        [self initialize];
        [self updateFrame];
	}
	return self;
}

- (void)initialize
{
    self.contentScaleFactor = [[UIScreen mainScreen] scale];
    self.backgroundColor = [UIColor clearColor];
    self.isBordered = YES;
    self.isGlassed = YES;
    self.borderColor = [UIColor whiteColor];
    self.insetColor = [UIColor redColor];
    self.textColor = [UIColor whiteColor];
    self.cornerRoundness = 0.4;
    self.font = [UIFont boldSystemFontOfSize:15];
}

- (void)updateFrame
{
    CGSize retValue;
	CGFloat rectWidth, rectHeight;
	CGSize stringSize = [self.text sizeWithFont:[UIFont boldSystemFontOfSize:12]];
	CGFloat flexSpace;
	if ([self.text length]>=2) {
		flexSpace = [self.text length];
		rectWidth = 25 + (stringSize.width + flexSpace); rectHeight = 25;
		retValue = CGSizeMake(rectWidth,rectHeight);
	} else {
		retValue = CGSizeMake(25, 25);
	}
    
    switch (self.badgeAllignment) {
        case RDBadgeAllignmentCenter:
            self.frame = CGRectMake(self.frame.origin.x - retValue.width/2, self.frame.origin.y - retValue.height/2, retValue.width, retValue.height);

            break;
        case RDBadgeAllignmentRight:
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, retValue.width, retValue.height);

            break;
        case RDBadgeAllignmentLeft:
            self.frame = CGRectMake(self.frame.origin.x - retValue.width, self.frame.origin.y - retValue.height, retValue.width, retValue.height);

            break;
        default:
            break;
    }
    
	[self setNeedsDisplay];
}

#pragma mark - Drawing

-(void) drawRoundedRectWithContext:(CGContextRef)context withRect:(CGRect)rect
{
	CGContextSaveGState(context);
    
	CGFloat radius = CGRectGetMaxY(rect)*self.cornerRoundness;
	CGFloat puffer = CGRectGetMaxY(rect)*0.10;
	CGFloat maxX = CGRectGetMaxX(rect) - puffer;
	CGFloat maxY = CGRectGetMaxY(rect) - puffer;
	CGFloat minX = CGRectGetMinX(rect) + puffer;
	CGFloat minY = CGRectGetMinY(rect) + puffer;
    
    CGContextBeginPath(context);
	CGContextSetFillColorWithColor(context, [self.insetColor CGColor]);
	CGContextAddArc(context, maxX-radius, minY+radius, radius, M_PI+(M_PI/2), 0, 0);
	CGContextAddArc(context, maxX-radius, maxY-radius, radius, 0, M_PI/2, 0);
	CGContextAddArc(context, minX+radius, maxY-radius, radius, M_PI/2, M_PI, 0);
	CGContextAddArc(context, minX+radius, minY+radius, radius, M_PI, M_PI+M_PI/2, 0);
	CGContextSetShadowWithColor(context, CGSizeMake(1.0,1.0), 3, [[UIColor blackColor] CGColor]);
    CGContextFillPath(context);
    
	CGContextRestoreGState(context);
}

- (void)drawShineWithContext:(CGContextRef)context withRect:(CGRect)rect
{
	CGContextSaveGState(context);
    
	CGFloat radius = CGRectGetMaxY(rect)*self.cornerRoundness;
	CGFloat puffer = CGRectGetMaxY(rect)*0.10;
	CGFloat maxX = CGRectGetMaxX(rect) - puffer;
	CGFloat maxY = CGRectGetMaxY(rect) - puffer;
	CGFloat minX = CGRectGetMinX(rect) + puffer;
	CGFloat minY = CGRectGetMinY(rect) + puffer;
	CGContextBeginPath(context);
	CGContextAddArc(context, maxX-radius, minY+radius, radius, M_PI+(M_PI/2), 0, 0);
	CGContextAddArc(context, maxX-radius, maxY-radius, radius, 0, M_PI/2, 0);
	CGContextAddArc(context, minX+radius, maxY-radius, radius, M_PI/2, M_PI, 0);
	CGContextAddArc(context, minX+radius, minY+radius, radius, M_PI, M_PI+M_PI/2, 0);
	CGContextClip(context);
    
	size_t num_locations = 2;
	CGFloat locations[2] = { 0.0, 0.4 };
	CGFloat components[8] = {  0.92, 0.92, 0.92, 1.0, 0.82, 0.82, 0.82, 0.4 };
    
	CGColorSpaceRef cspace;
	CGGradientRef gradient;
	cspace = CGColorSpaceCreateDeviceRGB();
	gradient = CGGradientCreateWithColorComponents (cspace, components, locations, num_locations);
    
	CGPoint sPoint, ePoint;
	sPoint.x = 0;
	sPoint.y = 0;
	ePoint.x = 0;
	ePoint.y = maxY;
	CGContextDrawLinearGradient (context, gradient, sPoint, ePoint, 0);
    
    CGColorSpaceRelease(cspace);
    CGGradientRelease(gradient);
    
	CGContextRestoreGState(context);
}

- (void)drawFrameWithContext:(CGContextRef)context withRect:(CGRect)rect
{
	CGFloat radius = CGRectGetMaxY(rect)*self.cornerRoundness;
	CGFloat puffer = CGRectGetMaxY(rect)*0.10;
    
	CGFloat maxX = CGRectGetMaxX(rect) - puffer;
	CGFloat maxY = CGRectGetMaxY(rect) - puffer;
	CGFloat minX = CGRectGetMinX(rect) + puffer;
	CGFloat minY = CGRectGetMinY(rect) + puffer;
    
    CGContextBeginPath(context);
	CGFloat lineSize = 2;

	CGContextSetLineWidth(context, lineSize);
	CGContextSetStrokeColorWithColor(context, [self.borderColor CGColor]);
	CGContextAddArc(context, maxX-radius, minY+radius, radius, M_PI+(M_PI/2), 0, 0);
	CGContextAddArc(context, maxX-radius, maxY-radius, radius, 0, M_PI/2, 0);
	CGContextAddArc(context, minX+radius, maxY-radius, radius, M_PI/2, M_PI, 0);
	CGContextAddArc(context, minX+radius, minY+radius, radius, M_PI, M_PI+M_PI/2, 0);
	CGContextClosePath(context);
	CGContextStrokePath(context);
}

- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
    if (self.backgroindImage == nil || ![self.backgroindImage isKindOfClass:[UIImage class]]) {
        [self drawRoundedRectWithContext:context withRect:rect];
        
        if (self.isGlassed) {
            [self drawShineWithContext:context withRect:rect];
        }
        
        if (self.isBordered) {
            [self drawFrameWithContext:context withRect:rect];
        }
    } else {
        [self.backgroindImage drawInRect:rect];
    }

	if ([self.text length]>0) {
		[self.textColor set];
		CGFloat sizeOfFont = 13.5;
		if ([self.text length]<2) {
			sizeOfFont += sizeOfFont*0.20;
        }
		UIFont *textFont = [UIFont fontWithName:self.font.fontName size:sizeOfFont];
		CGSize textSize = [self.text sizeWithFont:textFont];
		[self.text drawAtPoint:CGPointMake((rect.size.width/2-textSize.width/2), (rect.size.height/2-textSize.height/2)) withFont:textFont];
	}
}

@end
