//
//  ImageCollectionViewController.h
//  CustomNavigationTransition
//
//  Created by Avinash Kashyap on 8/22/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCollectionViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate>

@property (nonatomic, strong) NSMutableArray *collectionArrray;
@property (nonatomic, weak) IBOutlet UICollectionView  *imageCollectionView;
@end
