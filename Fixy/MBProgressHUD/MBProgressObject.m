//
//  MGProgressObject.m
//  Menu2Go
//
//  Created by Prateek on 1/2/14.
//  Copyright (c) 2014 Menu2Go. All rights reserved.
//

#import "MBProgressObject.h"

static MBProgressObject *sharedInstance;

@implementation MBProgressObject

@synthesize HUD;

+(MBProgressObject *)sharedInstance{
    
    @synchronized([MBProgressObject class]){
        
        if (sharedInstance==nil) {
            sharedInstance=[[self alloc]init];
        }
        return sharedInstance;
    }
    return nil;
}

-(id)init
{
    self.HUD = [[MBProgressHUD alloc] init];
    self.HUD.opacity = 1.0;
    return self;
}

+(void)show:(BOOL)isToShow
{
//    [self sharedInstance].HUD.graceTime = 0.1;
    [[self sharedInstance].HUD show:isToShow];
    if (isToShow)
    {
//        [[self sharedInstance].HUD setColor:[UIColor redColor]];
        [[[UIApplication sharedApplication]keyWindow]addSubview:[self sharedInstance].HUD];
    }
    else
    {
        [[self sharedInstance].HUD removeFromSuperview];
    }
}
+(void)show:(BOOL)isToShow withStatus:(NSString *)status
{
    [self show:isToShow];
    [[self sharedInstance].HUD setLabelText:status];
}
@end