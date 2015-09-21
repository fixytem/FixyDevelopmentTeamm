//
//  HelpViewController.m
//  Fixy
//
//  Created by Jignesh kalantri on 20/09/15.
//  Copyright (c) 2015 My personal mac. All rights reserved.
//

#import "HelpViewController.h"
#import "ManualViewController.h"

@interface HelpViewController ()

@property (readonly) CLLocationCoordinate2D currentUserCoordinate;

@end

@implementation HelpViewController
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#pragma mark - ================
#pragma mark - UIview cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self findingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - ================
#pragma mark -



#pragma mark - ================
#pragma mark - Location Delegates
-(void) findingLocation
{

    if(locationManager==nil)
    {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    }
    
    
    locationManager.delegate = self;
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)
    {
        CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
        
        NSLog(@"STATUS = %d",status);
        
        // If the status is denied or only granted for when in use, display an alert
        if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusDenied )
        {
            NSString *title;
            title = (status == kCLAuthorizationStatusDenied || status == kCLAuthorizationStatusNotDetermined) ? @"Location services are off" : @"Background location is not enabled";
            NSString *message = @"You can enable access in Settings->Privacy->Location->Location Services";
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                                message:message
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil, nil];
            [alertView show];
        }
        // The user has not enabled any location services. Request background authorization.
        else if (status == kCLAuthorizationStatusNotDetermined)
        {
            [locationManager requestAlwaysAuthorization];
        }
    }
    

    [locationManager startUpdatingLocation];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"OldLocation %f %f", oldLocation.coordinate.latitude, oldLocation.coordinate.longitude);
    NSLog(@"NewLocation %f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    
    locationManager.delegate = nil;
    [locationManager stopUpdatingLocation];
    _currentUserCoordinate = [newLocation coordinate];
    
    
    NSLog(@"latitude ...%@", [NSString stringWithFormat:@"%f",_currentUserCoordinate.latitude]);
    NSLog(@"longitude ...%@", [NSString stringWithFormat:@"%f",_currentUserCoordinate.longitude]);
    
    
    currentLatitude =  _currentUserCoordinate.latitude;
    currentLongitude = _currentUserCoordinate.longitude;
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Location Services Disabled." message:@"Please Enable The Location Services On Your Device." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
    
    
    
    
    NSLog(@"location manager failed = %@",error.localizedDescription);
}
#pragma mark - ================


#pragma mark - ================
#pragma mark - Navigation To Other Classes

-(IBAction)movingToManualLocationService:(id)sender
{

    ManualViewController *manualView = [[ManualViewController alloc] initWithNibName:@"ManualViewController" bundle:nil];
    [self presentViewController:manualView animated:YES completion:^{
        
    }];
}

#pragma mark - ================


@end
