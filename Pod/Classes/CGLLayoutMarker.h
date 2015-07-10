//
//  CGLLayoutMarker.h
//
//  Created by Chris Ladd on 5/3/15.
//  Copyright (c) 2015 Christopher Ladd. All rights reserved.
//

@import UIKit;

/**
 *  CGLLayoutMarker is a parameter object for common layout needs. 
 *
 *  It is based on local variables commonly instantiated in the prepareLayout method of a custom UICollectionView.
 *
 *  You can use it to drastically simplify your UICollectionViewLayout objects, by passing this object around, and chunking your layout code into methods. All properties are completely arbitrary -- they are for your own use.
 */
@interface CGLLayoutMarker : NSObject

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat currentRowHeight;

@property (nonatomic) CGFloat lineSpacing;
@property (nonatomic) CGFloat interItemSpacing;

@property (nonatomic) UIEdgeInsets sectionInset;
@property (nonatomic) UIEdgeInsets itemInset;

/**
 *  Arbitrary key-value storage, for custom values not covered here.
 */
@property (nonatomic, readonly) NSMutableDictionary *storage;

@property (nonatomic, readonly) NSMutableArray *supplementaryAttributes;
@property (nonatomic, readonly) NSMutableArray *cellAttributes;

@end
