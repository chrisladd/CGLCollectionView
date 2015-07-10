//
//  CGLLayoutMarker.m
//
//  Created by Chris Ladd on 5/3/15.
//  Copyright (c) 2015 Christopher Ladd. All rights reserved.
//

#import "CGLLayoutMarker.h"

@interface CGLLayoutMarker ()
@property (nonatomic, readwrite) NSMutableDictionary *storage;
@property (nonatomic, readwrite) NSMutableArray *supplementaryAttributes;
@property (nonatomic, readwrite) NSMutableArray *cellAttributes;

@end

@implementation CGLLayoutMarker

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _storage = [NSMutableDictionary dictionary];
        _supplementaryAttributes = [NSMutableArray array];
        _cellAttributes = [NSMutableArray array];
    }
    
    return self;
}

@end
