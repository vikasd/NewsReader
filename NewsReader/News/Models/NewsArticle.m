//
//  NewsArticle.m
//  NewsReader
//
//  Created by vikas dalvi on 06/01/24.
//

#import "NewsArticle.h"

@implementation NewsArticle

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    
    NSDictionary *source = (NSDictionary *) [dictionary valueForKey:@"source"];
    self.source = [[Source alloc] initWithDictionary:source];
    
    self.author = (NSString *)[dictionary valueForKey:@"author"];
    self.title = (NSString *)[dictionary valueForKey:@"title"];
    self.newsDescription = (NSString *)[dictionary valueForKey:@"description"];
    self.url = (NSString *)[dictionary valueForKey:@"url"];
    self.urlToImage = (NSString *)[dictionary valueForKey:@"urlToImage"];
    
    if (![_urlToImage isKindOfClass:[NSString class]]) {
        _urlToImage = nil;
    }
    
    self.publishedAt = (NSString *)[dictionary valueForKey:@"publishedAt"];
    self.content = (NSString *)[dictionary valueForKey:@"content"];
    
    return self;
}

@end

@implementation Source

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    
    self.sourceId = (NSString *) [dictionary valueForKey:@"id"];
    self.name = (NSString *) [dictionary valueForKey:@"name"];
    
    return self;
}

@end
