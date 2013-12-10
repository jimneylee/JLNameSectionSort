//
//  User.h
//  JLNameSectionSort
//
//  Created by jimney on 13-3-12.
//  Copyright (c) 2013年 jimneylee. All rights reserved.
//

#import "JLNameItem.h"

@interface User : JLNameItem

- (id)intWithName:(NSString*)name;
+ (id)createWithDictionary:(NSDictionary*)dic;

@end
