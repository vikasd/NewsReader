//
//  NewsListViewModel.h
//  NewsReader
//
//  Created by vikas dalvi on 08/01/24.
//

#import <Foundation/Foundation.h>
#import "NewsArticleViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsListViewModel : NSObject

@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic, assign) NSInteger totalArticles;

- (void)appendArticles:(NSArray <NewsArticleViewModel *>*) articles;
- (void)appendArticle:(NewsArticleViewModel *) article;
- (NewsArticleViewModel *)getArticle:(NSUInteger)index;

- (void)getData:(nullable void(^)(NSError * _Nullable error)) completionBlock;


@end

NS_ASSUME_NONNULL_END
