//
//  BaseViewController.h
//  Fixy
//
//  Created by Jignesh kalantri on 20/09/15.
//  Copyright (c) 2015 My personal mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MBProgressHUD.h"

@interface BaseViewController : UIViewController<MBProgressHUDDelegate, UITextFieldDelegate>
{

    AppDelegate *appDelegate;

}

-(void)removeBusyView;
-(AppDelegate *)appDelegate;
-(void)showBusyIndicatiorWithMessage:(NSString *)strMsg;
-(void)showErrorMessage:(NSString *)messageStr;
-(void)showSuccessMessage:(NSString *)messageStr;
-(void)showAppMessage:(NSString *)messageStr;
@end
