//
//  ContacListEntity.m
//  ContactListSortDemo
//
//  Created by jimney on 13-3-12.
//  Copyright (c) 2013年 jimneylee. All rights reserved.
//

@interface SectionListBaseEntity : NSObject

@property (nonatomic, retain) NSMutableArray* unsortedArray;
@property (nonatomic, retain) NSMutableArray* sections;
@property (nonatomic, retain) NSMutableArray* items;

- (void)sort;

@end
