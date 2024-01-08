//
//  NewsResponseModel.h
//  NewsReader
//
//  Created by vikas dalvi on 06/01/24.
//

#import <Foundation/Foundation.h>
#import "NewsArticle.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsResponseModel: NSObject 

@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) NSInteger totalResults;
@property (nonatomic, strong) NSArray<NewsArticle *> *articles;

- (instancetype)init:(NSDictionary *) dictionary page:(NSUInteger) page;

@end

NS_ASSUME_NONNULL_END
