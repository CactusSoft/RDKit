//
//  RDRSSView.m
//  RDKit
//
//  Created by Alexey Dozortsev on 27.02.13.
//  Copyright (c) 2013 Alexey Dozortsev. All rights reserved.
//

#import "RDRSSView.h"

@interface RDRSSView()

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSArray* urls;

@end


@implementation RDRSSView

#pragma mark initialize

- (id)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.tableView = [[UITableView alloc] initWithFrame:self.bounds];
        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        self.tableView.backgroundView = nil;
        self.tableView.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.tableView = [[UITableView alloc] initWithFrame:self.bounds];
        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        self.tableView.backgroundView = nil;
        self.tableView.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.tableView = [[UITableView alloc] initWithFrame:self.bounds];
        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        self.tableView.backgroundView = nil;
        self.tableView.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)dealloc
{
    
}

@end
