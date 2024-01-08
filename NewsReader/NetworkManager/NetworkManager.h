//
//  NetworkManager.h
//  NewsReader
//
//  Created by vikas dalvi on 06/01/24.
//

#import <Foundation/Foundation.h>
#import "NewsResponseModel.h"

NS_ASSUME_NONNULL_BEGIN


@interface NetworkManager : NSObject

- (void) getNews:(NSString *) apiKey
            page:(NSUInteger) page
           limit:(NSUInteger) limit
        response:(nullable void(^)(NewsResponseModel * _Nullable model, NSError * _Nullable error)) responseBlock;

@end

NS_ASSUME_NONNULL_END
