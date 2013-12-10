//
//  UserTableSection.m
//  JLNameSectionSort
//
//  Created by jimney on 13-3-12.
//  Copyright (c) 2013年 jimneylee. All rights reserved.
//

#import "UserTableSection.h"
#import "User.h"

@implementation UserTableSection

+ (id)createWithSourceArray:(NSArray*)sourceArray
{
    if (sourceArray.count > 0) {
        UserTableSection* tableSection = [[UserTableSection alloc] init];
        tableSection.unsortedArray = [NSMutableArray arrayWithCapacity:sourceArray.count];
        for (NSDictionary* dic in sourceArray) {
            User* item = [User createWithDictionary:dic];
            if (item) {
                [tableSection.unsortedArray addObject:item];
            }
        }
        [tableSection sort];
        return tableSection;
    }
    else return  nil;
}

@end
