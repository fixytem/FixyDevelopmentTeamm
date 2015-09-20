//
//  HelpViewController.h
//  Fixy
//
//  Created by Jignesh kalantri on 20/09/15.
//  Copyright (c) 2015 My personal mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface HelpViewController : UIViewController <CLLocationManagerDelegate>
{

    
    CLLocationManager * locationManager;
    
    
}
@end
