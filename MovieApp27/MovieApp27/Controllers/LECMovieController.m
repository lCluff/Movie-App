//
//  LECMovieController.m
//  MovieApp27
//
//  Created by Leah Cluff on 7/5/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

#import "LECMovieController.h"
#import "LECMovie.h"

NSString *const baseURL = @"https://api.themoviedb.org/3/search/movie";
NSString *const searchComponent = @"search";
NSString *const movieComponenet = @"movie";
NSString *const apiKeyComponent = @"api_key";
NSString *const apiKeyValueComponent = @"874336b73125cd2b1be8f03b5b5df600";
NSString *const queryComponent = @"query";

@implementation LECMovieController

+ (instancetype)shared
{
    static LECMovieController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [LECMovieController new];
    });
    return shared;
}

- (void)fetchMovieWith:(NSString *)searchTerm completion:(void (^)(NSArray<LECMovie *> * _Nullable))completion
{
    NSURL *url = [NSURL URLWithString:baseURL];
    NSURLQueryItem *apiKey = [[NSURLQueryItem alloc] initWithName:apiKeyComponent value:apiKeyValueComponent];
    NSURLQueryItem *query = [[NSURLQueryItem alloc] initWithName:queryComponent value:searchTerm];
    NSURLComponents * components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:true];
    [components setQueryItems:@[apiKey, query]];
    NSURL *finalURL = [components URL];
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (!data) {
            NSLog(@"oh h*ck no error found");
            completion(nil);
            return;
        }
        if (data) {
            NSMutableArray *movies = [NSMutableArray new];
            NSDictionary *topLevelJSON = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            NSArray *resultsArray = topLevelJSON[@"results"];
            for (NSDictionary *resultDictionary in resultsArray) {
                LECMovie *movie = [[LECMovie alloc] initWithDictionary:resultDictionary];
                [movies addObject:movie];
            }
            self.movies = movies;
            completion(movies);
            return;
        }
    }]resume];
}
@end

