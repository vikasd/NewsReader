//
//  AppConfiguration.m
//  NewsReader
//
//  Created by vikas dalvi on 08/01/24.
//

#import "AppConfiguration.h"

@implementation AppConfiguration {
    
    NSDictionary *_infoDictionary;
}

- (instancetype)init {
    
    self = [super init];
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *path = [mainBundle pathForResource:@"Info" ofType:@"plist"];
    _infoDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    
    return self;
}

- (NSString *)apiKey {
    return _infoDictionary[@"API_KEY"];
}

@end
