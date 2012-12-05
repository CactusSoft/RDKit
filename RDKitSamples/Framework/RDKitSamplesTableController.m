//
//  RDKitSamplesTableController.m
//  RDKit
//
//  Created by Alexey Dozortsev on 12/3/12.
//  Copyright (c) 2012 Alexey Dozortsev. All rights reserved.
//

#import "RDKitSamplesTableController.h"
#import "RDKitSampleController.h"
#import "RDKitSamplesGroup.h"
#import <objc/runtime.h>

static NSArray* getSubclassesForClass(Class parentClass)
{
    int numClasses = objc_getClassList(NULL, 0);
    Class* classes = NULL;
    
    classes = (Class*)malloc(sizeof(Class) * numClasses);
    numClasses = objc_getClassList(classes, numClasses);
    
    NSMutableArray* result = [NSMutableArray array];
    for (NSInteger i = 0; i < numClasses; i++)
    {
        Class superClass = classes[i];
        do {
            superClass = class_getSuperclass(superClass);
        } while(superClass && superClass != parentClass);
        
        if (superClass == nil)
        {
            continue;
        }
        [result addObject:classes[i]];
    }
    
    free(classes);
    
    return result;
}


@interface RDKitSamplesTableController ()
{
    NSMutableArray* samples;
}
@end

@implementation RDKitSamplesTableController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"RDKit samples";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSArray* sampleControllers = getSubclassesForClass([RDKitSampleController class]);
    NSMutableDictionary* groups = [[NSMutableDictionary alloc] init];
    for (Class sampleClass in sampleControllers) {
        NSString* groupName = [sampleClass group];
        RDKitSamplesGroup* group = [groups objectForKey:groupName];
        if (group == nil) {
            group = [[RDKitSamplesGroup alloc] initWithName:groupName];
            [groups setObject:group forKey:group.name];
        }
        [group addObject:sampleClass];
    }
    samples = [groups.allValues mutableCopy];
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return samples.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [(RDKitSamplesGroup*)[samples objectAtIndex:section] sampleClasses].count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [(RDKitSamplesGroup*)[samples objectAtIndex:section] name];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class sample = [[(RDKitSamplesGroup*)[samples objectAtIndex:indexPath.section] sampleClasses] objectAtIndex:indexPath.row];
    
    static NSString* cellIdentifier = @"RDKitSampleCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [sample title];
    cell.detailTextLabel.text = [sample subtitle];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    Class sample = [[(RDKitSamplesGroup*)[samples objectAtIndex:indexPath.section] sampleClasses] objectAtIndex:indexPath.row];
    UIViewController* controller = [[sample alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
