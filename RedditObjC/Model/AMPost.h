//
//  AMPost.h
//  RedditObjC
//
//  Created by Adam on 08/06/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMPost : NSObject

NS_ASSUME_NONNULL_BEGIN
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber *likeCount;
@property (nonatomic, readonly) NSNumber *commentCount;

- (instancetype) initWithTitle:(NSString *)title
                     likeCount:(NSNumber *)likeCount
                  commentCount:(NSNumber *)commentCount;
NS_ASSUME_NONNULL_END
@end

@interface AMPost (JSONConvertable)

- (instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end
