//
//  ContacListEntity.m
//  ContactListSortDemo
//
//  Created by jimney on 13-3-12.
//  Copyright (c) 2013年 jimneylee. All rights reserved.
//

#import "SectionItemBaseEntity.h"

@interface ContactEntity : SectionItemBaseEntity

@property (nonatomic, copy) NSString* userId;

- (id)intWithName:(NSString*)name userId:(NSString*)userId;
+ (id)createWithDictionary:(NSDictionary*)dic;

@end
