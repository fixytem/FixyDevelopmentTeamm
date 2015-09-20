//
//  BaseViewController.m
//  Fixy
//
//  Created by Jignesh kalantri on 20/09/15.
//  Copyright (c) 2015 My personal mac. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(AppDelegate *)appDelegate{
    appDelegate=[UIApplication sharedApplication].delegate;
    return appDelegate;
}
MBProgressHUD * HUD=nil;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}



#pragma
#pragma ========================
#pragma mark -
#pragma ========================
-(void)removeBusyView{
    if (HUD!=nil) {
        [HUD hide:YES];
        [HUD removeFromSuperview];
        HUD=nil;
    }
}

-(void)showBusyIndicatiorWithMessage:(NSString *)strMsg{
    [self removeBusyView];
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.navigationController.view addSubview:HUD];
    HUD.labelFont=[UIFont fontWithName:@"Arial" size:15.0];
    HUD.delegate = self;
    HUD.labelText = strMsg;
    [HUD show:YES];
    [self.view bringSubviewToFront:HUD];
}

#pragma
#pragma ========================
#pragma mark - Alert View
#pragma ========================

-(void)showErrorMessage:(NSString *)messageStr{
    
}

#pragma
#pragma ========================
#pragma mark - Text Filed
#pragma ========================

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{

    [textField resignFirstResponder];
    return YES;
}

@end
