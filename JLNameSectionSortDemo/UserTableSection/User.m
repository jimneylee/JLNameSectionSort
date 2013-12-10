//
//  User.m
//  JLNameSectionSort
//
//  Created by jimney on 13-3-12.
//  Copyright (c) 2013年 jimneylee. All rights reserved.
//

#import "User.h"
#import "pinyin.h"

@implementation User

- (id)intWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        if (name.length > 0) {
            self.name = name;
            self.sortString = [super createSortString];
        }
    }
    return self;;
}

+ (id)createWithDictionary:(NSDictionary*)dic
{
    if (!dic || !dic.count) {
        return nil;
    }
    
	User* entity = [[User alloc] init];
	entity.name = dic[@"name"];
    // 其他属性
    // ......
    if (entity.name.length > 0) {
        entity.sortString = [entity createSortString];
        return entity;
    }
    else return nil;
}

@end
