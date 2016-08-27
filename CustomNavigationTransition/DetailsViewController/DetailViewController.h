//
//  DetailViewController.h
//  CustomNavigationTransition
//
//  Created by Avinash Kashyap on 8/22/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) UIImage *selectedImage;
@end
