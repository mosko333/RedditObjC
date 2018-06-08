//
//  AMPostController.m
//  RedditObjC
//
//  Created by Adam on 08/06/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

#import "AMPostController.h"
#import "AMPost.h"
// https://www.reddit.com/r/funny.json

@implementation AMPostController

static NSString * const baseURLString = @"https://www.reddit.com/r/";

+ (void) fetchPostForSeachTerm: (NSString *)searchTerm completion: (void (^)(NSArray<AMPost *> * _Nullable))competion
{
    // URL
    NSURL *url = [[NSURL alloc] initWithString:baseURLString];
    url = [url URLByAppendingPathComponent:[searchTerm lowercaseString]];
    url = [url URLByAppendingPathExtension:@"json"];
    NSLog(@"🥞%@🥞", url);
    
}

@end
