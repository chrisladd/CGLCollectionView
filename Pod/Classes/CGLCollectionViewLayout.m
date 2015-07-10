//
//  CGLCollectionViewLayout.m
//  SFN
//
//  Created by Christopher Ladd on 12/24/14.
//  Copyright (c) 2014 Christopher Ladd. All rights reserved.
//

#import "CGLCollectionViewLayout.h"

@interface CGLCollectionViewLayout ()
@property (nonatomic, copy) NSDictionary *keyedCellAttributes;
@end

@implementation CGLCollectionViewLayout

- (void)setCellAttributes:(NSArray *)cellAttributes {
    _cellAttributes = [cellAttributes copy];
    
    if (_cellAttributes) {
        self.keyedCellAttributes = [[NSDictionary alloc] initWithObjects:cellAttributes forKeys:[cellAttributes valueForKey:@"indexPath"]];
    }
    else {
        self.keyedCellAttributes = nil;
    }
}

- (void)prepareLayout {
    [super prepareLayout];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *matchingAttributes = [NSMutableArray array];
    
    for (UICollectionViewLayoutAttributes *attributes in self.cellAttributes) {
        if (CGRectIntersectsRect(rect, attributes.frame)) {
            [matchingAttributes addObject:attributes];
        }
    }

    for (UICollectionViewLayoutAttributes *attributes in self.supplementaryAttributes) {
        if (CGRectIntersectsRect(rect, attributes.frame)) {
            [matchingAttributes addObject:attributes];
        }
    }
    
    return matchingAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    for (UICollectionViewLayoutAttributes *attributes in self.supplementaryAttributes) {
        if ([attributes.representedElementKind isEqualToString:elementKind]) {
            if ([attributes.indexPath compare:indexPath] == NSOrderedSame) {
                return attributes;
            }
        }
    }
    
    // to avoid exceptions, just manufacture one on the fly if none is found
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    attributes.alpha = 0.0;
    attributes.frame = CGRectZero;
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = self.keyedCellAttributes[indexPath];
    
    // as a stopgap, supply dummy attributes if none was found.
    if (!attributes) {
        attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.alpha = 0.0;
        attributes.frame = CGRectZero;
    }
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (CGSize)collectionViewContentSize {
    return self.contentSize;
}

@end
