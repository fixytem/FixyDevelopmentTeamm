//
//  ViewController.h
//  Fixy
//
//  Created by Jignesh kalantri on 20/09/15.
//  Copyright (c) 2015 My personal mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{

     IBOutlet       UICollectionView *collectionViewStates;
     NSMutableArray                  *arrayForShowStates;
    
     IBOutlet UIPageControl          *pageControl;
}

-(IBAction)buttonSkipDidPressed:(id)sender;

- (IBAction)clickPageControl:(id)sender;

@end

