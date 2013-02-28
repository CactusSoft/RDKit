//
//  RDRSSView.h
//  RDKit
//
//  Created by Alexey Dozortsev on 27.02.13.
//  Copyright (c) 2013 Alexey Dozortsev. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RDRSSViewDataSource<NSObject>
@required
- (UIView*)viewForRssWithTitle:(NSString*)title date:(NSDate*)date;
- (void)reuseView:(UIView*)view forRssWithTitle:(NSString*)title date:(NSDate*)date;

@end


@interface RDRSSView : UIView

@end
