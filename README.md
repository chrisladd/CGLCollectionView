## CGLCollectionView

CGLCollectionView contains helpers for common collection view operations. Most usefully, you'll find: 

### Custom Layouts

CGLCollectionViewLayout is designed as a base class for most custom collection view needs. Subclasses, for the most part, should be able to override `prepareLayout`, and set the generously provided properties to achieve very custom layouts:

```
@property (nonatomic, copy) NSArray *cellAttributes;
@property (nonatomic, copy) NSArray *supplementaryAttributes;
@property (nonatomic) CGSize contentSize;

@property (nonatomic) CGFloat minimumLineSpacing;
@property (nonatomic) CGFloat minimumInteritemSpacing;
@property (nonatomic) CGSize itemSize;
@property (nonatomic) UICollectionViewScrollDirection scrollDirection;
@property (nonatomic) UIEdgeInsets sectionInset;
```

The superclass, then, takes care of most other interfacing needed by `UICollectionView`, reducing the amount of boilerplate code you'll need to write to make custom collection views.

As part of these layouts, you might find it helpful to take advantage of `CGLCollectionViewLayoutAttributes`, which adds a `userInfo` field to attributes to hold onto arbitrary information.

### CGLLayoutMarker

Lastly, as part of your layout routines, you'll likely need to keep track of things like `x`, `y`, `width`, `height`, etc... and, at least in past uses, this has led to long `prepareLayout` methods, difficult to break up because of all of this necessary shared state about the canvas in which you're operating.

`CGLLayoutMarker` is a parameter object for common layout needs. It is based on local variables commonly instantiated in the prepareLayout method of a custom UICollectionView. You can use it to drastically simplify your UICollectionViewLayout objects, by passing this object around, and chunking your layout code into methods. All properties are completely arbitrary -- they are for your own use.

```
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
```

### Simple Cells

`CGLCollectionView` also includes `CGLCollectionReusableContainingView`, which contains a single, other subview. It's suitable for lightweight collection view needs. Setting the "view" property will remove the previous variable from the view hierarchy, and set the frame of the new value to the bounds of the receiver.
