//
//  ViewController.m
//  Fixy
//
//  Created by Jignesh kalantri on 20/09/15.
//  Copyright (c) 2015 My personal mac. All rights reserved.
//

#import "ViewController.h"
#import "HelpViewController.h"
#import "CollectionViewCell.h"
@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    arrayForShowStates = [[NSMutableArray alloc] init];
    
    [arrayForShowStates addObject:@"Choose a service"];
    [arrayForShowStates addObject:@"Tell us what you need a fix"];
    [arrayForShowStates addObject:@"Get a real time quote"];
    [arrayForShowStates addObject:@"Schedule an appointment"];

    
    // Do any additional setup after loading the view, typically from a nib.
    [self registerNibForCeollectionViewCell];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonSkipDidPressed:(id)sender
{

    HelpViewController *helpView = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
    [self presentViewController:helpView animated:YES completion:^{
        
    }];
    
}

- (IBAction)changePage:(id)sender
{


}

#pragma mark  ============
#pragma mark - User Define Fncations

-(void)registerNibForCeollectionViewCell
{

    [collectionViewStates registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCellIdentifier"];
}
- (IBAction)clickPageControl:(id)sender
{
    CGRect frame;
    frame.origin.x = collectionViewStates.frame.size.width * pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = collectionViewStates.frame.size;
    [collectionViewStates scrollRectToVisible:frame animated:YES];
}


#pragma mark - ===============


#pragma mark - ===============
#pragma mark - Collection View Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [arrayForShowStates count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCellIdentifier" forIndexPath:indexPath];
    
    [cell.lblCollection setText:[arrayForShowStates objectAtIndex:indexPath.row]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    
    if (iOSDeviceScreenSize.height==480)
    {
        return CGSizeMake(iOSDeviceScreenSize.width,568);
    }
    else
        return CGSizeMake(iOSDeviceScreenSize.width,iOSDeviceScreenSize.height);
}
#pragma mark - ===============


#pragma mark - ===============
#pragma mark - Scroll view delegate
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = collectionViewStates.frame.size.width;
    int page = floor((collectionViewStates.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
    
    
}
#pragma mark - ===============


@end
