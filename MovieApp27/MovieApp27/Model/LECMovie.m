//
//  LECMovie.m
//  MovieApp27
//
//  Created by Leah Cluff on 7/5/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

#import "LECMovie.h"

@implementation LECMovie

- (instancetype)initWithTitle:(NSString *)title
                    andRating:(NSNumber *)rating
                   andSummary:(NSString *)summary
{
    self = [super init];
    if (self) {
        _title = title;
        _rating = rating;
        _summary = summary;
    }
    return self;
}
@end

@implementation LECMovie(JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSNumber *rating = dictionary[@"vote_average"];
    NSString *summary = dictionary[@"overview"];
    
    return [self initWithTitle:title andRating:rating andSummary:summary];
}

@end


