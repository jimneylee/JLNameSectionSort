//
//  JLTableSection.m
//  JLNameSectionSort
//
//  Created by jimney on 13-3-12.
//  Copyright (c) 2013年 jimneylee. All rights reserved.
//

@interface JLTableSection : NSObject

@property (nonatomic, retain) NSMutableArray* unsortedArray;
@property (nonatomic, retain) NSMutableArray* sectionTitles;
@property (nonatomic, retain) NSMutableArray* setionItems;

- (void)sort;

@end
