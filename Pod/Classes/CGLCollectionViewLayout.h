//
//  CGLCollectionViewLayout.h
//  SFN
//
//  Created by Christopher Ladd on 12/24/14.
//  Copyright (c) 2014 Christopher Ladd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGLCollectionViewLayout : UICollectionViewLayout
@property (nonatomic, copy) NSArray *cellAttributes;
@property (nonatomic, copy) NSArray *supplementaryAttributes;
@property (nonatomic) CGSize contentSize;

@property (nonatomic) CGFloat minimumLineSpacing;
@property (nonatomic) CGFloat minimumInteritemSpacing;
@property (nonatomic) CGSize itemSize;
@property (nonatomic) UICollectionViewScrollDirection scrollDirection;
@property (nonatomic) UIEdgeInsets sectionInset;

@end
