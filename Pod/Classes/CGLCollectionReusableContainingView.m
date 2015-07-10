//
//  CGLCollectionReusableContainingView.m
//
//  Created by Christopher Ladd on 3/24/15.
//  Copyright (c) 2015 Christopher Ladd. All rights reserved.
//

#import "CGLCollectionReusableContainingView.h"

@implementation CGLCollectionReusableContainingView

- (void)setView:(UIView *)view {
    if (view != _view) {
        [_view removeFromSuperview];
        _view = view;
        
        _view.frame = self.bounds;
        [self addSubview:_view];
    }
}

@end
