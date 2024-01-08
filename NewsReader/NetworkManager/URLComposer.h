//
//  URLComposer.h
//  NewsReader
//
//  Created by vikas dalvi on 08/01/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface URLComposer : NSObject

+ (NSURL *)compose:(NSString *)path parameters:(NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
