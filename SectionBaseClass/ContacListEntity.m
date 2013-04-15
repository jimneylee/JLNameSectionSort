//
//  ContacListEntity.m
//  ContactListSortDemo
//
//  Created by jimney on 13-3-12.
//  Copyright (c) 2013年 jimneylee. All rights reserved.
//

#import "ContacListEntity.h"
#import "ContactEntity.h"

@implementation ContacListEntity

+ (id)createWithSourceArray:(NSArray*)sourceArray
{
    ContacListEntity* listEntity = [[[ContacListEntity alloc] init] autorelease];
    
    if (sourceArray.count > 0) {
        listEntity.unsortedArray = [NSMutableArray arrayWithCapacity:sourceArray.count];
        
        for (NSDictionary* dic in sourceArray) {
            ContactEntity* entity = [ContactEntity createWithDictionary:dic];
            if (entity) {
                [listEntity.unsortedArray addObject:entity];
            }
        }
        
        // 列表内所有元素分组并排序
        [listEntity sort];
    }
    
    return listEntity;
}

@end
