//
//  NewsArticleViewModel.m
//  NewsReader
//
//  Created by vikas dalvi on 08/01/24.
//

#import "NewsArticleViewModel.h"
#import "NSDate+Format.h"

@implementation NewsArticleViewModel {
    
    NewsArticle *_article;
}

- (instancetype)init:(NewsArticle *)article {
    self = [super init];
    _article = article;
    return self;
}

- (NSString *)title { return _article.title; }
- (NSString *)content { return _article.content; }

- (NSURL *)image {
    NSURL *url = [NSURL URLWithString:_article.urlToImage];
    if (url != nil) {
        return url;
    }
    return nil;
}
- (NSURL *)url { return [NSURL URLWithString:_article.url]; }

- (NSString *)date {
    
    NSDate *date = [NSDate dateFromString:_article.publishedAt
                                   format:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSString *dateString = [NSDate stringFromDate:date format:@"dd MMM yyyy"];
    return dateString;
}

@end
