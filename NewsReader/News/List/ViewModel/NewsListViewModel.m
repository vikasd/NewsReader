//
//  NewsListViewModel.m
//  NewsReader
//
//  Created by vikas dalvi on 08/01/24.
//

#import "NewsListViewModel.h"
#import "NetworkManager.h"
#import "AppConfiguration.h"

@implementation NewsListViewModel {
    NetworkManager *_networkManager;
    NSMutableArray <NewsArticleViewModel *> *_articles;
}

- (instancetype)init {
    self = [super init];
    _networkManager = [[NetworkManager alloc] init];
    _articles = [@[] mutableCopy];
    _currentPage = 1;
    return self;
}

- (NSInteger)totalArticles {
    return _totalArticles < 100 ? _totalArticles : 100;
}

- (void)appendArticle:(NewsArticleViewModel *)article {
    [_articles addObject:article];
}

- (void)appendArticles:(NSArray<NewsArticleViewModel *> *)articles {
    [_articles addObjectsFromArray:articles];
}

- (NewsArticleViewModel *)getArticle:(NSUInteger)index {
    
    if (index < _articles.count) {
        return [_articles objectAtIndex:index];
    } else {
        return nil;
    }
}


// MARK: Call API
- (void)getData:(void (^)(NSError * _Nullable))completionBlock {
    
    __block NewsListViewModel *weakSelf = self;
    
    [_networkManager getNews:[[[AppConfiguration alloc] init] apiKey]
                        page:_currentPage
                       limit:100
                    response:^(NewsResponseModel * _Nullable model, NSError * _Nullable error) {
        
        weakSelf.currentPage = model.page;
        weakSelf.totalArticles = model.totalResults;
        
        for (NewsArticle *article in model.articles) {
            NewsArticleViewModel *articleViewModel = [[NewsArticleViewModel alloc] init:article];
            [weakSelf appendArticle:articleViewModel];
        }
        
        completionBlock(error);
    }];
}

@end
