//
//  LECMovie.h
//  MovieApp27
//
//  Created by Leah Cluff on 7/5/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LECMovie : NSObject

//Properties for app
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber *rating;
@property (nonatomic, readonly) NSString *summary;

- (instancetype)initWithTitle:(NSString *)title
                    andRating:(NSNumber *)rating
                    andSummary:(NSString *)summary;
@end
//Extension, json convertable

@interface  LECMovie(JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
