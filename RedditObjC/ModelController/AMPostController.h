//
//  AMPostController.h
//  RedditObjC
//
//  Created by Adam on 08/06/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AMPost;

@interface AMPostController : NSObject

+ (void) fetchPostForSeachTerm: (NSString *)searchTerm
                    completion: (void (^)(NSArray<AMPost *> * _Nullable))completion;

@end
