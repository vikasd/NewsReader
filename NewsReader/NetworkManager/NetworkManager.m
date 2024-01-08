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
    
    NSDictionary *dictionary = @{@"page": [NSString stringWithFormat:@"%lu", page],
                                 @"pageSize": [NSString stringWithFormat:@"%lu", (unsigned long)limit],
                                 @"apiKey": apiKey,
                                 @"q": @"bitcoin"};
    
    NSURL *URL = [URLComposer compose:@"https://newsapi.org/v2/everything"
                           parameters: dictionary];
    
    [self callAPI:URL
       completion:^(NSData * _Nullable data,
                    NSError * _Nullable error) {
        
        if (error) {
            responseBlock(nil, error);
        } else {
            
            if (data != nil) {
                
                NSError *parsingError = nil;
                NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                         options:0 error:&parsingError];
                
                NewsResponseModel *model = [[NewsResponseModel alloc] init:jsonDict page:page];
                responseBlock(model, nil);
                
            } else {
                responseBlock(nil, error);
            }
        }
    }];
}

- (void)callAPI:(NSURL *) url
     completion:(void (^)(NSData * _Nullable,
                          NSError * _Nullable)) completion {
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionTask *task = [session dataTaskWithURL:url
                                    completionHandler:^(NSData * _Nullable data,
                                                        NSURLResponse * _Nullable response,
                                                        NSError * _Nullable error) {
        completion(data, error);
    }];
    [task resume];
}

@end

