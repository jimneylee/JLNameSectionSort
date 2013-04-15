//
//  ContacListEntity.m
//  ContactListSortDemo
//
//  Created by jimney on 13-3-12.
//  Copyright (c) 2013年 jimneylee. All rights reserved.
//

#import "ContactEntity.h"
#import "pinyin.h"

@implementation ContactEntity

- (id)intWithName:(NSString*)name userId:(NSString*)userId
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
    
	ContactEntity* entity = [[[ContactEntity alloc] init] autorelease];
    
    entity.userId = dic[@"id"];
	entity.name = dic[@"name"];
    // 其他属性
    // ......
    
    if (entity.name.length > 0) {
        entity.sortString = [entity createSortString];
        return entity;
    }
    
    else return nil;
}

- (void)dealloc {
    self.userId = nil;;
    [super dealloc];
}

@end
