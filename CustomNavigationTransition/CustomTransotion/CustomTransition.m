//
//  CustomTransition.m
//  CustomNavigationTransition
//
//  Created by Avinash Kashyap on 8/22/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import "CustomTransition.h"

@implementation CustomTransition

-(instancetype) init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(instancetype) initWithInitialFrame:(CGRect)frame withPresentation:(BOOL)value{
    self = [super init];
    if (self) {
        isReverse = value;
        initialRect = frame;
    }
    return self;
}
-(instancetype) initWithReverse:(BOOL)value;{
    self = [super init];
    if (self) {
        isReverse = value;
    }
    return self;
}
#pragma mark -
-(NSTimeInterval) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.4;
}
-(void) animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    if (isReverse == YES) {
        [self dismissWithContextTransitioning:transitionContext];
    }
    else{
        [self presentWithContextTransitioning:transitionContext];
    }
}
#pragma mark -
-(void) presentWithContextTransitioning:(id<UIViewControllerContextTransitioning>)transitionContext{
    //1. get next viewcontroller(or controller will present after  completion transiton)
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //2. get parent view controller
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //3. The view in which the animated transition should take place.
    UIView *container = [transitionContext containerView];
    //4. set next contoller frame
    toViewController.view.frame = container.frame;
    //5. add next controller's view to animation view
    [container addSubview:toViewController.view];
    //------------
    //Animation code
    //6. initially scale present controller view to 0.1,
    toViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
    //7.scale the presenet controller's view to normal size
    [UIView animateKeyframesWithDuration:0.35 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0 animations:^{
            toViewController.view.transform = CGAffineTransformIdentity;
        }];
        
    } completion:^(BOOL finished) {
        // Remove destination snapshot
        [fromViewController.view removeFromSuperview];
        // Add destination controller to view
        [container addSubview:toViewController.view];
        // Finish transition
        [transitionContext completeTransition:finished];
    }];
}
-(void) dismissWithContextTransitioning:(id<UIViewControllerContextTransitioning>)transitionContext{
    //1. get perent viewcontroller(or controller will present after  completion transiton)
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //2. get current view controller
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //3. The view in which the animated transition should take place.
    UIView *container = [transitionContext containerView];
    //4. set next contoller frame
    toViewController.view.frame = container.frame;
    //5. add next controller's view to animation view
    [container addSubview:toViewController.view];
    //------------
    //Animation code
    //6. initially scale present controller view to 0.1,
    toViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
    //7.scale the current controller view to 0.1
    [UIView animateKeyframesWithDuration:0.35 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0 animations:^{
            fromViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);;
        }];
        //7.scale the presenet controller's view to normal size
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0 animations:^{
            toViewController.view.transform = CGAffineTransformMakeScale(1, 1);;
        }];
        
    } completion:^(BOOL finished) {
        // Remove destination snapshot
        [fromViewController.view removeFromSuperview];
        // Finish transition
        [transitionContext completeTransition:finished];
    }];
}
@end
