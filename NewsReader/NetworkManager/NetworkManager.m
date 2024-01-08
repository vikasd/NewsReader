//
//  NetworkManager.m
//  NewsReader
//
//  Created by vikas dalvi on 06/01/24.
//

#import "NetworkManager.h"
#import "URLComposer.h"

@implementation NetworkManager

- (void)getNews:(NSString *)apiKey
           page:(NSUInteger)page
          limit:(NSUInteger)limit
       response:(void (^)(NewsResponseModel * _Nullable,
                          NSError * _Nullable))responseBlock {
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSDictionary *dictionary = @{@"page": [NSString stringWithFormat:@"%lu", page],
                                 @"pageSize": [NSString stringWithFormat:@"%lu", (unsigned long)limit],
                                 @"apiKey": apiKey,
                                 @"q": @"bitcoin"};
    
    NSURL *URL = [URLComposer compose:@"https://newsapi.org/v2/everything" parameters:dictionary];
    
    NSURLSessionTask *task = [session dataTaskWithURL:URL
                                    completionHandler:^(NSData * _Nullable data,
                                                        NSURLResponse * _Nullable response,
                                                        NSError * _Nullable error) {
        
        if (error) {
                // TODO: Throw error
            responseBlock(nil, error);
        } else {
            
            if (data != nil) {
                NSError *parsingError = nil;
                NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                         options:0 error:&parsingError];
                
                NewsResponseModel *model = [[NewsResponseModel alloc] init:jsonDict page:page];
                responseBlock(model, nil);
                
            } else {
                    // TODO: Throw error
                responseBlock(nil, error);
            }
        }
    }];
    
    [task resume];
}

@end

