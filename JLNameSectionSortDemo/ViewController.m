//
//  ViewController.m
//  userSectionArraySortDemo
//
//  Created by Lee jimney on 4/15/13.
//  Copyright (c) 2013 Lee jimney. All rights reserved.
//

#import "ViewController.h"
#import "UserTableSection.h"
#import "User.h"

@interface ViewController ()
@property (nonatomic, retain) UserTableSection* userSectionArray;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 测试数据
    NSArray* userSourceArray = @[
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
    self.userSectionArray = [UserTableSection createWithSourceArray:userSourceArray];    
}


#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.userSectionArray.sectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray* aItems = [self.userSectionArray.setionItems objectAtIndex:section];
    return aItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"UseCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier];
    }
    if (self.userSectionArray.setionItems.count > indexPath.section) {
        NSArray* aItems = [self.userSectionArray.setionItems objectAtIndex:indexPath.section];
        if (aItems.count > indexPath.row) {
            User* user = [aItems objectAtIndex:indexPath.row];
            cell.textLabel.text = user.name;
        }
    }

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.userSectionArray.sectionTitles.count > section) {
        return [self.userSectionArray.sectionTitles objectAtIndex:section];
    }
    return @"";
}

@end
