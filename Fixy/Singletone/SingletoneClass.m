//
//  SingletoneClass.m
//  Fixy
//
//  Created by Jignesh kalantri on 20/09/15.
//  Copyright (c) 2015 My personal mac. All rights reserved.
//

#import "SingletoneClass.h"

@implementation SingletoneClass


+(BOOL)isToShowHelp
{
    return [[NSUserDefaults standardUserDefaults]boolForKey:@"keyForShowHelp"];;
}

+(void)setIsToShowHelp:(BOOL)isToShow
{
    [[NSUserDefaults standardUserDefaults]setBool:isToShow forKey:@"keyForShowHelp"];
}

@end
