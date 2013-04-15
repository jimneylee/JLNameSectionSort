//
//  ViewController.m
//  ContactListSortDemo
//
//  Created by Lee jimney on 4/15/13.
//  Copyright (c) 2013 Lee jimney. All rights reserved.
//

#import "ViewController.h"
#import "ContacListEntity.h"
#import "ContactEntity.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc {
    self.contactList = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 测试数据示例
    NSArray* contactListArray = @[
                                @{@"name":@"marialee"},@{@"name":@"马哥"},@{@"name":@"阿山"},
                                @{@"name":@"阿宏"},@{@"name":@"阿江"},@{@"name":@"helena"},
                                @{@"name":@"coco"},@{@"name":@"jack船长"},@{@"name":@"科比"},
                                @{@"name":@"Kobe"},@{@"name":@"messi"},@{@"name":@"梅西"},
                                @{@"name":@"wondergirl"},@{@"name":@"少女时代"},@{@"name":@"苍老师"},
                                @{@"name":@"jimneylee"},@{@"name":@"jin"},@{@"name":@"9527"},
                                @{@"name":@"_正_"},@{@"name":@"梅西messi"},@{@"name":@"科比bryant"},
                                @{@"name":@"jjlee"},@{@"name":@"x5"},@{@"name":@"H7N9"},
                                @{@"name":@"禽流感"},@{@"name":@"bryant"},@{@"name":@"Jin"},
                                @{@"name":@"a山"},@{@"name":@"a宏"},@{@"name":@"阿jiang"},
                                @{@"name":@"ashan"},@{@"name":@"ahong"},@{@"name":@"ajiang"}
                                ];
    // 获取列表数据源
    self.contactList = [ContacListEntity createWithSourceArray:contactListArray];    
}


#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.contactList.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray* aItems = [self.contactList.items objectAtIndex:section];
    return aItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"ContactCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier] autorelease];
    }
    if (self.contactList.items.count > indexPath.section) {
        NSArray* aItems = [self.contactList.items objectAtIndex:indexPath.section];
        if (aItems.count > indexPath.row) {
            ContactEntity* contact = [aItems objectAtIndex:indexPath.row];
            cell.textLabel.text = contact.name;
        }
    }

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.contactList.sections.count > section) {
        return [self.contactList.sections objectAtIndex:section];
    }
    return @"";
}

@end
