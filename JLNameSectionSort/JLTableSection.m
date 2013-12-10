//
//  JLTableSection.m
//  JLNameSectionSort
//
//  Created by jimney on 13-3-12.
//  Copyright (c) 2013年 jimneylee. All rights reserved.
//

#import "JLTableSection.h"
#import "JLNameItem.h"

@implementation JLTableSection

- (void)sort
{
    NSMutableArray* sections = [NSMutableArray array];
    NSMutableArray* items = [NSMutableArray array];
    NSMutableArray* aItems = nil;
    
#ifdef DEBUG
    NSLog(@"================before====================");
    for (JLNameItem* item in self.unsortedArray) {
        NSLog(@"%@", item.name);
    }
#endif
    
    // 调用内部方法进行compare
    NSArray* sortedArray = [self.unsortedArray sortedArrayUsingSelector:@selector(compare:)];
    
#ifdef DEBUG
    NSLog(@"=================after sort=====================");
    
    for (JLNameItem* item in sortedArray) {
        NSLog(@"%@", item.name);
    }
#endif
    // step1、初始生成26 + 1个sections和items
    // step2、根据每个话题首字母，插入对应的数组aItems中
    // step3、删除没有元素的数组aItems和section
    
    // step1
    for (unichar c = 'A'; c <= 'Z'; c++) {
        [sections addObject:[NSString stringWithFormat:@"%c", c]];
        [items addObject:[NSMutableArray array]];
    }
    [sections addObject:@"#"];
    [items addObject:[NSMutableArray array]];
    
    // step2
    int index = 0;
    for (JLNameItem* item in sortedArray) {
        if (item.firstLetter >= 'A' && item.firstLetter <= 'Z') {
            index = item.firstLetter - 'A';
            aItems = [items objectAtIndex:index];
            [aItems addObject:item];
        }
        else {
            aItems = [items objectAtIndex:items.count - 1];
            [aItems addObject:item];
        }
    }
    
    // step3
    NSMutableArray* newSections = [NSMutableArray array];
    NSMutableArray* newItems = [NSMutableArray array];
    aItems = nil;
    for (int i = 0; i < items.count; i++) {
        aItems = [items objectAtIndex:i];
        if (aItems.count > 0) {
            [newSections addObject:[sections objectAtIndex:i]];
            [newItems addObject:aItems];
        }
    }
    
    self.sectionTitles = newSections;
    self.setionItems = newItems;
    
#ifdef DEBUG
    NSLog(@"=================after section===============");
    for (NSArray* array in self.setionItems) {
        NSLog(@"________________________________________");
        for (JLNameItem* item in array) {
            NSLog(@"%@", item.name);
        }
    }
    NSLog(@"=================end======================");
#endif
}
@end
