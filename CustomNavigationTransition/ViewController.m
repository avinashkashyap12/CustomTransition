//
//  ViewController.m
//  CustomNavigationTransition
//
//  Created by Avinash Kashyap on 8/22/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import "ViewController.h"
#import "ImageCollectionViewController.h"

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
#pragma mark -
-(IBAction)nextButtonAction:(UIButton *)sender{
    ImageCollectionViewController *imageCollectionVC = [[ImageCollectionViewController alloc] initWithNibName:@"ImageCollectionViewController" bundle:nil];
    [self.navigationController pushViewController:imageCollectionVC animated:YES];
}
@end
