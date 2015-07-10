//
//  CGLCollectionReusableContainingView.h
//
//  Created by Christopher Ladd on 3/24/15.
//  Copyright (c) 2015 Christopher Ladd. All rights reserved.
//

@import UIKit;

/**
 *  CGLCollectionReusableContainingView contains a single, other subview. It's suitable for lightweight collection view needs. Setting the "view" property will remove the previous variable from the view hierarchy, and set the frame of the new value to the bounds of the receiver.
 */
@interface CGLCollectionReusableContainingView : UICollectionViewCell
@property (nonatomic) UIView *view;
@end
