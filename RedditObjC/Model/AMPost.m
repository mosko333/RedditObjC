//
//  AMPost.m
//  RedditObjC
//
//  Created by Adam on 08/06/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

#import "AMPost.h"

@implementation AMPost

- (instancetype) init
{
    return [self initWithTitle:@"" likeCount:@0 commentCount:@0];
}

- (instancetype) initWithTitle:(NSString *)title likeCount:(NSNumber *)likeCount commentCount:(NSNumber *)commentCount
{
    self = [super init];
    if (self) {
        _title = title;
        _likeCount = likeCount;
        _commentCount = commentCount;
    }
    return self;
}
@end

@implementation AMPost (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    // JSON
    NSString *title = dictionary[@"title"];
    NSNumber *likeCount = dictionary[@"ups"];
    NSNumber *commentCount = dictionary[@"num_comments"];
    
    return [self initWithTitle:title likeCount:likeCount commentCount:commentCount];
}

@end
