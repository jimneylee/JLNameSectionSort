//
//  ContacListEntity.m
//  ContactListSortDemo
//
//  Created by jimney on 13-3-12.
//  Copyright (c) 2013年 jimneylee. All rights reserved.
//

#import "SectionItemBaseEntity.h"
#import "pinyin.h"

@implementation SectionItemBaseEntity
@synthesize name = _name, sortString = _sortString, firstLetter = _firstLetter;

- (void)dealloc {
    self.name = nil;
    self.sortString = nil;
    [super dealloc];
}

#pragma mark Private
- (NSString* )createSortString
{
    NSMutableString* sortedString = [NSMutableString string];
    unichar aChar;
    unichar pinyinChar;
    for (int i = 0; i < self.name.length; i++) {
        aChar = [self.name characterAtIndex:i];
        // 判断首字母是否为英文
        if ((aChar >= 'A' && aChar <= 'Z') ||
            (aChar >= 'a' && aChar <= 'z') ) {
            [sortedString appendString:[NSString stringWithFormat:@"%c", aChar]];
            if (0 == i) {
                self.firstLetter = [[[NSString stringWithFormat:@"%c", aChar] uppercaseString] characterAtIndex:0];
            }
        }
        // 判断首字母是否为汉子
        else if (isFirstLetterHANZI(aChar)) {
            pinyinChar = pinyinFirstLetter(aChar);
            [sortedString appendString:[NSString stringWithFormat:@"%c", pinyinChar + 26]];
            if (0 == i) {
                self.firstLetter= [[[NSString stringWithFormat:@"%c", pinyinChar] uppercaseString] characterAtIndex:0];
            }
        }
        // 为其他非字母和汉子字符
        else {
            if (0 == i) {
                self.firstLetter = '#';
            }
        }
    }
    return sortedString;
}

#pragma mark Private

- (NSComparisonResult)compare:(SectionItemBaseEntity*)other
{
    return [self.sortString compare:other.sortString];
}

@end
