//
//  NewsArticleViewModel.h
//  NewsReader
//
//  Created by vikas dalvi on 08/01/24.
//

#import <Foundation/Foundation.h>
#import "NewsArticle.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsArticleViewModel : NSObject

- (instancetype)init:(NewsArticle *)article;

@property (nonatomic, readonly, strong) NSString *date;
@property (nonatomic, readonly, strong) NSString *title;
@property (nonatomic, readonly, strong) NSString *content;
@property (nonatomic, readonly, strong) NSURL *image;
@property (nonatomic, readonly, strong) NSURL *url;

@end

NS_ASSUME_NONNULL_END
