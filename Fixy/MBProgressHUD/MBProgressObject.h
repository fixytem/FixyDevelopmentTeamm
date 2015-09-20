//
//  MGProgressObject.h
//  Menu2Go
//
//  Created by Prateek on 1/2/14.
//  Copyright (c) 2014 Menu2Go. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface MBProgressObject : NSObject
{
    
}

@property (nonatomic, strong) MBProgressHUD *HUD;

+(MBProgressObject*)sharedInstance;

+(void)show:(BOOL)isToShow;

+(void)show:(BOOL)isToShow withStatus:(NSString *)status;

@end