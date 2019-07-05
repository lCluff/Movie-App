//
//  LECMovieController.h
//  MovieApp27
//
//  Created by Leah Cluff on 7/5/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LECMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface LECMovieController : NSObject

@property (nonatomic) NSArray<LECMovie *> *movies;

+ (instancetype)shared;

- (void)fetchMovieWith:(NSString *)searchTerm completion:(void (^)(NSArray<LECMovie * > *_Nullable))completion;
@end

NS_ASSUME_NONNULL_END
