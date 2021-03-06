//
//  AMPostController.m
//  RedditObjC
//
//  Created by Adam on 08/06/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

#import "AMPostController.h"
#import "AMPost.h"

@implementation AMPostController

static NSString * const baseURLString = @"https://www.reddit.com/r/";

+ (void) fetchPostForSeachTerm: (NSString *)searchTerm completion:(void (^)(NSArray<AMPost *> * _Nullable))completion
{
    // URL
    NSURL *url = [[NSURL alloc] initWithString:baseURLString];
    url = [url URLByAppendingPathComponent:[[searchTerm stringByReplacingOccurrencesOfString:@" " withString:@"+"]lowercaseString]];
    url = [url URLByAppendingPathExtension:@"json"];
    NSLog(@"🥞%@🥞", url);
    
    // DataTaks
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error with dataTask when fetching movie %@", error.localizedDescription);
            completion(nil);
            return;
        }
        if (!data) {
            NSLog(@"Couldn't get data from dataTask");
            completion(nil);
            return;
        }
        
        // Top Level Data
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = jsonDictionary[@"data"];
        NSDictionary *postDictionarys = dataDictionary[@"children"];
        NSMutableArray *posts = [[NSMutableArray alloc] init];
        for (NSDictionary *postDictionary in postDictionarys) {
            AMPost *post = [[AMPost alloc] initWithDictionary:postDictionary[@"data"]];
            [posts addObject:post];
        }
        completion(posts);
    }]resume];
}
@end
