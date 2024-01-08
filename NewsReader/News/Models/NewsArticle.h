//
//  NewsArticle.h
//  NewsReader
//
//  Created by vikas dalvi on 06/01/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class Source;
@interface NewsArticle: NSObject

@property (nonatomic, strong) Source *source;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *newsDescription;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *urlToImage;
@property (nonatomic, strong) NSString *publishedAt;
@property (nonatomic, strong) NSString *content;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

@interface Source: NSObject

@property (nonatomic, strong) NSString *sourceId;
@property (nonatomic, strong) NSString *name;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
