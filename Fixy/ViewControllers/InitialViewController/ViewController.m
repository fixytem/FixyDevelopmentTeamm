//
//  ViewController.m
//  Fixy
//
//  Created by Jignesh kalantri on 20/09/15.
//  Copyright (c) 2015 My personal mac. All rights reserved.
//

#import "ViewController.h"
#import "HelpViewController.h"
@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonSkipDidPressed:(id)sender
{

    HelpViewController *helpView = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
    [self presentViewController:helpView animated:YES completion:^{
        
    }];
    
}


@end
