//
//  CustomTransition.h
//  CustomNavigationTransition
//
//  Created by Avinash Kashyap on 8/22/16.
//  Copyright © 2016 Headerlabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kTransitionDuration 0.35

@interface CustomTransition : NSObject<UIViewControllerAnimatedTransitioning>
{
    CGRect initialRect;
    BOOL isReverse;
}
-(instancetype) init;
-(instancetype) initWithReverse:(BOOL)value;
-(instancetype) initWithInitialFrame:(CGRect)frame withPresentation:(BOOL)value;
@end
