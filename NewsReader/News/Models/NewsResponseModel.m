//
//  NewsResponseModel.m
//  NewsReader
//
//  Created by vikas dalvi on 06/01/24.
//

#import "NewsResponseModel.h"

@implementation NewsResponseModel

- (instancetype)init:(NSDictionary *) dictionary page:(NSUInteger) page {
    
    self = [super init];
    self.page = page;
    self.status = (NSString *) [dictionary valueForKey:@"status"];
    self.totalResults = [(NSNumber *) [dictionary valueForKey:@"totalResults"] integerValue];
    
    NSMutableArray *articles = [@[] mutableCopy];
    NSArray *dictionaryArray = (NSArray<NSDictionary *> *)[dictionary valueForKey:@"articles"];
    for (NSDictionary *dict in dictionaryArray) {
        NewsArticle *article = [[NewsArticle alloc] initWithDictionary:dict];
        [articles addObject:article];
    }
    self.articles = articles;
    return self;
}

@end

