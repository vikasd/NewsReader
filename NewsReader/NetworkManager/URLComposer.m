//
//  URLComposer.m
//  NewsReader
//
//  Created by vikas dalvi on 08/01/24.
//

#import "URLComposer.h"

@implementation URLComposer

+ (NSURL *)compose:(NSString *)path parameters:(NSDictionary *) dictionary {
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:path];
    
    if ([dictionary count] > 0) {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        for (NSString *key in dictionary) {
            NSURLQueryItem *queryItem = [[NSURLQueryItem alloc] initWithName:key value:dictionary[key]];
            [items addObject:queryItem];
        }
        [components setQueryItems:items];
    }
    
    return [components URL];
}

@end
