//
//  ImageCollectionViewController.m
//  CustomNavigationTransition
//
//  Created by Avinash Kashyap on 8/22/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import "ImageCollectionViewController.h"
#import "ImageCollectionViewCell.h"
#import "DetailsViewController/DetailViewController.h"
#import "CustomTransition.h"

@interface ImageCollectionViewController ()
{
    CGRect selectedRect;
}
@end

@implementation ImageCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.delegate = self;
    
    [self.imageCollectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:@"CellIdentifier"];
    self.collectionArrray = [[NSMutableArray alloc] init];
    for(int i = 1; i <=18; i++){
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.JPG",i]];
        [self.collectionArrray addObject:image];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark -
#pragma mark UICollectionViewDataSource
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.collectionArrray.count;
}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"CellIdentifier";
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.thumbnailImageView.image = [self.collectionArrray objectAtIndex:indexPath.row];
    return cell;
}
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [self displayImageViewerWithImage:[self.collectionArrray objectAtIndex:indexPath.row]];
}
-(void) displayImageViewerWithImage:(UIImage *)image{
    DetailViewController *detailsVC = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detailsVC.selectedImage = image;
    [self.navigationController pushViewController:detailsVC animated:YES];
}
#pragma mark- 
#pragma mark Navigation Controller Delegate
-(id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if ([toVC isKindOfClass:[DetailViewController class]]) {
        return [[CustomTransition alloc] initWithReverse:NO];
    }
    else if ([toVC isKindOfClass:[self class]]){
        return [[CustomTransition alloc] initWithReverse:NO];
    }
    return nil;
    
}
@end
